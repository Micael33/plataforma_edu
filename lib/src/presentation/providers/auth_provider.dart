import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/users_repository.dart';

import 'package:get_it/get_it.dart';

final GetIt _injector = GetIt.instance;
final authRepositoryProvider = Provider<AuthRepository>((ref) => _injector<AuthRepository>());

class AuthState {
  final UserEntity? user;
  final bool loading;

  AuthState({this.user, this.loading = false});

  AuthState copyWith({UserEntity? user, bool? loading}) {
    return AuthState(user: user ?? this.user, loading: loading ?? this.loading);
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthNotifier(this.repository) : super(AuthState());

  Future<void> init() async {
    final id = await _storage.read(key: 'current_user_id');
    if (id != null) {
      final usersRepo = _injector<UsersRepository>();
      final u = await usersRepo.getUserById(id);
      state = state.copyWith(user: u);
    }
  }

  Future<UserEntity?> signInWithEmail(String email, String password) async {
    state = state.copyWith(loading: true);
    try {
      final user = await repository.signInWithEmail(email, password);
      if (user != null) {
        await _storage.write(key: 'current_user_id', value: user.id);
      }
      state = state.copyWith(user: user, loading: false);
      return user;
    } catch (e, s) {
      // ignore: avoid_print
      print('signInWithEmail error: $e\n$s');
      rethrow;
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> signOut() async {
    await repository.signOut();
    await _storage.delete(key: 'current_user_id');
    state = state.copyWith(user: null);
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthNotifier(repo);
});
