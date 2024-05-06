// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'inscription.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login();
  }
}

class _login extends State<login> {
   final TextEditingController mailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   Future<void> login() async {
    if (mailcontroller.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Veuillez remplir tous les champs.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style:  ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Color(0xFFE11010),
                ),
                child: Text('OK',
                style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    final response = await http.post(
      Uri.parse('YOUR_LOGIN_API_ENDPOINT'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'Email': mailcontroller.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData['message']); // Afficher le message de succès ou autre
      // Navigation vers la page suivante après la connexion réussie
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Identifiants incorrects. Veuillez réessayer.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Color(0xFFE11010),
                ),
                child: Text('OK',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255)
                ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/lavageT.jpg',
                  width: 200,
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 1),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        'Veuillez vous connectez',
                        style:
                            TextStyle(color: Color(0xFFB40B0B), fontSize: 20),
                      ),
                    ),
                   ],
                 ),
            ),

            SizedBox(
              height: 15,
            ),

        // Champs de l'email
           Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 16, 0, 0),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 16, 0, 0),
                ),
                controller: mailcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE11010)),
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE11010)),
                      borderRadius: BorderRadius.circular(100)),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(133, 16, 0, 0),
                  ),
                ),
              ),
            ),
          
           SizedBox(
              height: 15,
            ),

     // Champs du mots de passe 

       Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 16, 0, 0),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 16, 0, 0),
                ),
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  labelText: 'votre mots de passe',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE11010)),
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE11010)),
                      borderRadius: BorderRadius.circular(100)),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(133, 16, 0, 0),
                  ),
                ),
              ),
            ),
          
          SizedBox(
              height: 30,
            ),


           Container(
            height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
            child:  ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFFE11010)),
              onPressed: () {
                login();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Se connecter',
                  style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 20),
                ),
              ),
            ),
           ),
          
          SizedBox(
              height: 25,
            ),

         Center(
          child: Text('OU',
            style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 16, 0, 0),
                ),
            ),
         ),

      SizedBox(
              height: 25,
            ),

          Center(
            child:   GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
            MaterialPageRoute(builder: (context) => inscrire())
                      );
                     
                    },
                   
                  child: Padding(padding: EdgeInsets.only(left: 10.0),
                  child: Text('créer un compte',
                    style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFE11010),
                  ),
                   
                ),
                    )
                    ),
          )
        ],
      )
    );
  }
}
