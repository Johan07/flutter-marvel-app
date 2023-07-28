import 'dart:convert';

import 'package:crypto/crypto.dart';

class Md5Generator {
  String call(String value) {
    return md5.convert(utf8.encode(value)).toString();
  }
}
