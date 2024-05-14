import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'nav.dart';

class reservation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _reservation();
  }
}

class _reservation extends State<reservation> {
  // var pop =  popdetailStandar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(items: [
      //   Icon(Icons.home),
      //   Icon(Icons.favorite)
      // ]

      // ),
      body: ListView(
        children: [
          Expanded(
              child: Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/resevation.jpg"),
          )),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Forfait Standard",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 16, 0, 0),
                              ),
                            ),
                            Text('5.000 FCFA',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 16, 0, 0),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Reservé",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD00B0B),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Details",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD00B0B),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Forfait Deluxe",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 16, 0, 0),
                              ),
                            ),
                            Text('15.000 FCFA',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 16, 0, 0),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Reservé",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD00B0B),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Details",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD00B0B),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Forfait Premium",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 16, 0, 0),
                              ),
                            ),
                            Text('25.000 FCFA',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 16, 0, 0),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Reservé",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD00B0B),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Details",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD00B0B),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
