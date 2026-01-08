import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/report_provider.dart';
import '../../domain/entities/difficulty.dart';

class ReportDetailsPage extends ConsumerWidget {
  final int childId;
  const ReportDetailsPage({super.key, required this.childId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(activityReportProvider(childId));
    return Scaffold(
      appBar: AppBar(title: const Text('Relatório')),
      body: reportAsync.when(
        data: (r) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Criança ID: ${r.childId}', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Tentativas: ${r.totalAttempts}'),
                Text('Média: ${r.averageScore.toStringAsFixed(2)}'),
                const SizedBox(height: 16),
                Text('Distribuição por dificuldade:', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...r.countsByDifficulty.entries.map((e) => Text('${e.key.name}: ${e.value}'))
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Erro ao gerar relatório: $e')),
      ),
    );
  }
}