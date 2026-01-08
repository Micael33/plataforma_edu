import 'package:drift/drift.dart';
import 'tables.dart';

// Use conditional import to select an appropriate QueryExecutor for the platform
import 'database_io.dart' if (dart.library.html) 'database_web.dart' as impl;

part 'database.g.dart';

@DriftDatabase(tables: [Children, Users, CaregiverChildren, ActivityResults], daos: [ChildrenDao, UsersDao, AssociationsDao, ActivityResultsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // For tests
  AppDatabase.test(super.e);

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() => impl.openConnection();

@DriftAccessor(tables: [Children])
class ChildrenDao extends DatabaseAccessor<AppDatabase> with _$ChildrenDaoMixin {
  final AppDatabase db;
  ChildrenDao(this.db) : super(db);

  Future<int> insertChild(Insertable<ChildrenData> child) => into(children).insert(child);
  Future<List<ChildrenData>> getAllChildren() => select(children).get();
  Stream<List<ChildrenData>> watchAllChildren() => select(children).watch();
  Future<ChildrenData?> getById(int id) => (select(children)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Future<bool> updateChild(Insertable<ChildrenData> child) => update(children).replace(child);
  Future<int> deleteChildById(int id) => (delete(children)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  final AppDatabase db;
  UsersDao(this.db) : super(db);

  Future<void> insertUser(Insertable<User> user) => into(users).insert(user, mode: InsertMode.insertOrReplace);
  Future<User?> getById(String id) => (select(users)..where((u) => u.id.equals(id))).getSingleOrNull();
  Future<List<User>> getAllUsers() => select(users).get();
}

@DriftAccessor(tables: [CaregiverChildren, Children])
class AssociationsDao extends DatabaseAccessor<AppDatabase> with _$AssociationsDaoMixin {
  final AppDatabase db;
  AssociationsDao(this.db) : super(db);

  Future<int> insertAssociation(Insertable<CaregiverChildrenData> assoc) => into(caregiverChildren).insert(assoc, mode: InsertMode.insertOrReplace);

  Future<List<ChildrenData>> getChildrenForCaregiver(String caregiverId) async {
    final result = await customSelect(
      'SELECT children.* FROM children INNER JOIN caregiver_children ON children.id = caregiver_children.child_id WHERE caregiver_children.caregiver_id = ?',
      variables: [Variable.withString(caregiverId)],
      readsFrom: {children, caregiverChildren},
    ).get();

    return result.map((row) => ChildrenData.fromJson(row.data)).toList();
  }

  Future<List<User>> getCaregiversForChild(int childId) async {
    final result = await customSelect(
      'SELECT users.* FROM users INNER JOIN caregiver_children ON users.id = caregiver_children.caregiver_id WHERE caregiver_children.child_id = ?',
      variables: [Variable.withInt(childId)],
      readsFrom: {users, caregiverChildren},
    ).get();

    return result.map((row) => User.fromJson(row.data)).toList();
  }
}

@DriftAccessor(tables: [ActivityResults])
class ActivityResultsDao extends DatabaseAccessor<AppDatabase> with _$ActivityResultsDaoMixin {
  final AppDatabase db;
  ActivityResultsDao(this.db) : super(db);

  Future<int> insertResult(Insertable<ActivityResult> result) => into(activityResults).insert(result);

  Future<List<ActivityResult>> getResultsForChild(int childId) => (select(activityResults)..where((t) => t.childId.equals(childId))).get();

  Stream<List<ActivityResult>> watchResultsForChild(int childId) => (select(activityResults)..where((t) => t.childId.equals(childId))).watch();

  Future<int> deleteById(int id) => (delete(activityResults)..where((t) => t.id.equals(id))).go();

  Future<List<ActivityResult>> getAllResults() => select(activityResults).get();
}
