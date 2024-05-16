import 'package:flutter/material.dart';

class recuC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _recuC();
  }
}

class _recuC extends State<recuC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Reçu"),
          SizedBox(height: 15,),
          Text("Sacré coeur lavage"),
          SizedBox(height: 15,),

        Container()
        ],
      ),
    );
  }
}
