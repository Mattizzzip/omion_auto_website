import 'package:flutter/material.dart';
import 'package:omion_auto_website/l10n/web_document.dart'
    if (dart.library.js_interop) 'package:omion_auto_website/l10n/web_document_web.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends ChangeNotifier {
  static const supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

  static const _storageKey = 'app_locale';

  Locale _locale = _localeFromSystem();
  Locale get locale => _locale;

  LocaleController();

  static Locale _localeFromSystem() {
    final code = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    return code == 'ru' ? const Locale('ru') : const Locale('en');
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_storageKey);
    if (saved == 'ru' || saved == 'en') {
      _locale = Locale(saved!);
      notifyListeners();
    }
    syncWebDocumentLocale(_locale.languageCode);
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale.languageCode == locale.languageCode) return;
    _locale = locale;
    syncWebDocumentLocale(_locale.languageCode);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, locale.languageCode);
  }
}

class LocaleScope extends InheritedNotifier<LocaleController> {
  const LocaleScope({
    super.key,
    required LocaleController controller,
    required super.child,
  }) : super(notifier: controller);

  static LocaleController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope not found in the widget tree');
    return scope!.notifier!;
  }
}
