import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.9],
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorLight
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, 'telaLogin'),
                    child: Text(
                      'Pular',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                Container(
                  height: 500.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 0.0),
                            Text(
                              'Seja bem-vindo ao DatamobApontamentos!',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/step1.png',
                                  ),
                                  height: 250.0,
                                  width: 250.0,
                                ),
                              ),
                            ),
                            // SizedBox(height: 15.0),
                            Text(
                              'Aqui você pode cuidar do seu plantio da melhor forma possível. Venha nos conhecer!',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 0.0),
                            Text(
                              'Encontre alguma praga',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/step2.png',
                                  ),
                                  height: 250.0,
                                  width: 250.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Caso você encontre alguma praga que esteja atrapalhando sua colheita entre no aplicativo.',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 0.0),
                            Text(
                              'Informe os dados',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/step3.png',
                                  ),
                                  height: 250.0,
                                  width: 250.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Preencha nosso formulário informando a localização do invasor.',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 0.0),
                            Text(
                              'Salve sua plantação',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 50.0),
                              child: Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/step4.png',
                                  ),
                                  height: 230.0,
                                  width: 230.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Seu registro está pronto para salvar sua colheita!',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    'Próximo',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 31.0),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Theme.of(context).primaryColor,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 60.0,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'telaLogin'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Começar',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
