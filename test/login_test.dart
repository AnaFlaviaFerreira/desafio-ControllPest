import 'package:desafio/Login/TelaInicial/tela_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('usuário valido', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TelaLogin()));

    var usuarioField = find.byKey(Key('usuario'));
    expect(usuarioField, findsOneWidget);
    await tester.enterText(usuarioField, 'USUARIO1');
    expect(find.text('USUARIO1'), findsOneWidget);

    var senhaField = find.byKey(Key('senha'));
    expect(senhaField, findsOneWidget);
    await tester.enterText(senhaField, '1234');
    expect(find.text('1234'), findsOneWidget);

    var button = find.byKey(Key('entrar'));
    expect(button,findsOneWidget);
  });

  testWidgets('usuário inválido', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TelaLogin()));
  
    var usuarioField = find.byKey(Key('usuario'));
    expect(usuarioField, findsOneWidget);
    await tester.enterText(usuarioField, 'user');
    expect(find.text('USUARIO1'), findsOneWidget);

    var senhaField = find.byKey(Key('senha'));
    expect(senhaField, findsOneWidget);
    await tester.enterText(senhaField, 'senha');
    expect(find.text('1234'), findsOneWidget);

    var button = find.byKey(Key('entrar'));
    expect(button,findsOneWidget);
  });
  
}