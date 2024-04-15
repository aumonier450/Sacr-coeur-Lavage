// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'inscription.dart';

class splashv extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _splashv();
  }
}

class _splashv extends State<splashv> {
  void initState() {
    super.initState();
    // chargement de l'application
    Timer(Duration(seconds: 6), () {
      //naviguer vers la page suivant
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => inscrire()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Logo.png',
                width: 300,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Sacré coeur lavage',
              style: TextStyle(
                color: Color(0xFFAC1B1B),
                fontSize: 20,
              ),
              ),
              Image.asset(
                'assets/lavageT.jpg',
                width: 150,
              ),
            ],
          ),
          Container(
            height: 100,
            child: Center(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Éclat divin pour votre voiture: du Cœur de Jésus au monde',
                style: TextStyle(color: Colors.white),
                ),
            ),
              ),
               decoration: BoxDecoration(
                color: Color(0xFFB40B0B),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
          ),
        ],
      ),
    ));
  }
}
