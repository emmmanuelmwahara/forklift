import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String id = 'home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final database = FirebaseDatabase.instance.reference().child('test');
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remote forklift"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              setState() {
                isOn = !isOn;
                database.update({
                  'state': isOn,
                });
              }
            },
            child: Text(isOn ? "on" : "off"),
          ),
        ),
      ),
    );
  }
}
