import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login/TelaInicial/TelaInicial.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green.shade900,
      secondaryHeaderColor: Colors.green.shade600,
      backgroundColor: Colors.green.shade50,
    ),
    home: TelaInicial(),
  ));
}
