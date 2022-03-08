// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:example/app/app.dart';
import 'package:example/bounce_button_demo/bounce_button_demo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {

    testWidgets('renders BounceButtonDemo', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      expect(find.byType(BounceButtonDemo), findsOneWidget);
    });

  });
}
