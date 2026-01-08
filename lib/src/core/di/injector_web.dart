import 'package:get_it/get_it.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../../data/local/database.dart';
import '../../data/repositories/children_repository_impl.dart';
import '../../domain/repositories/children_repository.dart';
import '../../data/repositories/activity_results_repository_impl.dart';
import '../../domain/repositories/activity_results_repository.dart';
import '../../data/repositories/users_repository_impl.dart';
import '../../domain/repositories/users_repository.dart';
import '../../data/repositories/associations_repository_impl.dart';
import '../../domain/repositories/associations_repository.dart';
import 'package:flutter_tts/flutter_tts.dart' as flutter_tts;

final GetIt injector = GetIt.instance;

class FakeAuthRepository implements AuthRepository {
  Future<UserEntity?> _findByEmail(String email) async {
    final usersRepo = injector<UsersRepository>();
    final users = await usersRepo.getAllUsers();
    for (final u in users) {
      if (u.email.toLowerCase() == email.toLowerCase()) return u;
    }
    return null;
  }

  @override
  Future<UserEntity?> signInWithEmail(String email, String password) async {
    // Passwords are not stored in the local DB for this fake; accept if user exists
    return await _findByEmail(email);
  }

  @override
  Future<UserEntity?> signInWithGoogle() async {
    // Return the first user if any (simulates social login)
    final users = await injector<UsersRepository>().getAllUsers();
    return users.isNotEmpty ? users.first : null;
  }

  @override
  Future<void> signOut() async {}
}

Future<void> configureDependencies() async {
  // Local DB
  final db = AppDatabase();
  injector.registerLazySingleton<AppDatabase>(() => db);

  // Repositories
  injector.registerLazySingleton<ChildrenRepository>(() => ChildrenRepositoryImpl(db));
  injector.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(db));
  injector.registerLazySingleton<AssociationsRepository>(() => AssociationsRepositoryImpl(db));
  injector.registerLazySingleton<ActivityResultsRepository>(() => ActivityResultsRepositoryImpl(db));

  // Fake Auth for web (no real Firebase initialization)
  injector.registerLazySingleton<AuthRepository>(() => FakeAuthRepository());

  // TTS
  injector.registerLazySingleton<flutter_tts.FlutterTts>(() => flutter_tts.FlutterTts());
}
