import '../entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity?> signInWithEmail(String email, String password);
  Future<UserEntity?> signInWithGoogle();
  Future<void> signOut();
}