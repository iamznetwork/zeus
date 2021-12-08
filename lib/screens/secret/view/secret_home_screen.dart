import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus/models/secret.dart';
import 'package:zeus/screens/secret/controller/secret_home_controller.dart';
import 'package:zeus/screens/secret/secret_edit_screen.dart';
import 'package:zeus/screens/secret/view/secret_item_screen.dart';
import 'package:zeus/assets/constants.dart';
import 'package:zeus/services/secure_data_store_service.dart';

class SecretHomeScreen extends StatefulWidget {
  const SecretHomeScreen({Key? key}) : super(key: key);

  @override
  _SecretHomeScreenState createState() => _SecretHomeScreenState();
}

class _SecretHomeScreenState extends State<SecretHomeScreen> {
  // inject the getX controller
  final SecretHomeController controller = Get.put(SecretHomeController());

  Future<bool> showConfirmationDialog(context) async {
    bool confirm = false;
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Warning"),
              content: const Text("Do you want to delete this item?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    confirm = false;
                    Navigator.pop(context, 'Cancel');
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    confirm = true;
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ));
    return confirm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passwords"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "Add new Secret",
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecretItemScreen(secret: Secret())))
              .then((value) {
            SecureDataStoreService.dumpSecretBox();
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                child: Icon(Icons.search),
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Search...'),
                ),
              ),
            ],
          ),
          Expanded(
              child: FutureBuilder(
            future: SecureDataStoreService.getSecrets(),
            builder: (context, AsyncSnapshot<List<Secret>> snapshot) {
              List<Secret> secretsList = snapshot.data ?? [];

              if (secretsList.isEmpty) {
                return ListView(
                  children: const [Text("No entry found")],
                );
              }

              return ListView.builder(
                  itemCount: secretsList.length,
                  itemBuilder: (context, index) {
                    final secretItem = secretsList[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecretItemScreen(
                                        secret: secretItem,
                                      ))).then((value) {
                            setState(() {});
                          });
                        },
                        child: Dismissible(
                          key: Key(secretItem.title.toString()),
                          confirmDismiss: (direction) async {
                            if (await showConfirmationDialog(context)) {
                              setState(() {
                                SecureDataStoreService.deleteSecret(secretItem);
                              });
                              return true;
                            } else {
                              return false;
                            }
                          },
                          child:
                              SecretCardWidget(title: secretsList[index].title),
                        ));
                  });
            },
          )),
        ],
      ),
    );
  }
}

class SecretCardWidget extends StatelessWidget {
  const SecretCardWidget({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
          color: const Color(0xff161616),
          border: Border.all(
            color: MyThemeColors.zenonGreen,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: ListTile(
          leading: const Icon(Icons.vpn_key),
          title: Text(
            title!,
          ),
          // trailing: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}
