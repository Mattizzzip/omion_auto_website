import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omion_auto_website/l10n/locale_controller.dart';
import 'package:omion_auto_website/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<void> pumpDesktopApp(
    WidgetTester tester, {
    required LocaleController controller,
  }) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(MyApp(localeController: controller));
    await tester.pumpAndSettle();
  }

  testWidgets('shows English landing copy by default', (tester) async {
    await pumpDesktopApp(tester, controller: LocaleController());

    expect(find.text('How it works'), findsWidgets);
    expect(find.text('Smart Vehicle Telematics in Your Pocket'), findsOneWidget);
  });

  testWidgets('switches landing copy to Russian', (tester) async {
    await pumpDesktopApp(tester, controller: LocaleController());

    await tester.tap(find.text('RU').first);
    await tester.pumpAndSettle();

    expect(find.text('Как это работает'), findsWidgets);
    expect(
      find.text('Умная автомобильная телематика у вас в кармане'),
      findsOneWidget,
    );
  });
}
