import 'package:drift/drift.dart' as d;

import '../../domain/entities/child_entity.dart';
import '../../domain/repositories/children_repository.dart';
import '../local/database.dart';

class ChildrenRepositoryImpl implements ChildrenRepository {
  final AppDatabase _db;

  ChildrenRepositoryImpl(this._db);

  @override
  Future<int> addChild(ChildEntity child) async {
    final companion = ChildrenCompanion(
      name: d.Value(child.name),
      birthDate: d.Value(child.birthDate),
      profile: d.Value(child.profile),
      points: d.Value(child.points),
    );
    return _db.childrenDao.insertChild(companion);
  }

  @override
  Future<void> deleteChild(int id) async {
    await _db.childrenDao.deleteChildById(id);
  }

  @override
  Future<List<ChildEntity>> getChildren() async {
    final rows = await _db.childrenDao.getAllChildren();
    return rows.map((r) => ChildEntity(id: r.id, name: r.name, birthDate: r.birthDate, profile: r.profile, points: r.points)).toList();
  }

  @override
  Stream<List<ChildEntity>> watchChildren() {
    return _db.childrenDao.watchAllChildren().map((rows) => rows.map((r) => ChildEntity(id: r.id, name: r.name, birthDate: r.birthDate, profile: r.profile, points: r.points)).toList());
  }
}
