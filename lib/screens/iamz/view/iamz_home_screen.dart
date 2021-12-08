import 'package:flutter/material.dart';
import 'package:zeus/screens/iamz/controller/iamz_home_controller.dart';
import 'package:get/get.dart';

class IamzHomeScreen extends StatefulWidget {
  const IamzHomeScreen({Key? key}) : super(key: key);

  @override
  _IamzHomeScreenState createState() => _IamzHomeScreenState();
}

class _IamzHomeScreenState extends State<IamzHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // inject the getX controller
    final IamzHomeController controller = Get.put(IamzHomeController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Zandbox"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.fetchTokens();
            controller.fetchPillars();
            controller.fetchAccountInfoByAddress();
          },
          child: const Icon(Icons.cloud),
          backgroundColor: Colors.grey[850],
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => ListTile(
                  title: Text("My Wallet: ${controller.myAddress}"),
                  subtitle: Text(
                      "ZNN: ${controller.myZNNBalance.value} / QSR: ${controller.myQSRBalance.value}"),
                  leading: Icon(Icons.wallet_giftcard),
                )),
            const Card(child: Text("Some infos")),
            Card(child: Obx(() => Text("Tokens: ${controller.tokens.value}"))),
            Card(
                child: Obx(() => Text("Pillars: ${controller.pillars.value}"))),
          ],
        ));
  }
}
