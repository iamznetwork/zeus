import 'dart:ffi';

import 'package:get/get.dart';
import 'package:zeus/services/zenon_manager.dart';

class IamzHomeController extends GetxController {
  var tokens = 'loading tokens...'.obs;
  var pillars = 'loading pillars...'.obs;

  var myAddress = 'loading...'.obs;
  var myZNNBalance = 'Loading'.obs;
  var myQSRBalance = 'Loading'.obs;

  fetchAccountInfoByAddress() async {
    await ZenonManager.initZenon();
    // AccountInfo? ai;
    Map<String, dynamic>? ai = await ZenonManager.getAccountInfoByAddress(
        "z1qzqw056yme87gdqlmjq7zc55d9usvseqp75c5c");

    myAddress.value = ai?["address"];

    double znnBalance = ai?["znn"];
    myZNNBalance.value = znnBalance.toString();
    double qsrBalance = ai?["qsr"];
    myQSRBalance.value = qsrBalance.toString();
  }

  fetchTokens() async {
    await ZenonManager.initZenon();
    await ZenonManager.getTokens().then((_value) {
      tokens.value = _value;
    });
  }

  fetchPillars() async {
    await ZenonManager.initZenon();

    await ZenonManager.getPillars().then((_value) {
      pillars.value = _value;
    });
  }
}
