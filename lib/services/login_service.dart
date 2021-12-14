import 'package:zeus/services/secure_data_store_service.dart';

import 'crypto_service.dart';

class LoginService {
  static Future<void> initLoginServices() async {
    // set the user password
    // SecureDataStoreService.storeUserPassword("123");
  }

  static Future<bool> loginUser(String password) async {
    // get the hash of userpassword stored in the secure storage
    String? storedPasswordHash =
        await SecureDataStoreService.fetchHashedUserPassword();

    // hash the password provided by the user
    String? providedPasswordHash =
        CryptoService.hashPassword(password).toString();

    if (storedPasswordHash == providedPasswordHash) {
      return true;
    }
    return false;
  }

  // do we already have an active user?
  static Future<bool> userAccountExists() async {
    return await SecureDataStoreService.containsUserPassword();
  }

  static Future<void> resetUserLogin() async {
    await SecureDataStoreService.deleteHashedUserPassword();
  }
}
