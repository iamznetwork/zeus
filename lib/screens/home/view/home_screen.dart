import 'package:flutter/material.dart';
import 'package:zeus/screens/did/did_home_screen.dart';
import 'package:zeus/screens/home/controller/home_controller.dart';
import 'package:zeus/screens/secret/view/secret_home_screen.dart';
import 'package:zeus/screens/wallet/wallet_home_screen.dart';
import 'package:zeus/screens/iamz/view/iamz_home_screen.dart';
import 'package:zeus/assets/constants.dart';
import 'package:get/get.dart';
import 'package:zeus/services/secure_data_store_service.dart';
import 'package:zeus/services/zenon_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final screens = [
    const SecretHomeScreen(),
    const WalletHomeScreen(),
    const DidHomeScreen(),
    const IamzHomeScreen()
  ];

  @override
  void initState() {
    print("init home");
  }

  @override
  Widget build(BuildContext context) {
    // inject the getX controller
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.grey[850],
        selectedItemColor: MyThemeColors.zenonGreen,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.password),
            label: 'Passwords',
            // backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_travel),
            label: 'Wallets',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
              // color: Colors.white,
            ),
            label: 'zIDs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'IAMZ',
          ),
        ],
        // currentIndex: _currentIndex,
        // onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: controller.currentTabIndex,
        onTap: (index) {
          controller.setCurrentTabIndex(index);
          setState(() {});
        },
      ),
      body: IndexedStack(
        index: controller.currentTabIndex,
        children: screens,
      ),
    );
  }
}
