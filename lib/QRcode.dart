import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeWidget extends StatefulWidget {
  final String data;

  QRCodeWidget({required this.data});

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
// Pop up pour recu du client

  Future<void> Recuclient() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFFD9D9D9),
            title: Center(
              child: Text(
                'Reçu',
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
                // Text("Reçu"),
                // SizedBox(height: 15,),
                Text("Sacré coeur lavage"),
                SizedBox(
                  height: 15,
                ),

                Container()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 100,
          width: 400,
          child: Center(
            child: Text(
              "veuillez garder le code qr  et le presenté au laveur  une fois au lavage ",
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 16, 0, 0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            child: QrImageView(
              data: 'This is a simple QR code',
              version: QrVersions.auto,
              size: 10,
              gapless: false,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Recuclient();
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFD00B0B),
              ),
              width: 300,
              height: 40,
              child: Center(
                child: Text(
                  "Voir mon recu",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFD00B0B),
              ),
              width: 300,
              height: 40,
              child: Center(
                child: Text(
                  "Revenir à la carte pour suivre l'itineraire",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
