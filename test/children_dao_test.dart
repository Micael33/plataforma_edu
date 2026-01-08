import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';

void main() {
  test('insert and query child', () async {
    final db = AppDatabase.test(NativeDatabase.memory());
    final repo = ChildrenRepositoryImpl(db);

    final id = await repo.addChild(ChildEntity(name: 'João', birthDate: DateTime(2018, 5, 20)));
    final children = await repo.getChildren();

    expect(children.length, 1);
    expect(children.first.name, 'João');

    await db.close();
  });
}
