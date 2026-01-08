import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/color_game_provider.dart';

class ColorGamePage extends ConsumerStatefulWidget {
  final int childId;
  const ColorGamePage({Key? key, required this.childId}) : super(key: key);

  @override
  ConsumerState<ColorGamePage> createState() => _ColorGamePageState();
}

class _ColorGamePageState extends ConsumerState<ColorGamePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(colorGameProvider(widget.childId).notifier).startNewRound();
    });
  }

  Color _colorFromName(String name) {
    switch (name) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(colorGameProvider(widget.childId));
    final notifier = ref.read(colorGameProvider(widget.childId).notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Jogo de Cores')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Rodada: ${state.round}', style: Theme.of(context).textTheme.titleLarge),
            Text('Pontuação: ${state.score}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),            Text('Dificuldade: ${state.difficulty.name}', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: List.generate(state.tiles.length, (index) {
                  final name = state.tiles[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _colorFromName(name),
                      minimumSize: const Size.fromHeight(120),
                    ),
                    onPressed: state.finished ? null : () => notifier.select(index),
                    child: Semantics(
                      label: 'Botão cor $name',
                      button: true,
                      child: const SizedBox.shrink(),
                    ),
                  );
                }),
              ),
            ),
            if (state.finished) ...[
              const SizedBox(height: 8),
              Text('Fim! Sua pontuação: ${state.score}'),
              ElevatedButton(
                onPressed: () {
                  ref.read(colorGameProvider(widget.childId).notifier).startNewRound();
                },
                child: const Text('Jogar novamente'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
