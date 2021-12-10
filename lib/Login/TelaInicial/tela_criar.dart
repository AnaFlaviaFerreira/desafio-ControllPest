import 'package:firebase_auth/firebase_auth.dart';
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
  // ignore: must_call_super
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
                    key: Key('criar'),
                    child: const Text('Criar'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.lightGreen.shade800,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      if (txtEmail.text.isEmpty) {
                        mensagem('Preencha o campo E-mail', 'vazio');
                      } else if (txtSenha.text.isEmpty) {
                        mensagem('Preencha o campo Senha', 'vazio');
                      } else {
                        criarConta(txtEmail.text, txtSenha.text);
                      }
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

  mensagem(msg, tipo) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              tipo == 'vazio' ? Icons.report_problem_outlined : (tipo == 'erro' ? Icons.dangerous_outlined : Icons.check_circle_outline),
              color: tipo == 'vazio' ? Colors.amber : (tipo == 'erro' ? Colors.red : Theme.of(context).primaryColorLight),
            ),
            Padding(padding: EdgeInsets.only(left: 15)),
            Text(msg, style: GoogleFonts.poppins(color: Colors.white)),
          ],
        ),
        duration: const Duration(
          seconds: 2,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  void criarConta(email, senha) {
    
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    ).then((value) {
      mensagem('Usuário criado com sucesso!', 'sucesso');
      Navigator.pop(context);
    }).catchError((erro) {
      var msg = '';
      if (erro.code == 'email-already-in-use') {
        msg = 'Erro: email informado já está em uso';
      } else {
        msg = 'Erro: ${erro.message}';
      }
      mensagem(msg, 'erro');
    });

  }
}