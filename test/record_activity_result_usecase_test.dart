import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/activity_results_repository_impl.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/domain/usecases/record_activity_result_usecase.dart';
import 'package:my_app/src/domain/entities/activity_result.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';

void main() {
  test('record activity result usecase stores result', () async {
    final db = AppDatabase.test(NativeDatabase.memory());

    final childrenRepo = ChildrenRepositoryImpl(db);
    final activityRepo = ActivityResultsRepositoryImpl(db);
    final usecase = RecordActivityResultUseCase(activityRepo);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'Pedro'));
    final now = DateTime.now();

    await usecase.call(ActivityResultEntity(activityType: 'color_game', childId: childId, timestamp: now, score: 2));

    final results = await activityRepo.getResultsForChild(childId);
    expect(results.length, 1);
    expect(results.first.score, 2);

    await db.close();
  });
}
