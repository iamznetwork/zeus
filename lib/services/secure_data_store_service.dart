import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zeus/models/secret.dart';
import 'package:zeus/services/crypto_service.dart';

class SecureDataStoreService {
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  static late Box secretsBox;
  static const String hiveEncryptionKeyKey = "hiveEncryptionKey";
  static const String userPasswordKey = "userPassword";
  static const String uid = "Zeus";

  // init the secure data store
  static initDataStore() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SecretAdapter());

    bool containsEncryptionKey = await containsHiveEncryptionKey();

    if (!containsEncryptionKey) {
      var newKey = Hive.generateSecureKey();
      await secureStorage.write(
          key: hiveEncryptionKeyKey, value: base64UrlEncode(newKey));
    }

    var encryptionKey = base64Url
        .decode(await secureStorage.read(key: hiveEncryptionKeyKey) ?? "");

    secretsBox = await Hive.openBox('secrets',
        encryptionCipher: HiveAesCipher(encryptionKey));

    if (!Hive.isAdapterRegistered(SecretAdapter().typeId)) {
      Hive.registerAdapter(SecretAdapter());
    }
  }

  static Future<List<Secret>> getSecrets() async {
    //var secretsBox = await Hive.openBox('secrets');

    List<Secret> ls = [];
    for (Secret s in secretsBox.values) {
      ls.add(s);
    }
    return ls;
  }

  static Future<void> updateSecret(Secret s) async {
    // var secretsBox = await Hive.openBox('secrets');
    await secretsBox.put(s.title, s);
  }

  static Future<void> deleteSecret(Secret s) async {
    // var secretsBox = await Hive.openBox('secrets');
    await secretsBox.delete(s.title);
  }

  static void emptySecrets() async {
    // var secretsBox = await Hive.openBox('secrets');
    // await secretsBox.deleteAll(secretsBox.keys);
  }

  static dumpSecretBox() async {
    // await Hive.initFlutter();
    // var secrets = await Hive.openBox('secrets');
    Map<dynamic, dynamic> s = secretsBox.toMap();
    s.forEach((key, value) {
      Secret _s = value as Secret;
      print(_s.toString());
    });
  }

  static Future<void> storeHashedUserPassword(String password) async {
    try {
      String passwordHash = CryptoService.hashPassword(password).toString();

      await secureStorage.write(key: userPasswordKey, value: passwordHash);
    } catch (e) {
      print("Error setting password: ");
      print(e);
    }

    // String storedPassword = await secureStorage.read(key: uid) ?? "";
    // String? storedPasswordAgain = await fetchHashedPassword();
  }

  static Future<bool> containsUserPassword() async {
    return await secureStorage.containsKey(key: userPasswordKey) &&
        await secureStorage.read(key: userPasswordKey) != null;
  }

  static Future<String?> fetchHashedUserPassword() async {
    return await secureStorage.read(key: userPasswordKey);
  }

  static Future<void> deleteHashedUserPassword() async {
    await secureStorage.delete(key: userPasswordKey);
  }

  static Future<bool> containsHiveEncryptionKey() async {
    return await secureStorage.containsKey(key: hiveEncryptionKeyKey) &&
        await secureStorage.read(key: hiveEncryptionKeyKey) != null;
  }
}
