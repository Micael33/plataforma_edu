import '../entities/difficulty.dart';
import '../repositories/activity_results_repository.dart';

/// Compute a difficulty level for a given child and baseline maxRounds.
/// Strategy: average past scores (normalized by baselineMaxRounds).
/// - avg >= 0.8 -> hard
/// - avg >= 0.5 -> normal
/// - else -> easy
class GetAdaptiveDifficultyUseCase {
  final ActivityResultsRepository repository;
  GetAdaptiveDifficultyUseCase(this.repository);

  Future<Difficulty> call(int childId, {int baselineMaxRounds = 5, int lastN = 10}) async {
    final results = await repository.getResultsForChild(childId);
    if (results.isEmpty) return Difficulty.normal;

    final last = results.takeLast(lastN);
    final total = last.fold<int>(0, (prev, r) => prev + r.score);
    final avgNormalized = total / (last.length * baselineMaxRounds);

    if (avgNormalized >= 0.8) return Difficulty.hard;
    if (avgNormalized >= 0.5) return Difficulty.normal;
    return Difficulty.easy;
  }
}

extension<E> on List<E> {
  List<E> takeLast(int n) {
    if (n <= 0) return [];
    if (length <= n) return this;
    return sublist(length - n);
  }
}
