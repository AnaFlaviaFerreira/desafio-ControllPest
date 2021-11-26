import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaMapa extends StatefulWidget {
  const TelaMapa({Key? key}) : super(key: key);

  @override
  _TelaMapaState createState() => _TelaMapaState();
}

class _TelaMapaState extends State<TelaMapa> {
  var latitude = TextEditingController();
  var longitude = TextEditingController();
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
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 550,
          child: ListView(
            children: [
              Container(
                height: 450,
                child: Image.asset(
                  'assets/images/mapa.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latitude',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            //  width: 150,
                            child: TextField(
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24,
                              ),
                              cursorColor:
                                  Theme.of(context).secondaryHeaderColor,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          width: 1.0)),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hoverColor: Colors.white),
                              controller: latitude,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Longitude',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            //width: 150,
                            child: TextField(
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24,
                              ),
                              cursorColor:
                                  Theme.of(context).secondaryHeaderColor,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          width: 1.0)),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hoverColor: Colors.white),
                              controller: longitude,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
