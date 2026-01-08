import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambiente de Aprendizagem'),
        actions: [
          if (auth.user != null)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await ref.read(authNotifierProvider.notifier).signOut();
                if (!context.mounted) return;
                Navigator.of(context).pushReplacementNamed('/login');
              },
            )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo${auth.user != null ? ', ${auth.user!.name}' : ''}!',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Aprenda de forma interativa com cursos e atividades práticas.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pushNamed('/reports'),
                        child: const Text('Meus Relatórios'),
                      ),
                      const SizedBox(width: 12),
                      if (auth.user == null) ...[
                        OutlinedButton(
                          onPressed: () => Navigator.of(context).pushNamed('/login'),
                          child: const Text('Entrar'),
                        ),
                        const SizedBox(width: 8),
                        FilledButton.tonal(
                          onPressed: () => Navigator.of(context).pushNamed('/signup'),
                          child: const Text('Cadastrar'),
                        ),
                      ]
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Recommended courses
            const Text('Cursos recomendados', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (i) => _CourseCard(index: i)),
              ),
            ),

            const SizedBox(height: 20),

            // Quick actions
            const Text('Acesso rápido', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _QuickAction(icon: Icons.play_circle_fill, label: 'Atividades', onTap: () => Navigator.of(context).pushNamed('/color-game', arguments: 0)),
                _QuickAction(icon: Icons.group, label: 'Crianças', onTap: () => Navigator.of(context).pushNamed('/children')),
                _QuickAction(icon: Icons.people, label: 'Responsáveis', onTap: () => Navigator.of(context).pushNamed('/caregivers')),
                _QuickAction(icon: Icons.bar_chart, label: 'Relatórios', onTap: () => Navigator.of(context).pushNamed('/reports')),
              ],
            ),

            const SizedBox(height: 20),

            // Footer / Tips
            const Text('Dicas para aprendizagem', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('1. Defina metas diárias para melhorar a retenção.'),
                    SizedBox(height: 6),
                    Text('2. Combine teoria e prática com as atividades interativas.'),
                    SizedBox(height: 6),
                    Text('3. Revise os relatórios de progresso regularmente.'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final int index;
  const _CourseCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Placeholder()),
            const SizedBox(height: 8),
            Text('Curso ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Básico • 4 módulos')
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [Icon(icon, size: 28), const SizedBox(width: 12), Expanded(child: Text(label))],
        ),
      ),
    );
  }
}
