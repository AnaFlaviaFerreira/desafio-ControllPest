import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Formulario extends StatefulWidget {
  const Formulario({ Key? key }) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

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
            Navigator.pop(context);
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
                campo('Seção (fazenda)', secao, true, 'form_secao'),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Quadra (Gleba)',quadra, true, 'form_quadra'),),
                    ),
                    Expanded(
                      child: campo('Talhão',talao, true, 'form_talhao'),
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromRGBO(219, 235, 200, 1),
                ),
                Row(
                  children: [
                    Expanded(
                      child: campo('Nro. Lev.', level, false, 'form_level'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 10, 0),
                      child: botao('PRÉ',pre, 'pre', 'form_pre'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: botao('POS',pos, 'pos', 'form_pos'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Aptas',aptas, false, 'form_aptas'),),
                    ),
                    Expanded(
                      child: campo('Pequenas',pequenas, false, 'form_pequenas'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Massas',massas, false, 'form_massas'),),
                    ),
                    Expanded(
                      child: campo('Crisalidas',crisalidas, false, 'form_crisalidas'),
                    ),
                  ],
                ),
                campo('Outros Parasitadas',outParasita, false, 'form_outrosp'),
                Row(
                  children: [
                    Expanded(
                      child: Padding(padding: EdgeInsets.only(right: 16), child: campo('Qtd. Colaboradores',colaboradores, false, 'form_colab'),),
                    ),
                    Expanded(
                      child: campo('Tempo/ Pessoa',tempo, false, 'form_temp_pessoa'),
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

  campo(texto,variavelControle,icon, chave) {
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
            key: Key(chave),
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

  botao(rotulo, valor, nome,chave) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        key: Key(chave),
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
            botao(rotulo, pre, nome, chave);
          });
        },
        
      ),
    );
  }

}