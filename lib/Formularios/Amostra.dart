import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'broca_populacional.dart';

class Amostra extends StatefulWidget {

  const Amostra({ Key? key }) : super(key: key);

  @override
  _AmostraState createState() => _AmostraState();
}

class _AmostraState extends State<Amostra> {

  var secao = TextEditingController();
  var quadra = TextEditingController();
  var talao = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broca Populacional'),
        centerTitle: false,

        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () {
              setState(() {
                formKey.currentState!.reset();
                secao.text = '';
                quadra.text = '';
                talao.text = '';
                FocusScope.of(context).unfocus();
              });
            },
          )
        ],
        leading : IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: Navigator.of(context).pop,
        ),
      ),

      backgroundColor: Theme.of(context).backgroundColor,

      body: Container(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 25),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                texto('AMOSTRA 1', false),
                campo('Seção (fazenda)', secao),
                campo('Quadra (Gleba)',quadra),
                campo('Talhão',talao),
                texto('BROCA POPULACIONAL', true),
                BrocaPopulacional()
              ],
            ),
          ),
        ),
      ),
    );
  }

  campo(texto,variavelControle) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
            child: Text(
              texto,
              textAlign: TextAlign.end,
              style:
                  GoogleFonts.poppins(fontSize: 16, color: Theme.of(context).primaryColor),
            ),
          ),
          TextField(
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
            ),
            cursorColor: Theme.of(context).secondaryHeaderColor,

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0)
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 1.0)
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              
              // labelText: 'Enter a search term',
            ),

            controller: variavelControle,
          ),
        ],
      ),
    );
  }

  texto(texto, negrito) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          texto,
          style: 
            GoogleFonts.poppins(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
              fontWeight: negrito == true ? FontWeight.bold : FontWeight.normal 
            ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}