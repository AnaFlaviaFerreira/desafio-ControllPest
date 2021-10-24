import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaMapa extends StatefulWidget {
  const TelaMapa({Key? key}) : super(key: key);

  @override
  _TelaMapaState createState() => _TelaMapaState();
}

class _TelaMapaState extends State<TelaMapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização'),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          children: [
            /*Expanded(
              child: Image.asset(
                'assets/images/mapa.png',
                scale: 1.0,
              ),
            ),*/
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                'Latitude',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 16, color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                  ),
                  cursorColor: Theme.of(context).secondaryHeaderColor,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: 1.0)),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      filled: true,
                      fillColor: Colors.white,
                      hoverColor: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                'Longitude',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 16, color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                  ),
                  cursorColor: Theme.of(context).secondaryHeaderColor,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: 1.0)),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      filled: true,
                      fillColor: Colors.white,
                      hoverColor: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
