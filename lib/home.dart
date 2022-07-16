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
  int state = 0;

  void _toggleState() {
    if (state == 0) {
      database.update({"state": 1});
      setState(() {
        state = 1;
      });
    } else {
      database.update({"state": 0});
      setState(() {
        state = 0;
      });
    }
  }

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
            onPressed: _toggleState,
            child: Text((state == 1) ? "on" : "off"),
          ),
        ),
      ),
    );
  }
}
