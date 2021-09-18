import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          children: [
            apresentacaoUsuario(),
            const Divider(
              height: 0,
              thickness: 2.5,
              indent: 20,
              endIndent: 20,
              color: Colors.lightGreen,
            )
          ],
        ),
      ),
    );
  }
}

class apresentacaoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: <Widget>[
              Text(
                'Olá\nFulano!',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: Colors.grey.shade900),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.green.shade400,
              ),
            ],
          )
        ],
      ),
    );
  }
}
