import 'package:web/web.dart' as web;

void syncWebDocumentLocale(String languageCode) {
  web.document.documentElement?.setAttribute('lang', languageCode);
}
