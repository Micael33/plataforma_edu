import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/users_repository.dart';

final _injector = GetIt.instance;
final usersRepositoryProvider = Provider<UsersRepository>((ref) => _injector<UsersRepository>());

final usersListProvider = FutureProvider.autoDispose<List<UserEntity>>((ref) async {
  final repo = ref.watch(usersRepositoryProvider);
  return repo.getAllUsers();
});
