import 'package:example/bounce_button_demo/bounce_button_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {

  group('Bounce Button Demo', () {

    testWidgets('onTap', (tester) async {
      await tester.pumpApp(const BounceButtonDemo());
      await tester.pumpAndSettle();
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();
      expect(find.byType(InkWell), findsOneWidget);
    });

  });

}
