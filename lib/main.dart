import 'package:flutter/material.dart';
import 'package:zeus/assets/constants.dart';
import 'package:get/get.dart';
import 'package:zeus/screens/login/view/login_screen.dart';
import 'package:zeus/services/secure_data_store_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init the database
  await SecureDataStoreService.initDataStore();

  // do we have a userpassword?
  bool newUser = await SecureDataStoreService.containsUserPassword();

  // set the user password
  SecureDataStoreService.storeUserPassword("123");

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
