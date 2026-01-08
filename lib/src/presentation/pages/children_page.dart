import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/child_entity.dart';
import '../providers/children_provider.dart';

class ChildrenPage extends ConsumerWidget {
  const ChildrenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Crianças')),
      body: childrenAsync.when(
        data: (children) {
          if (children.isEmpty) return const Center(child: Text('Nenhuma criança cadastrada'));
          return ListView.builder(
            itemCount: children.length,
            itemBuilder: (context, index) {
              final c = children[index];
              return ListTile(
                title: Text(c.name),
                subtitle: Text('Pontos: ${c.points}'),
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
          final repo = ref.read(childrenRepositoryProvider);
          final now = DateTime.now();
          final child = ChildEntity(name: 'Criança ${now.microsecondsSinceEpoch}', birthDate: now);
          await repo.addChild(child);
        },
      ),
    );
  }
}
