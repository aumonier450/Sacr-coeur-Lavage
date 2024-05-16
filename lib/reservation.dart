import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'QRcode.dart';
import 'nav.dart';
import 'package:intl/intl.dart';

class reservation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _reservation();
  }
}

class _reservation extends State<reservation> {
// Declaration de variable pour la selection de la date et de l'heure
  late DateTime? _selectedDate;
  late TimeOfDay? _selectedTime;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController =
        TextEditingController(); // Initialisation du contrôleur de texte
    _timeController =
        TextEditingController(); // Initialisation du contrôleur de texte
  }

  // Fonction qui gère la logique de la selection de date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      // Vérifier si picked n'est pas nul
      setState(() {
        _selectedDate = picked;
        _updateTextField();
      });
    }
  }

// La fonction qui gère la logique de la selection de l'heure
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      // Vérifier si picked n'est pas nul
      setState(() {
        _selectedTime = picked;
        _updateTextField();
      });
    }
  }

  void _updateTextField() {
    if (_selectedDate != null) {
      _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    }
    if (_selectedTime != null) {
      _timeController.text = _selectedTime!.format(context);
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

// Pop up reservé standar
  Future<void> reservesatandar() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            title: Center(
              child: Text(
                "Reservé",
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFD00B0B),
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    cursorColor: const Color.fromARGB(255, 16, 0, 0),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 16, 0, 0),
                    ),
                    controller: _dateController,
                    readOnly: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      labelText: 'choisir une date',
                      suffixIcon: IconButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: Icon(Icons.access_time_rounded)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE11010)),
                          borderRadius: BorderRadius.circular(100)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE11010)),
                          borderRadius: BorderRadius.circular(100)),
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(133, 255, 6, 6),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    cursorColor: const Color.fromARGB(255, 16, 0, 0),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 16, 0, 0),
                    ),
                    controller: _timeController,
                    readOnly: false,
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      labelText: 'choisir une date',
                      suffixIcon: IconButton(
                          onPressed: () {
                            _selectTime(context);
                          },
                          icon: Icon(Icons.access_time_rounded)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE11010)),
                          borderRadius: BorderRadius.circular(100)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE11010)),
                          borderRadius: BorderRadius.circular(100)),
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(133, 255, 6, 6),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeWidget(data: 'yzy',)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD00B0B),
                    ),
                    child: Text(
                      "Confirmé",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ok',
                    style: TextStyle(
                      color: Color(0xFFD00B0B),
                    ),
                  ))
            ],
          );
        });
  }

// Le pop up reservé delux

  //  le pop up details forfait standar

  Future<void> popdetailStandar() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFD9D9D9),
            title: Center(
              child: Text(
                'Details',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFD00B0B),
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Forfait Standard",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color.fromARGB(255, 16, 0, 0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Lavage extérieur et intérieur de bases."),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text('Nettoyage des vitre'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text('Aspiration des tapis et des sièges.'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ok',
                    style: TextStyle(
                      color: Color(0xFFD00B0B),
                    ),
                  ))
            ],
          );
        });
  }

// PopUP de details Forfait Deluxe
  Future<void> popdetailDelux() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFD9D9D9),
            title: Center(
              child: Text(
                'Details',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFD00B0B),
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Forfait Deluxe",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color.fromARGB(255, 16, 0, 0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Les service du Forfait Standard"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text(
                        'Polissage de la carrosserie et Traitement des plastiques intérieurs.'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text(
                        "Nettoyage des jantes et Désodorisation de l'intérieur"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ok',
                    style: TextStyle(
                      color: Color(0xFFD00B0B),
                    ),
                  ))
            ],
          );
        });
  }

  // PopUp pour lavage rapide
  Future<void> lavagerapide() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFD9D9D9),
            title: Center(
              child: Text(
                'Lavage Rapide',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFD00B0B),
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Pour un service rapide sans reservation",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color.fromARGB(255, 16, 0, 0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Forfait Standard"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text(
                        'Forfait Deluxe'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text(
                        "Forfait Premium"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ok',
                    style: TextStyle(
                      color: Color(0xFFD00B0B),
                    ),
                  ))
            ],
          );
        });
  }

// PopUP de details Forfait Premium
  Future<void> popdetailpremium() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFD9D9D9),
            title: Center(
              child: Text(
                'Details',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFD00B0B),
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Forfait Premium",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color.fromARGB(255, 16, 0, 0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Les service du Forfait Standard et Delux"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text('Nettoyage approfondi du moteur.'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text(
                        'Traitement anti-bactérien et désinfection complète.'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ok',
                    style: TextStyle(
                      color: Color(0xFFD00B0B),
                    ),
                  ))
            ],
          );
        });
  }

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
                              onTap: () {
                                reservesatandar();
                              },
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
                              onTap: () {
                                popdetailStandar();
                              },
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
                              onTap: () {
                                reservesatandar();
                              },
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
                              onTap: () {
                                popdetailDelux();
                              },
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
                              onTap: () {
                                reservesatandar();
                              },
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
                              onTap: () {
                                popdetailpremium();
                              },
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
                  SizedBox(height: 15,),

                  Container(
                    
                    decoration: BoxDecoration(
                     
                      
                    ),
                    child: GestureDetector(
                        onTap: () {
                          lavagerapide();
                        },
                        // style: ElevatedButton.styleFrom(
                        //   minimumSize: Size(300, 50),
                        //   backgroundColor: const Color.fromARGB(66, 115, 114, 114)
                        // ),
                        child:Container(
                           width: 150,
                          height: 40,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(50),
                      color: Colors.grey,
                      
                    ),
                        child: Center(
                        child:  Text("Lavage rapide",
                        style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFD00B0B),
                                ),
                        ),
                        ),
                        )
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
