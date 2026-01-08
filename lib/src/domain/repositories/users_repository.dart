import '../entities/user.dart';

abstract class UsersRepository {
  Future<void> addUser(UserEntity user);
  Future<UserEntity?> getUserById(String id);
  Future<List<UserEntity>> getAllUsers();
}