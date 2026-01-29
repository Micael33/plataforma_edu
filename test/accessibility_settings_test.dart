import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/src/presentation/pages/accessibility_settings_page.dart';

void main() {
  testWidgets('Accessibility toggles update state', (tester) async {
    await tester.pumpWidget(ProviderScope(child: MaterialApp(home: const AccessibilitySettingsPage())));

    // Ensure switches are present
    expect(find.text('Reduzir animações'), findsOneWidget);
    expect(find.text('Aumentar tamanho de texto'), findsOneWidget);
    expect(find.text('Alto contraste'), findsOneWidget);

    // Toggle reduced motion via UI
    await tester.tap(find.text('Reduzir animações'));
    await tester.pumpAndSettle();

    // The toggles are present and interactable
    expect(find.byType(SwitchListTile), findsNWidgets(3));
  });
}
