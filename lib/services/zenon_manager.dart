import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';
import 'package:hex/hex.dart';

class ZenonManager {
  static final zenon = Zenon();
  final mnemonic =
      'route become dream access impulse price inform obtain engage ski believe awful absent pig thing vibrant possible exotic flee pepper marble rural fire fancy';

  static Future<Map<String, dynamic>?> getAccountInfoByAddress(
      String address) async {
    AccountInfo? aiZnn;
    Map<String, dynamic> ai = {};

    try {
      aiZnn =
          await zenon.ledger.getAccountInfoByAddress(Address.parse(address));
      ai["address"] = aiZnn.address;
      ai["znn"] = aiZnn.znn()! / 100000000;
      ai["qsr"] = aiZnn.qsr()! / 100000000;

      return ai;
    } catch (e) {
      return null;
    }
  }

  static Future<String> getPillars() async {
    PillarInfoList? pil;

    try {
      pil = await zenon.embedded.pillar.getAll(pageIndex: 1, pageSize: 1);
      return pil.toJson().toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> getTokens() async {
    TokenList? tl;

    try {
      tl = await zenon.embedded.token.getAll(
        pageIndex: 1,
        pageSize: 1,
      );
      return tl.toJson().toString();
      // print(object);
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<void> keyStoreHowTo() async {
    var keyStore = KeyStore.fromMnemonic(mnemonic);
    var keyPair = keyStore.getKeyPair(0);
    var privateKey = keyPair.getPrivateKey();
    var publicKey = await keyPair.getPublicKey();
    var address = await keyPair.address;

    print('entropy: ${keyStore.entropy}');
    print('private key: ${HEX.encode(privateKey!)}');
    print('public key: ${HEX.encode(publicKey)}');
    print('address: $address');
    print('core bytes: ${HEX.encode(address!.core!)}');
  }

  // initialize our app's custom path
  static Future<void> initZenon() async {
    // init the paths first (fix for iOS)
    znnDefaultPaths = await initDefaultPaths();

    debugPrint('main: ${znnDefaultPaths.main.path}');
    debugPrint('cache: ${znnDefaultPaths.cache.path}');
    debugPrint('wallet: ${znnDefaultPaths.wallet.path}');

    // init zenon Client
    const String georgesPillar = 'wss://node1.zenon.wiki:443';
    await zenon.wsClient.initialize(
      //'ws://$kTestPeerHost:$kTestPeerPort',
      georgesPillar,
      retry: false,
    );
  }

  static Future<ZnnPaths> initDefaultPaths() async {
    final packageInfo = await PackageInfo.fromPlatform();
    // we change the root directory to prevent collision with Syrius app directories
    final rootDirectory = packageInfo.appName;

    late Directory main;

    if (Platform.isLinux) {
      main = Directory(path.join(
        Platform.environment['HOME']!,
        '.$rootDirectory',
      ));
    } else if (Platform.isMacOS) {
      main = Directory(path.join(
        Platform.environment['HOME']!,
        'Library',
        rootDirectory,
      ));
    } else if (Platform.isWindows) {
      main = Directory(path.join(
        Platform.environment['AppData']!,
        rootDirectory,
      ));
    } else if (Platform.isAndroid || Platform.isIOS) {
      // add support for mobile
      main = await getApplicationSupportDirectory();
    } else {
      main = Directory(path.join(
        Platform.environment['HOME']!,
        rootDirectory,
      ));
    }

    return ZnnPaths(
      main: main..createSync(),
      wallet: Directory(path.join(main.path, 'wallet'))..createSync(),
      cache: Directory(path.join(main.path, 'cache'))..createSync(),
    );
  }
}
