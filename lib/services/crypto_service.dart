import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cryptography/cryptography.dart';

class CryptoService {
  static Digest hashPassword(String password) {
    var encodedPassword = utf8.encode(password);

    return sha256.convert(encodedPassword);
  }
}
