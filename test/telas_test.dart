import 'package:desafio/Login/TelaInicial/tela_criar.dart';
import 'package:desafio/Login/TelaInicial/tela_login.dart';
import 'package:desafio/forms/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('login', (){
    testWidgets('usuário valido', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TelaLogin()));

      var usuarioField = find.byKey(Key('usuario'));
      expect(usuarioField, findsOneWidget);
      await tester.enterText(usuarioField, 'teste@hotmail.com');
      expect(find.text('teste@hotmail.com'), findsOneWidget);

      var senhaField = find.byKey(Key('senha'));
      expect(senhaField, findsOneWidget);
      await tester.enterText(senhaField, '123456');
      expect(find.text('123456'), findsOneWidget);

      var button = find.byKey(Key('entrar'));
      expect(button,findsOneWidget);
    });

    testWidgets('usuário inválido', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TelaLogin()));
    
      var usuarioField = find.byKey(Key('usuario'));
      expect(usuarioField, findsOneWidget);
      await tester.enterText(usuarioField, 'user');
      expect(find.text('teste@hotmail.com'), findsOneWidget);

      var senhaField = find.byKey(Key('senha'));
      expect(senhaField, findsOneWidget);
      await tester.enterText(senhaField, 'senha');
      expect(find.text('123456'), findsOneWidget);

      var button = find.byKey(Key('entrar'));
      expect(button,findsOneWidget);
    });
    
  });
  
  group('criar conta', () {
    testWidgets('Criar conta', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CriarConta()));

      var usuarioField = find.byKey(Key('usuario'));
      expect(usuarioField, findsOneWidget);
      await tester.enterText(usuarioField, 'testea@hotmail.com');
      expect(find.text('testea@hotmail.com'), findsOneWidget);

      var senhaField = find.byKey(Key('senha'));
      expect(senhaField, findsOneWidget);
      await tester.enterText(senhaField, '123456');
      expect(find.text('123456'), findsOneWidget);

      var button = find.byKey(Key('criar'));
      expect(button,findsOneWidget);
    });
  });

  group('formulário nova amostra', () {
    testWidgets('Onboarding formulario', (WidgetTester tester) async {
      //irá dar erro pois é chamado dentro de uma função para criar alguns campos
      await tester.pumpWidget(MaterialApp(home: OnbordingFormulario()));

      var secao = find.byKey(Key('form_secao'));
      expect(secao, findsOneWidget);
      var quadra = find.byKey(Key('form_quadra'));
      expect(quadra, findsOneWidget);
      var talhao = find.byKey(Key('form_talhao'));
      expect(talhao, findsOneWidget);
      var level = find.byKey(Key('form_level'));
      expect(level, findsOneWidget);
      var pre = find.byKey(Key('form_pre'));
      expect(pre, findsOneWidget);
      var pos = find.byKey(Key('form_pos'));
      expect(pos, findsOneWidget);
      var aptas = find.byKey(Key('form_aptas'));
      expect(aptas, findsOneWidget);
      var pequenas = find.byKey(Key('form_pequenas'));
      expect(pequenas, findsOneWidget);
      var massas = find.byKey(Key('form_massas'));
      expect(massas, findsOneWidget);
      var crisalidas = find.byKey(Key('form_crisalidas'));
      expect(crisalidas, findsOneWidget);
      var outrosp = find.byKey(Key('form_outrosp'));
      expect(outrosp, findsOneWidget);
      var colab = find.byKey(Key('form_colab'));
      expect(colab, findsOneWidget);
      var latitude = find.byKey(Key('latitude'));
      expect(latitude, findsOneWidget);
      var longitude = find.byKey(Key('longitude'));
      expect(longitude, findsOneWidget);
      
      var proxFim = find.byKey(Key('proxFim'));
      expect(proxFim,findsOneWidget);
      var anterior = find.byKey(Key('anterior'));
      expect(anterior,findsOneWidget);
    });
  });
}