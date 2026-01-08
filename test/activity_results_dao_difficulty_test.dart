import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/activity_results_repository_impl.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/domain/entities/activity_result.dart';
import 'package:my_app/src/domain/entities/difficulty.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';

void main() {
  test('store and return difficulty', () async {
    final db = AppDatabase.test(NativeDatabase.memory());
    final childrenRepo = ChildrenRepositoryImpl(db);
    final activityRepo = ActivityResultsRepositoryImpl(db);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'Ana'));

    final now = DateTime.now();
    await activityRepo.recordResult(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: now, score: 4, difficulty: Difficulty.hard));

    final results = await activityRepo.getResultsForChild(childId);

    expect(results.length, 1);
    expect(results.first.difficulty, equals(Difficulty.hard));

    await db.close();
  });
}
