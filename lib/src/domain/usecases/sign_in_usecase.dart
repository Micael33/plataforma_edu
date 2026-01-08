import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class SignInWithEmail {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  Future<UserEntity?> call(String email, String password) async {
    return repository.signInWithEmail(email, password);
  }
}
