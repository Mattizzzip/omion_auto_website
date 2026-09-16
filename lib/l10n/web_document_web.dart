import 'package:web/web.dart' as web;

void syncWebDocumentLocale(String languageCode) {
  try {
    web.document.documentElement?.setAttribute('lang', languageCode);
  } catch (_) {
    // DOM may be unavailable during early startup on some web runtimes.
  }
}
