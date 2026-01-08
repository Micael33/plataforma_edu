import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/accessibility_provider.dart';

class AccessibilitySettingsPage extends ConsumerWidget {
  const AccessibilitySettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(accessibilityProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Acessibilidade')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Reduzir animações'),
              value: settings.reducedMotion,
              onChanged: (v) => ref.read(accessibilityProvider.notifier).setReducedMotion(v),
            ),
            SwitchListTile(
              title: const Text('Aumentar tamanho de texto'),
              value: settings.largeText,
              onChanged: (v) => ref.read(accessibilityProvider.notifier).setLargeText(v),
            ),
            SwitchListTile(
              title: const Text('Alto contraste'),
              value: settings.highContrast,
              onChanged: (v) => ref.read(accessibilityProvider.notifier).setHighContrast(v),
            ),
            const SizedBox(height: 12),
            Text('Dica: você pode ativar "Reduzir animações" para minimizar movimentos durante o uso.', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
