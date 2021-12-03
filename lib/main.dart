import 'package:desafio/Login/TelaInicial/tela_criar.dart';
import 'package:desafio/forms/onboarding2.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Login/TelaInicial/tela_login.dart';
import 'package:flutter/material.dart';
import 'Login/TelaInicial/tela_inicial.dart';
import 'onboarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Desafio());
}

class Desafio extends StatelessWidget {
  const Desafio({Key? key}) : super(key: key);

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
        'telaLogin': (context) => TelaLogin(),
        'onboardingFormulario': (context) => OnbordingFormulario(),
        'criarConta': (context) => CriarConta(),
      },
    );
  }
}
