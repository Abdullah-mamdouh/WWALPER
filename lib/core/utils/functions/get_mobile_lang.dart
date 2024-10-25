import 'dart:io';

String lang = '';

getMobileLang() {
  String current = Platform.localeName;
  lang = current[0] + current[1];
}
