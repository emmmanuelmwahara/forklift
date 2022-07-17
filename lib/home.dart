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
  Color color = Colors.red;
  bool isOn = false;
  int state = 0;
  int hornState = 0;

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

  void _horn() {
    database.update({
      "horn": hornState,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remote forklift"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredBox(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const ForkButton(
                    path: 'mast/up',
                    child: Icon(
                      Icons.arrow_upward_outlined,
                      size: 30,
                    ),
                  ),
                  const ForkButton(
                    path: 'mast/down',
                    child: Icon(
                      Icons.arrow_downward_outlined,
                      size: 30,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_left_outlined,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_right_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const ForkButton(
            path: 'horn',
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('HORN'),
            ),
          ),
          ColoredBox(
            color: Colors.blue.shade50,
            child: Column(
              children: [
                const ForkButton(
                  path: 'vehicle/forward',
                  child: Icon(
                    Icons.arrow_upward_outlined,
                    size: 30,
                  ),
                ),
                const ForkButton(
                  path: 'vehicle/reverse',
                  child: Icon(
                    Icons.arrow_downward_outlined,
                    size: 30,
                  ),
                ),
                Row(
                  children: const [
                    ForkButton(
                      path: 'vehicle/left',
                      child: Icon(
                        Icons.arrow_left_outlined,
                        size: 30,
                      ),
                    ),
                    ForkButton(
                      path: 'vehicle/right',
                      child: Icon(
                        Icons.arrow_right_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ForkButton extends StatefulWidget {
  final String path;
  final Widget child;
  const ForkButton({
    Key? key,
    required this.path,
    required this.child,
  }) : super(key: key);

  @override
  State<ForkButton> createState() => _ForkButtonState();
}

class _ForkButtonState extends State<ForkButton> {
  final database = FirebaseDatabase.instance.reference().child('test');
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (tapDown) {
        database.update({
          widget.path: 1,
        });
      },
      onTapUp: (details) {
        database.update({
          widget.path: 0,
        });
      },
      child: widget.child,
    );
  }
}
