import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/src/domain/entities/user.dart';
import 'package:my_app/src/domain/repositories/auth_repository.dart';
import 'package:my_app/src/domain/usecases/sign_in_usecase.dart';

class FakeAuthRepo implements AuthRepository {
  final UserEntity? _user;
  FakeAuthRepo(this._user);

  @override
  Future<UserEntity?> signInWithEmail(String email, String password) async {
    return _user;
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<UserEntity?> signInWithGoogle() async => _user;
}

void main() {
  test('SignInWithEmail returns user when repository returns user', () async {
    final repo = FakeAuthRepo(UserEntity(id: '1', name: 'Test', email: 't@t.com'));
    final usecase = SignInWithEmail(repo);

    final user = await usecase.call('t@t.com', 'pass');

    expect(user, isNotNull);
    expect(user!.email, 't@t.com');
  });
}
