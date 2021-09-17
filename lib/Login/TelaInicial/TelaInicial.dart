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
      backgroundColor: Colors.green.shade100,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: [
              apresentacaoUsuario(),
              entomologia(),
              auditoria(),
            ],
          ),
        ),
      ),
    );
  }

  entomologia() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    );
  }

  auditoria() {
    return Container();
  }
}

class apresentacaoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Text(
            'Olá!\nFulano',
            style:
                GoogleFonts.poppins(fontSize: 23, color: Colors.grey.shade800),
          ),
        ],
      ),
    );
  }
}
