import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:projeto50_app/main.dart';

void main() {
  testWidgets('App inicia e mostra o Dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: Projeto50App()));
    await tester.pumpAndSettle();

    expect(find.text('PROJETO 50'), findsOneWidget);
  });
}
