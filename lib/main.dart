import 'Login/TelaInicial/tela_login.dart';
import 'forms/onboarding.dart';

import 'package:flutter/material.dart';
import 'Login/TelaInicial/tela_inicial.dart';
import 'onboarding/onboarding_screen.dart';

void main() {
  runApp(Desafio());
}

class Desafio extends StatelessWidget {
  const Desafio({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(83, 116, 45, 1),
      secondaryHeaderColor: Colors.green.shade600,
      backgroundColor: Color.fromRGBO(246, 250, 241, 1),
      primaryColorLight: Color.fromRGBO(199, 227, 167, 1),
    ),
    title: 'Datamob Apontamentos',
    initialRoute: 'onboarding',
    routes: {
      'onboarding': (context) => OnboardingScreen(),
      'telaInicial': (context) => TelaInicial(),
      'formulario': (context) => OnbordingForm(),
      'telaLogin': (context) => TelaLogin(),
    },
  );
  }
}
