// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'connexion.dart';
import 'maps.dart';

class inscrire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _inscrire();
  }
}

class _inscrire extends State<inscrire> {
  File? _image;
  final TextEditingController nomController = TextEditingController();
  final TextEditingController matriculeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();

  Future<void> inscrire() async {
    // Vérifier que tous les champs sont vides
    if (nomController.text.isEmpty &&
        matriculeController.text.isEmpty &&
        passwordController.text.isEmpty &&
        emailController.text.isEmpty &&
        telephoneController.text.isEmpty) {
      // Afficher un pop-up avec un message d'erreur
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Erreur',
              style: TextStyle(
                color: Color(0xFFB40B0B),
              ),
            ),
            content: Text('Veuillez remplir les champs.'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Color(0xFFE11010),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Fermer le pop-up
                },
                child: Text(
                  'Ok',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Carte()));
    }
    // Continuer avec la requête HTTP
    final response = await http.post(
      Uri.parse('YOUR_API_ENDPOINT'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nom': nomController.text,
        'matricule': matriculeController.text,
        'password': passwordController.text,
        'email': emailController.text,
        'telephone': telephoneController.text,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData['Felicitation, vous Bien inscrire ']);
    } else {
      print('Erreur lors de l\inscription');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://votre-api-laravel.com/api/photo/upload'),
      );

      request.files
          .add(await http.MultipartFile.fromPath('image', _image!.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image envoyée avec succès');
      } else {
        print('Échec de l\'envoi de l\'image');
      }
    }
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFD9D9D9),
          title: Text('Choisir une source d\'image',
              style: TextStyle(
                color: Color(0xFFB40B0B),
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Choisir une photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Prendre une photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/ImageIns.png',
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
                            'Inscrivez vous ',
                            style: TextStyle(
                                color: Color(0xFFB40B0B), fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 2),
                          child: _image != null
                              ? Container(
                                  width: 90,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),

                // Le champs de Nom et prenom
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
                    controller: nomController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      labelText: 'Nom et Prenom',
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

                // Le champs du numero matricule
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
                    controller: matriculeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      labelText: 'votre numero matricule ',
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

                // Le champs de mots de passe
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
                  height: 15,
                ),

                // Le champs de l'email
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
                    controller: emailController,
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

                // Le champs de numéro de téléphone
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
                    controller: telephoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      labelText: 'Numero de telephone',
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

                // Prendre une photo
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: _showImageSourceDialog,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        backgroundColor: Color(0xFFE11010),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Une photo',
                                style: TextStyle(
                                    color: Color.fromARGB(154, 5, 0, 0)),
                              ),
                            ],
                          ))),
                ]),

                SizedBox(
                  height: 15,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE11010)),
                  onPressed: () {
                    _uploadImage();
                    inscrire();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.0),
                    child: Text(
                      'S’inscrire',
                      style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Deja un compte"),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'se connecter',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFE11010),
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
