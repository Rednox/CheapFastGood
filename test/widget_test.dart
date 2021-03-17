// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cheap_fast_good/main.dart';

void main() {
  testWidgets('Cheap Fast Good Toggle Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    var findCheapSwitch = find.byKey(Key('Switch_CHEAP'));
    var findFastSwitch = find.byKey(Key('Switch_FAST'));
    var findGoodSwitch = find.byKey(Key('Switch_GOOD'));

    expect(findCheapSwitch, findsOneWidget);
    expect(findFastSwitch, findsOneWidget);
    expect(findGoodSwitch, findsOneWidget);

    expect((tester.firstWidget(findCheapSwitch) as Switch).activeColor,
        Colors.blue);
    expect(
        (tester.firstWidget(findFastSwitch) as Switch).activeColor, Colors.red);
    expect((tester.firstWidget(findGoodSwitch) as Switch).activeColor,
        Colors.green);

    expect(find.text('CHEAP'), findsOneWidget);
    expect(find.text('FAST'), findsOneWidget);
    expect(find.text('GOOD'), findsOneWidget);

    await tester.tap(find.byKey(Key('Switch_CHEAP')));
    await tester.pumpAndSettle();
    expect((tester.firstWidget(findCheapSwitch) as Switch).value, true);
    expect((tester.firstWidget(findFastSwitch) as Switch).value, false);
    expect((tester.firstWidget(findGoodSwitch) as Switch).value, false);

    await tester.tap(find.byKey(Key('Switch_FAST')));
    await tester.pumpAndSettle();

    expect((tester.firstWidget(findCheapSwitch) as Switch).value, true);
    expect((tester.firstWidget(findFastSwitch) as Switch).value, true);
    expect((tester.firstWidget(findGoodSwitch) as Switch).value, false);
    await tester.tap(find.byKey(Key('Switch_GOOD')));
    await tester.pumpAndSettle();

    expect((tester.firstWidget(findCheapSwitch) as Switch).value, true);
    expect((tester.firstWidget(findFastSwitch) as Switch).value, false);
    expect((tester.firstWidget(findGoodSwitch) as Switch).value, true);

    await tester.tap(find.byKey(Key('Switch_FAST')));
    await tester.pumpAndSettle();

    expect((tester.firstWidget(findCheapSwitch) as Switch).value, false);
    expect((tester.firstWidget(findFastSwitch) as Switch).value, true);
    expect((tester.firstWidget(findGoodSwitch) as Switch).value, true);
    await tester.tap(find.byKey(Key('Switch_CHEAP')));
    await tester.pumpAndSettle();

    expect((tester.firstWidget(findCheapSwitch) as Switch).value, true);
    expect((tester.firstWidget(findFastSwitch) as Switch).value, true);
    expect((tester.firstWidget(findGoodSwitch) as Switch).value, false);
  });
}
