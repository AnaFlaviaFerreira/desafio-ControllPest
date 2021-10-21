import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //Atributos necessários para controlar
  //o conteúdo dos TextField
  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: MediaQuery.of(context).size.height/2,
              child: Image.asset(
                "images/backgroundlogin.png",
              ),
             ),
             Positioned(
               top: 250,
               child: Image.asset(
                 "images/icone.png",
               ),
             ),
             Positioned(
               top: 380,
               child: Container(
                 padding: EdgeInsets.all(32),
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(30),
                     topRight: Radius.circular(30),
                   )
                    ),

                 child: Column(
                   children: [
                     Text(
                       'LOGIN', 
                       style: TextStyle(
                         color: Colors.lightGreen.shade800,
                         fontSize: 26,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     SizedBox(
                       height: 15,
                     ),

                     TextField(
                       controller: txtUsuario,
                       style: TextStyle(
                         fontSize: 15,
                       ),
                       decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.lightGreen.shade800),
                             ),
                         labelText: 'Usuário',
                         hintText: 'Digite seu usuário',
                         labelStyle: TextStyle(
                           color: Colors.lightGreen.shade800,
                           fontSize: 15,
                          ),
                       ),
                     ),
                     SizedBox( 
                      height:20,
                      ),
                     TextField(
                       controller: txtSenha,
                       obscureText: true,
                       style: TextStyle(
                         fontSize: 15,
                       ),
                       decoration: InputDecoration(
                         labelText: 'Senha',
                         labelStyle: TextStyle(
                             color: Colors.lightGreen.shade800,
                             fontSize: 15,
                           ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.lightGreen.shade800,)
                           ),
                           hintText: 'Digite sua senha',
                        ),
                      ),
                      SizedBox( 
                        height: 30,
                        ),
                        Container(
                          width: 200,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  style: BorderStyle.solid
                              ), 
                              borderRadius: BorderRadius.circular(50)
                              ),
                              backgroundColor: Colors.lightGreen.shade800,
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                var user = txtUsuario.text.toUpperCase();
                                var pwd = txtSenha.text;

                                if ((user == 'USUARIO1' || user == 'USUARIO2') && pwd == '1234'
                                ){
                                  Navigator.pushNamed(context,
                                   'TelaInicial',
                                     arguments: user,
                                   );               
                                   } else {
                                     ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                         content: Text('Usuário ou senha inválidos.'),
                                        ),
                                     );
                                   }
                                });
                             },
                             child: Text('Entrar'),
                            ),
                        )   
                     ],
                  ) ,

                 ),
             )
          ],
         ),

       ),
    );
  }
}