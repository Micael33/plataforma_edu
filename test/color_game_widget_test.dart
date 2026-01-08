import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/native.dart';

import 'package:my_app/src/presentation/pages/color_game_page.dart';
import 'package:my_app/src/data/local/database.dart';
import 'package:my_app/src/data/repositories/activity_results_repository_impl.dart';
import 'package:my_app/src/data/repositories/children_repository_impl.dart';
import 'package:my_app/src/domain/entities/child_entity.dart';
import 'package:my_app/src/domain/repositories/activity_results_repository.dart';

class _FakeTts implements FlutterTts {
  @override
  Future<dynamic> speak(String text, {bool focus = false}) async => 1;

  // implement no-op for unused methods via noSuchMethod
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  testWidgets('ColorGamePage displays and responds', (WidgetTester tester) async {
    final db = AppDatabase.test(NativeDatabase.memory());
    final childrenRepo = ChildrenRepositoryImpl(db);
    final activityRepo = ActivityResultsRepositoryImpl(db);

    final childId = await childrenRepo.addChild(ChildEntity(name: 'Test'));

    // Register dependencies in GetIt
    final g = GetIt.instance;
    await g.reset();
    g.registerSingleton<AppDatabase>(db);
    g.registerSingleton<ActivityResultsRepository>(activityRepo);
    g.registerSingleton<FlutterTts>(_FakeTts());

    await tester.pumpWidget(ProviderScope(child: MaterialApp(home: ColorGamePage(childId: childId))));

    expect(find.text('Jogo de Cores'), findsOneWidget);

    await db.close();
  });
}
