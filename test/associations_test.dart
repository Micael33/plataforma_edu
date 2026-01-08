import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/data/repositories/users_repository_impl.dart';
import 'package:my_app/src/data/repositories/associations_repository_impl.dart';
import 'package:my_app/src/domain/entities/user.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';

void main() {
  test('associate caregiver to child and retrieve', () async {
    final db = AppDatabase.test(NativeDatabase.memory());
    final childrenRepo = ChildrenRepositoryImpl(db);
    final usersRepo = UsersRepositoryImpl(db);
    final assocRepo = AssociationsRepositoryImpl(db);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'Ana', birthDate: DateTime(2017, 3, 10)));
    final caregiverId = DateTime.now().microsecondsSinceEpoch.toString();
    await usersRepo.addUser(UserEntity(id: caregiverId, name: 'Resp', email: 'r@example.com', role: UserRole.caregiver));

    await assocRepo.associateChildToCaregiver(childId: childId, caregiverId: caregiverId);

    final childIds = await assocRepo.getChildIdsForCaregiver(caregiverId);
    expect(childIds, contains(childId));

    await db.close();
  });
}
