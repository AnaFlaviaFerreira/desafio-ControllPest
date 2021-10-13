import 'broca_populacional/onboarding.dart';

import 'broca_populacional/listagem.dart';
import 'package:flutter/material.dart';
import 'Login/TelaInicial/tela_inicial.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(83, 116, 45, 1),
      secondaryHeaderColor: Colors.green.shade600,
      backgroundColor: Color.fromRGBO(246, 250, 241, 1),
      primaryColorLight: Color.fromRGBO(199, 227, 167, 1),
    ),
    title: 'ControllPest',
    initialRoute: 'telaInicial',
    routes: {
      'telaInicial': (context) => TelaInicial(),
      'listagemBrocaPopulacional': (context) => ListagemBrocaPopulacional(),
      'brocaPopulacional': (context) => OnbordingBrocaPopulacional()
    },
  ));
}
