import 'package:desafio/forms/listagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ApresentacaoUsuario(),
          ),
          const Divider(
            height: 0,
            thickness: 1.5,
            indent: 40,
            endIndent: 40,
            color: Color.fromRGBO(219, 235, 200, 1),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50,20,50,5),
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  'Menu de Apontamentos',
                  style: GoogleFonts.poppins(color: Colors.lightGreen.shade900),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: PainelExpansivo(),
          ),
        ],
      ),
    );
  }
}

class ApresentacaoUsuario extends StatefulWidget {
  const ApresentacaoUsuario({Key? key}) : super(key: key);

  @override
  _ApresentacaoUsuarioState createState() => _ApresentacaoUsuarioState();
}

class _ApresentacaoUsuarioState extends State<ApresentacaoUsuario> {
  @override
  Widget build(BuildContext context) {
    var usr = ModalRoute.of(context)!.settings.arguments.toString();
    var user = usr == 'USUARIO1' || usr == 'USUARIO2' ? usr : 'USUARIO';
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Olá\n$user!',
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.grey.shade900,
              ),
            ),
            Icon(
              Icons.account_circle,
              size: 50,
              color: Colors.green.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  String titulo;
  bool estado;
  String imagem;
  Item(this.titulo, this.estado, this.imagem);
}

class PainelExpansivo extends StatefulWidget {
  const PainelExpansivo({Key? key}) : super(key: key);

  @override
  _PainelExpansivoState createState() => _PainelExpansivoState();
}

class _PainelExpansivoState extends State<PainelExpansivo> {
  var dados = [
    Item('Entomologia', false,'assets/images/entomologia.png'),
    Item('Auditoria', false, 'assets/images/auditoria.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical:20, horizontal: 50),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                dados[index].estado = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Image.asset(dados[0].imagem, scale: 1.0,),
                    title: Text(dados[0].titulo),
                  );
                },
                body: Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child:
                  Column(
                    children: [
                      Divider(
                        color: Color.fromRGBO(219, 235, 200, 1),
                      ),
                      text('Broca Populacional'),
                      text('Broca RevLaboratorio'),
                      text('Broca/Cigarrinha'),
                      text('Broquinha - Control Quimico'),
                      text('Cigarrinhas'),
                      text('Contr. Quimico e Populacional'),
                      text('Cupins'),
                    ],
                  ),
                ),
                isExpanded: dados[0].estado,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Image.asset(dados[1].imagem, scale: 1.0,),
                    title: Text(dados[1].titulo),
                  );
                },
                body: Container(
                  padding: EdgeInsets.all(15),
                  child:
                    Column(
                      children: [
                        Divider(
                          color: Color.fromRGBO(219, 235, 200, 1),
                        ),
                        text('Plantio Mecanizado'),
                      ],
                    )
                ),
                isExpanded: dados[1].estado,
              ),
            ],
          ),
        ),
      ),
    );
  }

  text(conteudo) {
    return Container(
      child: TextButton(
        child: Text(
          conteudo,
          style: TextStyle(color: Colors.green.shade400),
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Listagem(title: conteudo)));
        },
      ),
    );
  }
}