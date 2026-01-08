import 'package:drift/drift.dart' as d;

import '../../domain/entities/user.dart';
import '../../domain/repositories/users_repository.dart';
import '../local/database.dart';

class UsersRepositoryImpl implements UsersRepository {
  final AppDatabase _db;

  UsersRepositoryImpl(this._db);

  @override
  Future<void> addUser(UserEntity user) async {
    final companion = UsersCompanion(
      id: d.Value(user.id),
      name: d.Value(user.name),
      email: d.Value(user.email),
      role: d.Value(user.role.name),
      createdAt: d.Value(DateTime.now()),
    );
    await _db.usersDao.insertUser(companion);
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final rows = await _db.usersDao.getAllUsers();
    return rows.map((r) => UserEntity(id: r.id, name: r.name, email: r.email ?? '', role: _roleFromString(r.role))).toList();
  }

  @override
  Future<UserEntity?> getUserById(String id) async {
    final r = await _db.usersDao.getById(id);
    if (r == null) return null;
    return UserEntity(id: r.id, name: r.name, email: r.email ?? '', role: _roleFromString(r.role));
  }

  UserRole _roleFromString(String s) {
    switch (s) {
      case 'child':
        return UserRole.child;
      case 'educator':
        return UserRole.educator;
      default:
        return UserRole.caregiver;
    }
  }
}
