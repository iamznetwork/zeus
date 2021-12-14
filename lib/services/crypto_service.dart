import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cryptography/cryptography.dart';

class CryptoService {
  static Digest hashPassword(String password) {
    var encodedPassword = utf8.encode(password);

    return sha256.convert(encodedPassword);
  }

  static void createHiveEncryptionKeyFromPassword() async {
    // 32 bytes are asked
    final algorithm = AesGcm.with256bits();

    // Generate a random 256-bit secret key
    final secretKey = await algorithm.newSecretKeyFromBytes([1, 2, 3]);
  }
}
