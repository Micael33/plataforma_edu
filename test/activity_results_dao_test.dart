import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/activity_results_repository_impl.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/domain/entities/activity_result.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';

void main() {
  test('insert and query activity result for child', () async {
    final db = AppDatabase.test(NativeDatabase.memory());

    final childrenRepo = ChildrenRepositoryImpl(db);
    final activityRepo = ActivityResultsRepositoryImpl(db);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'Ana'));

    final now = DateTime.now();
    final resultId = await activityRepo.recordResult(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: now, score: 3));

    final results = await activityRepo.getResultsForChild(childId);

    expect(results.length, 1);
    expect(results.first.score, 3);
    expect(results.first.activityType, 'color_game');

    await db.close();
  });
}
