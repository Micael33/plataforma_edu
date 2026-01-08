import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/user.dart';
import '../providers/users_provider.dart';
import '../providers/children_provider.dart';
import '../../domain/repositories/associations_repository.dart';
import '../../domain/repositories/users_repository.dart';

class CaregiversPage extends ConsumerWidget {
  const CaregiversPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersListProvider);
    final childrenAsync = ref.watch(childrenListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Responsáveis')),
      body: usersAsync.when(
        data: (users) {
          final caregivers = users.where((u) => u.role == UserRole.caregiver).toList();
          if (caregivers.isEmpty) {
            return const Center(child: Text('Nenhum responsável cadastrado'));
          }
          return ListView.builder(
            itemCount: caregivers.length,
            itemBuilder: (context, index) {
              final c = caregivers[index];
              return ListTile(
                title: Text(c.name),
                subtitle: Text(c.email),
                trailing: IconButton(
                  icon: const Icon(Icons.link),
                  onPressed: () async {
                    final children = childrenAsync.when(data: (v) => v, loading: () => [], error: (e, _) => []);
                    // open dialog to select children and associate
                    final selected = await showDialog<List<int>>(
                      context: context,
                      builder: (ctx) {
                        final selectedIds = <int>{};
                        return AlertDialog(
                          title: Text('Associar crianças a ${c.name}'),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ListView(
                              shrinkWrap: true,
                              children: children.map((ch) {
                                return CheckboxListTile(
                                  title: Text(ch.name),
                                  value: selectedIds.contains(ch.id),
                                  onChanged: (v) {
                                    if (v == true) {
                                      selectedIds.add(ch.id!);
                                    } else {
                                      selectedIds.remove(ch.id);
                                    }
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () => Navigator.of(ctx).pop(null), child: const Text('Cancelar')),
                            TextButton(onPressed: () => Navigator.of(ctx).pop(selectedIds.toList()), child: const Text('Salvar')),
                          ],
                        );
                      },
                    );

                    if (!context.mounted) return;

                    if (selected != null && selected.isNotEmpty) {
                      final assocRepo = GetIt.instance.get<AssociationsRepository>();
                      for (final childId in selected) {
                        await assocRepo.associateChildToCaregiver(childId: childId, caregiverId: c.id);
                      }
                      // refresh UI
                      ref.invalidate(usersListProvider);
                    }
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Erro: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // quick create caregiver (in real app show form)
          final repo = GetIt.instance.get<UsersRepository>();
          final id = DateTime.now().microsecondsSinceEpoch.toString();
          await repo.addUser(UserEntity(id: id, name: 'Responsável $id', email: 'resp+$id@example.com', role: UserRole.caregiver));
          // refresh
          ref.invalidate(usersListProvider);
        },
      ),
    );
  }
}
