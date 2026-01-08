import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/child_entity.dart';
import '../../domain/repositories/children_repository.dart';
import 'package:get_it/get_it.dart';

final _injector = GetIt.instance;
final childrenRepositoryProvider = Provider<ChildrenRepository>((ref) => _injector<ChildrenRepository>());

final childrenListProvider = StreamProvider.autoDispose<List<ChildEntity>>((ref) {
  final repo = ref.watch(childrenRepositoryProvider);
  return repo.watchChildren();
});
