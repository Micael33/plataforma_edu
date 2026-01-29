import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/src/presentation/pages/memory_game_page.dart';

void main() {
  testWidgets('Memory game flips a card when tapped', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: MemoryGamePage())));

    // There should be several card widgets built (at least one row)
    expect(find.byType(Card), findsWidgets);

    // Tap the first card
    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();

    // After tapping, a revealed Text with emoji should be present
    expect(find.byType(Text), findsWidgets);
  });
}
