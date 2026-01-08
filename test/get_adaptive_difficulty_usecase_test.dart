import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/activity_results_repository_impl.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/domain/usecases/get_adaptive_difficulty_usecase.dart';
import 'package:my_app/src/domain/entities/activity_result.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';
import 'package:my_app/src/domain/entities/difficulty.dart';

void main() {
  test('difficulty hard when avg high', () async {
    final db = AppDatabase.test(NativeDatabase.memory());
    final childrenRepo = ChildrenRepositoryImpl(db);
    final activityRepo = ActivityResultsRepositoryImpl(db);
    final usecase = GetAdaptiveDifficultyUseCase(activityRepo);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'Teste'));

    // insert several high-score results (baseline 5)
    for (var i = 0; i < 6; i++) {
      await activityRepo.recordResult(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: DateTime.now(), score: 5));
    }

    final diff = await usecase.call(childId, baselineMaxRounds: 5);
    expect(diff, equals(Difficulty.hard));

    await db.close();
  });

  test('difficulty easy when avg low', () async {
    final db = AppDatabase.test(NativeDatabase.memory());
    final childrenRepo = ChildrenRepositoryImpl(db);
    final activityRepo = ActivityResultsRepositoryImpl(db);
    final usecase = GetAdaptiveDifficultyUseCase(activityRepo);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'Teste 2'));

    for (var i = 0; i < 6; i++) {
      await activityRepo.recordResult(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: DateTime.now(), score: 1));
    }

    final diff = await usecase.call(childId, baselineMaxRounds: 5);
    expect(diff, equals(Difficulty.easy));

    await db.close();
  });
}
