import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/activity_results_repository_impl.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/domain/usecases/get_activity_report_usecase.dart';
import 'package:my_app/src/domain/entities/activity_result.dart';
import 'package:my_app/src/domain/entities/difficulty.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';

void main() {
  test('report aggregates counts and average', () async {
    final db = AppDatabase.test(NativeDatabase.memory());
    final childrenRepo = ChildrenRepositoryImpl(db);
    final activityRepo = ActivityResultsRepositoryImpl(db);
    final usecase = GetActivityReportUseCase(activityRepo);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'RelTest'));

    await activityRepo.recordResult(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: DateTime.now(), score: 5, difficulty: Difficulty.hard));
    await activityRepo.recordResult(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: DateTime.now(), score: 3, difficulty: Difficulty.normal));
    await activityRepo.recordResult(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: DateTime.now(), score: 1, difficulty: Difficulty.easy));

    final report = await usecase.call(childId);

    expect(report.totalAttempts, 3);
    expect(report.averageScore, closeTo((5 + 3 + 1) / 3, 0.001));
    expect(report.countsByDifficulty[Difficulty.hard], 1);
    expect(report.countsByDifficulty[Difficulty.normal], 1);
    expect(report.countsByDifficulty[Difficulty.easy], 1);

    await db.close();
  });
}
