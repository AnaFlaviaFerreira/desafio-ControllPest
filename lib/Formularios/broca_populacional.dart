import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'amostra.dart';

class BrocaPopulacional extends StatefulWidget {
  const BrocaPopulacional({ Key? key }) : super(key: key);

  @override
  _BrocaPopulacionalState createState() => _BrocaPopulacionalState();
}

class _BrocaPopulacionalState extends State<BrocaPopulacional> {
  var level = TextEditingController();
  var pequenas = TextEditingController();
  var aptas = TextEditingController();
  var crisalidas = TextEditingController();
  var massas = TextEditingController();
  var outParasita = TextEditingController();
  var colaboradores = TextEditingController();
  var tempo = TextEditingController();

  var formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          texto('Broca Populacional', false),
          campo('Nro. Lev.', level),
          campo('Pequenas',pequenas),
          campo('Aptas',aptas),
          campo('Crisalidas',crisalidas),
          campo('Massas',massas),
          campo('Outros Parasitadas',outParasita),
          campo('Qtd. Colaboradores',colaboradores),
          campo('Tempo/ Pessoa',tempo),
        ],
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