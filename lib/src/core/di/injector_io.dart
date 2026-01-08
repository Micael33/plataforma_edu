import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
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

Future<void> configureDependencies() async {
  // Firebase
  await Firebase.initializeApp();
  injector.registerLazySingleton<fb.FirebaseAuth>(() => fb.FirebaseAuth.instance);

  // Repositories
  final authRepo = AuthRepositoryImpl(injector<fb.FirebaseAuth>());
  injector.registerLazySingleton<AuthRepository>(() => authRepo);

  // Local DB
  final db = AppDatabase();
  injector.registerLazySingleton<AppDatabase>(() => db);

  // Repositories
  injector.registerLazySingleton<ChildrenRepository>(() => ChildrenRepositoryImpl(db));
  injector.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(db));
  injector.registerLazySingleton<AssociationsRepository>(() => AssociationsRepositoryImpl(db));
  injector.registerLazySingleton<ActivityResultsRepository>(() => ActivityResultsRepositoryImpl(db));

  // TTS
  injector.registerLazySingleton<flutter_tts.FlutterTts>(() => flutter_tts.FlutterTts());
}
