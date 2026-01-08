import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/children_provider.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios')),
      body: childrenAsync.when(
        data: (children) {
          if (children.isEmpty) return const Center(child: Text('Nenhuma criança cadastrada'));
          return ListView.builder(
            itemCount: children.length,
            itemBuilder: (context, index) {
              final c = children[index];
              return ListTile(
                title: Text(c.name),
                subtitle: Text('ID: ${c.id}'),
                trailing: TextButton(onPressed: () => Navigator.of(context).pushNamed('/report-details', arguments: c.id), child: const Text('Ver')),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Erro: $e')),
      ),
    );
  }
}