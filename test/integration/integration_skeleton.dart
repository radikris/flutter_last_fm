// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';

//TODO WRITE INTEGRATION TEST
// void main() {
//   IntegrationTestWidgetsFlutterBinding binding = IntegrationTestWidgetsFlutterBinding();
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('album module', () {
//     final String testEmail = 'test@integration.flutter';
//     final String testPassword = 'realtesT123';

//     testWidgets("album fetch test", (WidgetTester tester) async {
//       app.main();
//       await tester.pumpAndSettle();
//       await tester.pump(longWaitDuration);
//       //MAIN

//       //await binding.convertFlutterSurfaceToImage(); //already available on stable channel as well

//       var button = find.text("text1");
//       await tester.tap(button);
//       await tester.pumpAndSettle();

//       await tester.tap(button);
//       await tester.pumpAndSettle();

//       button = find.text("text2");
//       await tester.tap(button);
//       await tester.pumpAndSettle();
//       //await takeScreenShotNow(binding, tester, 'account-login');
//       expect(find.text('${mockolt_albumok}!'), findsOneWidget);

//       await finishTest(tester);
//     });
//   });
// }
