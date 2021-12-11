import 'package:flutter/material.dart';
import 'package:zeus/assets/constants.dart';
import 'package:get/get.dart';
import 'package:zeus/screens/login/view/login_screen.dart';
import 'package:zeus/services/secure_data_store_service.dart';
import 'package:zeus/services/zenon_manager.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize zenon
  await ZenonManager.initZenon();

  // init the database
  await SecureDataStoreService.initDataStore();

  // do we have a userpassword?
  bool newUser = await SecureDataStoreService.containsUserPassword();

  // set the user password
  SecureDataStoreService.storeUserPassword("123");

  final mnemonic =
      'route become dream access impulse price inform obtain engage ski believe awful absent pig thing vibrant possible exotic flee pepper marble rural fire fancy';

  final keyStore = KeyStore.fromMnemonic(mnemonic);
  print(keyStore.mnemonic);
  // save keystore

  // set as default KeyStore
  Zenon().keyStoreManager.setKeyStore(keyStore);

  // this throws an error:
  // await Zenon().keyStoreManager.saveKeyStore(keyStore, "this is a password!");
  runApp(Zeus());
}

class Zeus extends StatelessWidget {
  const Zeus({Key? key}) : super(key: key);

  // This is the rood widget of the zeus application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IAMZ',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.black,
          appBarTheme:
              const AppBarTheme(backgroundColor: MyThemeColors.darkGrey),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: MyThemeColors.darkGrey,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: MyThemeColors.zenonGreen,
          )),
      debugShowCheckedModeBanner: false,
      // TODO: make named routes
      // TODO: introduce login screen
      // home: const Home(title: 'Welcome to zPass'),
      home: const LoginScreen(),
    );
  }
}
