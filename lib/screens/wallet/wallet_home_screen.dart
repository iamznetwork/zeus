import 'package:flutter/material.dart';
// import 'package:zeus/services/data_store_helper.dart';
import 'package:zeus/models/wallet.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class WalletHomeScreen extends StatefulWidget {
  const WalletHomeScreen({Key? key}) : super(key: key);

  @override
  _WalletHomeScreenState createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends State<WalletHomeScreen> {
  // final DataStoreHelper _dsHelper = DataStoreHelper();
  final Wallet w = Wallet(title: "hi");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Wallets"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const SecretEditScreen()))
      //         .then((value) {
      //       setState(() {});
      //     });
      //   },
      //   child: const Icon(Icons.add),
      //   backgroundColor: Colors.grey[850],
      // ),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 4, 0),
                child: Icon(Icons.search),
              ),
              Expanded(
                  child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Search...'),
              ))
            ],
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                leading: const Icon(CryptoFontIcons.BTC),
                title: Text(
                  "My main BTC wallet",
                ),
                trailing: const Icon(Icons.delete_outline),
              ),
              ListTile(
                leading: const Icon(CryptoFontIcons.ETH),
                title: Text(
                  "My main ETH wallet",
                ),
                trailing: const Icon(Icons.delete_outline),
              ),
              ListTile(
                leading: const Icon(CryptoFontIcons.USDT),
                title: Text(
                  "My Stablecoin wallet",
                ),
                trailing: const Icon(Icons.delete_outline),
              )
            ],
          ))
        ],
      ),
    );
  }
}
