import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/accessibility_provider.dart';

class MemoryGamePage extends ConsumerStatefulWidget {
  final int childId;
  const MemoryGamePage({this.childId = 0, super.key});

  @override
  ConsumerState<MemoryGamePage> createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends ConsumerState<MemoryGamePage> {
  late List<String> _items;
  late List<bool> _revealed;
  late List<bool> _matched;
  int? _firstIndex;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    final base = ['🍎', '🚗', '🐶', '⭐', '🎵', '🍌'];
    _items = [...base, ...base];
    _items.shuffle();
    _revealed = List.filled(_items.length, false);
    _matched = List.filled(_items.length, false);
    _firstIndex = null;
    _busy = false;
    setState(() {});
  }

  void _onTapCard(int index) {
    if (_busy || _revealed[index] || _matched[index]) return;

    setState(() => _revealed[index] = true);

    if (_firstIndex == null) {
      _firstIndex = index;
      return;
    }

    final second = index;
    final first = _firstIndex!;

    if (_items[first] == _items[second]) {
      // match
      _matched[first] = true;
      _matched[second] = true;
      _firstIndex = null;

      if (_matched.every((m) => m)) {
        // won
        final reduced = ref.read(accessibilityProvider).reducedMotion;
        Future.delayed(Duration(milliseconds: reduced ? 150 : 300), () {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Parabéns!'),
              content: const Text('Você completou o jogo da memória.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _startNewGame();
                  },
                  child: const Text('Jogar novamente'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Fechar'),
                )
              ],
            ),
          );
        });
      }
      return;
    }

    // not a match
    _busy = true;
    final reduced = ref.read(accessibilityProvider).reducedMotion;
    Future.delayed(Duration(milliseconds: reduced ? 150 : 700), () {
      if (!mounted) return;
      setState(() {
        _revealed[first] = false;
        _revealed[second] = false;
        _firstIndex = null;
        _busy = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final columns = 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Memória'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _startNewGame,
            tooltip: 'Reiniciar',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: _items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final revealed = _revealed[index] || _matched[index];
                  return GestureDetector(
                    onTap: () => _onTapCard(index),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: ref.read(accessibilityProvider).reducedMotion ? 50 : 300),
                          child: revealed
                              ? Text(
                                  _items[index],
                                  key: ValueKey('revealed_$index'),
                                  style: const TextStyle(fontSize: 32),
                                )
                              : Container(
                                  key: ValueKey('hidden_$index'),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary.withAlpha((0.06 * 255).round()),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(Icons.help_outline, size: 28),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _startNewGame,
              icon: const Icon(Icons.replay),
              label: const Text('Reiniciar jogo'),
            )
          ],
        ),
      ),
    );
  }
}
