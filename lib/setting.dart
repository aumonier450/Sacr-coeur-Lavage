import 'package:flutter/material.dart';

class para extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _para();
  }
}

class _para extends State<para> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown,
        child: Text("Parametre"),
      ),
    );
  }
}
