import 'package:bounce_button/bounce_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Bounce Button', () {

    testWidgets('renders Bounce Button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BounceButton(
              onTap: () {},
              child: Container(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BounceButton), findsOneWidget);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BounceButton(
              onTap: () {},
              child: const Text('hello'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('renders child with correct text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BounceButton(
              onTap: () {},
              child: const Text('hello'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.widgetWithText(BounceButton, 'hello'), findsOneWidget);
    });

    testWidgets(
      '[InkWell] of [BounceButton] is visible and tappable',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BounceButton(
                onTap: () {},
                child: const Text('hello'),
              ),
            ),
          ),
        );
        await tester.ensureVisible(find.byType(InkWell));
        await tester.pumpAndSettle();
        await tester.tap(find.byType(InkWell));
        await tester.pumpAndSettle();
        expect(find.byType(InkWell), findsOneWidget);
      }
    );

    testWidgets('reverses correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: BounceButton(
                onTap: () {},
                reverse: true,
                child: const Text('hello'),
              ),
            ),
          ),
        ),
      );
      await tester.ensureVisible(find.byType(InkWell));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();
      expect(find.byType(InkWell), findsOneWidget);
    });

  });

}
