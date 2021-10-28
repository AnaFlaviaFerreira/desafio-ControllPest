import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Form(
          key: form,
          child: Stack(
            children: [
              Container(
                child: new Image.asset(
                  "assets/images/backgroundlogin.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
               ),
               Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.only(bottom: 230),
                 child: Image.asset(
                      "assets/images/icone.png",
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
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Usuário',
                            textAlign: TextAlign.start,
                            style:
                              GoogleFonts.poppins(fontSize: 16, color: Theme.of(context).primaryColor),
                          ),
                        ),

                       TextField(
                         key: Key('usuario'),
                         controller: txtUsuario,
                         style: TextStyle(
                           color: Theme.of(context).primaryColor,
                           fontSize: 15,
                         ),
                         cursorColor: Theme.of(context).secondaryHeaderColor,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
                            ),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 1.0)
                           ),
                           contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                           hintText: 'Digite seu usuário',
                         ),
                       ),
                       
                       SizedBox( 
                        height:10,
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Senha',
                            textAlign: TextAlign.start,
                            style:
                              GoogleFonts.poppins(fontSize: 16, color: Theme.of(context).primaryColor),
                          ),
                        ),
                       TextField(
                         key: Key('senha'),
                         controller: txtSenha,
                         obscureText: true,
                         style: TextStyle(
                           color: Theme.of(context).primaryColor,
                           fontSize: 15,
                         ),
                         cursorColor: Theme.of(context).secondaryHeaderColor,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Theme.of(context).primaryColor, 
                               width: 1.0
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 1.0)
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                             hintText: 'Digite sua senha',
                             suffixIcon: Icon(Icons.visibility_off, color: Theme.of(context).primaryColor),
                          ),
                        ),
                        SizedBox( 
                          height: 30,
                          ),
                          Container(
                            width: 200,
                            child: OutlinedButton(
                              key: Key('entrar'),
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
                                     'telaInicial',
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

       ),
    );
  }
}