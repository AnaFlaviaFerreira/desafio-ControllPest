import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'broca_populacional.dart';

class BrocaPopulacional extends StatefulWidget {

  const BrocaPopulacional({ Key? key }) : super(key: key);

  @override
  _BrocaPopulacionalState createState() => _BrocaPopulacionalState();
}

class _BrocaPopulacionalState extends State<BrocaPopulacional> {

  var secao = TextEditingController();
  var quadra = TextEditingController();
  var talao = TextEditingController();
  var level = TextEditingController();
  var pequenas = TextEditingController();
  var aptas = TextEditingController();
  var crisalidas = TextEditingController();
  var massas = TextEditingController();
  var outParasita = TextEditingController();
  var colaboradores = TextEditingController();
  var tempo = TextEditingController();
  var pre = true;
  var pos = false;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Amostra'),
        centerTitle: false,

        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        leading : IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, 'listagemBrocaPopulacional');
          },
        ),
        
      ),

      backgroundColor: Theme.of(context).backgroundColor,

      body: Container(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 70),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                texto('Amostra 1', true),
                Divider(
                  color: Theme.of(context).primaryColor,
                  indent: 125,
                  endIndent: 125,
                  thickness: 2,
                ),
                Divider(
                  color: Color.fromRGBO(219, 235, 200, 1),
                ),
                campo('Seção (fazenda)', secao, true),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Quadra (Gleba)',quadra, true),),
                    ),
                    Expanded(
                      child: campo('Talhão',talao, true),
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromRGBO(219, 235, 200, 1),
                ),
                Row(
                  children: [
                    Expanded(
                      child: campo('Nro. Lev.', level, false),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 10, 0),
                      child: botao('PRÉ',pre, 'pre'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: botao('POS',pos, 'pos'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Aptas',aptas, false),),
                    ),
                    Expanded(
                      child: campo('Pequenas',pequenas, false),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Massas',massas, false),),
                    ),
                    Expanded(
                      child: campo('Crisalidas',crisalidas, false),
                    ),
                  ],
                ),
                campo('Outros Parasitadas',outParasita, false),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Qtd. Colaboradores',colaboradores, false),),
                    ),
                    Expanded(
                      child: campo('Tempo/ Pessoa',tempo, false),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  campo(texto,variavelControle,icon) {
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
              suffixIcon: icon == true ? Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor) : null,
              
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 1.0)
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white
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

  botao(rotulo, valor, nome) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: valor == true ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
          side: BorderSide(color: Theme.of(context).primaryColor)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 19.5),
              child: Text(
                rotulo,
                style:
                  GoogleFonts.poppins(
                    fontSize: 16,
                    color: valor == true ? Colors.white : Theme.of(context).primaryColor,
                  ),
              ),
            ),
          ],

        ),
        onPressed: () {
          if (nome == 'pre') {
            pre = true;
            pos = false;
          } else {
            pos = true;
            pre = false;
          }
          setState(() {
            botao(rotulo, pre, nome);
          });
        },
        
      ),
    );
  }

}