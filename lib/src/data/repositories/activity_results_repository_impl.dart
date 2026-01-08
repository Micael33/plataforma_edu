import 'package:drift/drift.dart';

import '../../domain/entities/activity_result.dart';
import '../../domain/entities/difficulty.dart';
import '../../domain/repositories/activity_results_repository.dart';
import '../local/database.dart';

class ActivityResultsRepositoryImpl implements ActivityResultsRepository {
  final AppDatabase _db;

  ActivityResultsRepositoryImpl(this._db);

  @override
  Future<int> recordResult(ActivityResultEntity result) async {
    final companion = ActivityResultsCompanion.insert(
      activityType: result.activityType,
      childId: result.childId,
      timestamp: Value(result.timestamp),
      score: Value(result.score),
      difficulty: Value(result.difficulty.name),
    );

    return _db.activityResultsDao.insertResult(companion);
  }

  @override
  Future<List<ActivityResultEntity>> getResultsForChild(int childId) async {
    final rows = await _db.activityResultsDao.getResultsForChild(childId);
    return rows
        .map((r) {
          final diffStr = r.difficulty;
          final diff = Difficulty.values.firstWhere((e) => e.name == diffStr, orElse: () => Difficulty.normal);
          return ActivityResultEntity(id: r.id, activityType: r.activityType, childId: r.childId, timestamp: r.timestamp, score: r.score, difficulty: diff);
        })
        .toList();
  }

  @override
  Stream<List<ActivityResultEntity>> watchResultsForChild(int childId) {
    return _db.activityResultsDao.watchResultsForChild(childId).map((rows) => rows
        .map((r) => ActivityResultEntity(id: r.id, activityType: r.activityType, childId: r.childId, timestamp: r.timestamp, score: r.score))
        .toList());
  }
}
