import 'dart:math';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart' as _g;

import '../../domain/usecases/record_activity_result_usecase.dart';
import '../../domain/usecases/get_adaptive_difficulty_usecase.dart';
import '../../domain/entities/difficulty.dart';
import '../../domain/entities/activity_result.dart' show ActivityResultEntity;
import '../../domain/repositories/activity_results_repository.dart' show ActivityResultsRepository;

class ColorGameState {
  final List<String> tiles;
  final int? targetIndex;
  final int score;
  final int round;
  final bool finished;
  final Difficulty difficulty;

  ColorGameState({required this.tiles, this.targetIndex, this.score = 0, this.round = 0, this.finished = false, this.difficulty = Difficulty.normal});

  ColorGameState copyWith({List<String>? tiles, int? targetIndex, int? score, int? round, bool? finished, Difficulty? difficulty}) {
    return ColorGameState(
      tiles: tiles ?? this.tiles,
      targetIndex: targetIndex ?? this.targetIndex,
      score: score ?? this.score,
      round: round ?? this.round,
      finished: finished ?? this.finished,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}

class ColorGameNotifier extends StateNotifier<ColorGameState> {
  final RecordActivityResultUseCase _recordUseCase;
  final GetAdaptiveDifficultyUseCase _getDifficultyUseCase;
  final FlutterTts _tts;
  int _maxRounds;
  int _tilesCount;
  final int _childId;

  ColorGameNotifier(this._recordUseCase, this._getDifficultyUseCase, this._tts, this._childId, {int baselineMaxRounds = 5})
      : _maxRounds = baselineMaxRounds,
        _tilesCount = 4,
        super(ColorGameState(tiles: _generateTiles(4), score: 0, round: 0)) {
    // initialize difficulty asynchronously
    Future.microtask(() async => await _initDifficulty());
  }

  static List<String> _generateTiles(int count) {
    final template = ['red', 'green', 'blue', 'yellow', 'purple'];
    return List<String>.from(template.take(count));
  }

  void startNewRound() {
    final rnd = Random();
    final tiles = _generateTiles(_tilesCount)..shuffle(rnd);
    final target = rnd.nextInt(tiles.length);
    state = state.copyWith(tiles: tiles, targetIndex: target, round: state.round + 1);
    _speak('Toque na cor ${tiles[target]}');
  }

  Future<void> select(int index) async {
    if (state.finished || state.targetIndex == null) return;
    final correct = index == state.targetIndex;
    if (correct) {
      state = state.copyWith(score: state.score + 1);
      await _speak('Muito bem!');
    } else {
      await _speak('Tente novamente');
    }

    if (state.round >= _maxRounds) {
      await _finish();
    } else {
      startNewRound();
    }
  }

  Future<void> _speak(String text) async {
    try {
      await _tts.speak(text);
    } catch (_) {
      // ignore TTS errors
    }
  }

  Future<void> _finish() async {
    state = state.copyWith(finished: true);

    final now = DateTime.now();
    final resultEntity = ActivityResultEntity(
      activityType: 'color_game',
      childId: _childId,
      timestamp: now,
      score: state.score,
      difficulty: state.difficulty,
    );

    await _recordUseCase.call(resultEntity);
  }

  Future<void> _initDifficulty() async {
    try {
      final d = await _getDifficultyUseCase.call(_childId, baselineMaxRounds: 5);
      _applyDifficulty(d);
      // start first round after computing difficulty
      startNewRound();
    } catch (_) {
      // fallback to normal
      _applyDifficulty(Difficulty.normal);
      startNewRound();
    }
  }

  void _applyDifficulty(Difficulty d) {
    switch (d) {
      case Difficulty.easy:
        _tilesCount = 3;
        _maxRounds = 3;
        break;
      case Difficulty.normal:
        _tilesCount = 4;
        _maxRounds = 5;
        break;
      case Difficulty.hard:
        _tilesCount = 5;
        _maxRounds = 7;
        break;
    }

    state = state.copyWith(difficulty: d);
  }
}

final colorGameProvider = StateNotifierProvider.family<ColorGameNotifier, ColorGameState, int>((ref, childId) {
  final activityRepo = ref.read(_activityResultsRepositoryProvider);
  final tts = ref.read(_flutterTtsProvider);
  final recordUseCase = RecordActivityResultUseCase(activityRepo);
  final getDifficulty = GetAdaptiveDifficultyUseCase(activityRepo);
  return ColorGameNotifier(recordUseCase, getDifficulty, tts, childId);
});

// Simple providers to fetch dependencies from GetIt
final _activityResultsRepositoryProvider = Provider((ref) {
  // lazy: import GetIt here to retrieve instance
  return import_getit_activity_repo();
});

final _flutterTtsProvider = Provider<FlutterTts>((ref) {
  return import_getit_tts();
});

// Helper indirections to avoid leaking GetIt usage at top-level
ActivityResultsRepository import_getit_activity_repo() => _g.GetIt.instance<ActivityResultsRepository>();
FlutterTts import_getit_tts() => _g.GetIt.instance<FlutterTts>();