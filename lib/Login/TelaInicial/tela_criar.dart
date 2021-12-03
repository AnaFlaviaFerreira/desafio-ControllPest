import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({ Key? key }) : super(key: key);

  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var _visivel;
  var _show;

  @override
  void initState() {
    _visivel = false;
    _show = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
		        Text(
              'Criar Conta',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
              alignment: Alignment.topLeft,
              child: Text(
                'E-mail',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            TextField(
              key: Key('usuario'),
              controller: txtEmail,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
              ),
              cursorColor: Theme.of(context).secondaryHeaderColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor,
                        width: 1.0)),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                hintText: 'Digite seu e-mail',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
              alignment: Alignment.topLeft,
              child: Text(
                'Senha',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            TextField(
              key: Key('senha'),
              controller: txtSenha,
              obscureText: _show,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
              ),
              cursorColor: Theme.of(context).secondaryHeaderColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor,
                        width: 1.0)),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                hintText: 'Digite sua senha',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _visivel = !_visivel;
                      _show = !_visivel;
                    });
                  },
                  
                  icon: Icon(_visivel == false ? Icons.visibility_off : Icons.visibility),
                  color: Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: const Text('Criar'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.lightGreen.shade800,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      // criarConta(txtEmail.text, txtSenha.text);
                    },
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: const Text('Cancelar'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.lightGreen.shade800,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}