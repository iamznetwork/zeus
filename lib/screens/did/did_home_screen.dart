import 'package:flutter/material.dart';

class DidHomeScreen extends StatefulWidget {
  const DidHomeScreen({Key? key}) : super(key: key);

  @override
  _DidHomeScreenState createState() => _DidHomeScreenState();
}

class _DidHomeScreenState extends State<DidHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Distributed Identifiers"),
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
      body: Center(
        child: const Text("Distributed Identifiers"),
      ),
    );
  }
}
