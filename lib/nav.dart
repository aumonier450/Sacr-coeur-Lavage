import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'reservation.dart';
import 'setting.dart';

class Navbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Navbar();
  }
}

class _Navbar extends State<Navbar> {
  final items = const [
    // Icon(
    //   Icons.map_rounded,
    //   size: 30,
    // ),
    Icon(
      Icons.calendar_month,
      size: 30,
    ),
    Icon(
      Icons.settings,
      size: 30,
    )
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectIndex) {
          setState(() {
            index = selectIndex;
          });
        },
        animationDuration: const Duration(milliseconds: 400),
      ),
      body: Container(child: getSelecteWidget(index: index)),
    );
  }

  Widget getSelecteWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
       return reservation();
        break;

      case 1:
        return para();
        break;

      default:
        return reservation();
        break;
    }
   
  }
}
