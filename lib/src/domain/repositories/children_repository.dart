import '../entities/child_entity.dart';

abstract class ChildrenRepository {
  Future<int> addChild(ChildEntity child);
  Future<List<ChildEntity>> getChildren();
  Stream<List<ChildEntity>> watchChildren();
  Future<void> deleteChild(int id);
}