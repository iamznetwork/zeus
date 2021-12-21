import 'package:flutter/material.dart';
import 'package:zeus/assets/constants.dart' as constants;
import 'package:get/get.dart';
import 'package:zeus/screens/login/view/login_screen.dart';
import 'package:zeus/screens/newUserPassword/view/new_user_password_screen.dart';
import 'package:zeus/services/login_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // do we have a userpassword?
  bool existingUser = await LoginService.userAccountExists();

  runApp(Zeus(existingUser: existingUser));
}

class Zeus extends StatelessWidget {
  const Zeus({Key? key, required this.existingUser}) : super(key: key);

  final bool existingUser;

  // This is the rood widget of the zeus application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: constants.appName,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.black,
          appBarTheme:
              AppBarTheme(backgroundColor: constants.colors['darkGrey']),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: constants.colors['darkGrey'],
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: constants.colors['zenonGreen'],
          )),
      debugShowCheckedModeBanner: false,
      // TODO: make named routes
      // TODO: introduce login screen
      // home: const Home(title: 'Welcome to zPass'),
      home: existingUser ? const LoginScreen() : const NewUserPasswordScreen(),
    );
  }
}
