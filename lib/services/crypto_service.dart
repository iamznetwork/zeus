import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:cryptography/cryptography.dart';
import 'package:zeus/assets/constants.dart' as constants;

class CryptoService {
  static Future<String> hashPasswordOld(String password) async {
    final utf8password = utf8.encode(password);
    final algorithm = Sha256();
    final hash = await algorithm.hash(utf8password);
    // print('Hash: ${hash.bytes}');

    return utf8.decode(hash.bytes);
  }

  static Future<String> hashPassword(String password) async {
    final utf8password = utf8.encode(password);
    final algorithm = Sha256();
    final hash = await algorithm.hash(utf8password);
    // print('Hash: ${hash.bytes}');
    return hex.encode(hash.bytes);
  }

  static Future<List<int>> createKeyFromPassword(String password) async {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: 100000,
      bits: 256,
    );

    // Password we want to hash
    // final secretKey = SecretKey([1, 2, 3]);
    final secretKey = SecretKey(utf8.encode(password));

    // Some salt
    final List<int> nonce = utf8.encode(constants.appName);

    // Calculate a hash that can be stored in the database
    final newSecretKey = await pbkdf2.deriveKey(
      secretKey: secretKey,
      nonce: nonce,
    );
    final newSecretKeyBytes = await newSecretKey.extractBytes();
    // print('Result: $newSecretKeyBytes');
    return newSecretKeyBytes;
  }
}
