import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class pop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _pop();
  }
}

class _pop extends State<pop> {

Future <void> popdetailStandar(BuildContext context) async{
 return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFD9D9D9),
          title: Text('Details',
              style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: const Color(0xFFD00B0B),
                    ),
              ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Forfait Standard",
                style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 16, 0, 0),
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
        );
      },
    );

}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
