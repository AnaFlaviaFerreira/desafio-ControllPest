import 'package:desafio/forms/tela_imagens.dart';
import 'package:desafio/forms/tela_mapa.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'formulario.dart';

class OnbordingForm extends StatefulWidget {
  const OnbordingForm({Key? key}) : super(key: key);

  @override
  _OnbordingFormState createState() => _OnbordingFormState();
}

class _OnbordingFormState extends State<OnbordingForm> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  var text = Text("Previous");

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeInCirc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: [
              Formulario(),
              TelaMapa(),
              TelaImagens(),
            ],
          ),
          Positioned(
            bottom: 30,
            // // left: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: currentIndex != 0
                            ? () {
                                _pageController.previousPage(
                                    duration: _kDuration, curve: _kCurve);
                              }
                            : null,
                        child: texto(true, 'Anterior',
                            currentIndex != 0 ? false : true)),
                    SizedBox(
                      width: 50,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        indicador(0, currentIndex),
                        SizedBox(
                          width: 10,
                        ),
                        indicador(1, currentIndex),
                        SizedBox(
                          width: 10,
                        ),
                        indicador(2, currentIndex),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          if (currentIndex != 2)
                            _pageController.nextPage(
                                duration: _kDuration, curve: _kCurve);
                          else
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Amostra 1 adicionada com sucesso!'),
                            ));
                        },
                        child: texto(
                            false,
                            currentIndex != 2 ? 'Próximo' : 'Finalizar',
                            false)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  indicador(positionIndex, currentIndex) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          color: positionIndex == currentIndex
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }

  texto(lado, texto, bloqueado) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.poppins(
            fontSize: 18,
            color: bloqueado == true
                ? Color.fromRGBO(192, 192, 192, 1)
                : Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500),
        children: [
          if (lado == true)
            WidgetSpan(
              child: Icon(Icons.navigate_before,
                  color: bloqueado == true
                      ? Color.fromRGBO(192, 192, 192, 1)
                      : Theme.of(context).primaryColor),
            ),
          TextSpan(
            text: texto,
          ),
          if (lado == false)
            WidgetSpan(
              child: Icon(Icons.navigate_next,
                  color: bloqueado == true
                      ? Color.fromRGBO(192, 192, 192, 1)
                      : Theme.of(context).primaryColor),
            ),
        ],
      ),
    );
  }
}
