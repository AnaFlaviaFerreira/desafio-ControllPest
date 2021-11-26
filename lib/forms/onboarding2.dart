import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio/forms/tela_imagens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OnbordingFormTest extends StatefulWidget {
  const OnbordingFormTest({Key? key}) : super(key: key);

  @override
  _OnbordingFormTestState createState() => _OnbordingFormTestState();
}

class _OnbordingFormTestState extends State<OnbordingFormTest> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  var text = Text("Previous");

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeInCirc;

  var secao = TextEditingController();
  var quadra = TextEditingController();
  var talao = TextEditingController();
  var level = TextEditingController();
  var pequenas = TextEditingController();
  var aptas = TextEditingController();
  var crisalidas = TextEditingController();
  var massas = TextEditingController();
  var outParasita = TextEditingController();
  var colaboradores = TextEditingController();
  var tempo = TextEditingController();
  var pre = true;
  var pos = false;
  var title = Text('Adicionar Amostra');
  var formKey = GlobalKey<FormState>();
  var bloquearCampo = false;
  var latitude = TextEditingController();
  var longitude = TextEditingController();
  var tamanhoTabela;

  @override
  Widget build(BuildContext context) {
    // var titleL = ModalRoute.of(context)!.settings.arguments.toString();
    var info = ModalRoute.of(context)!.settings.arguments as Map;
    tamanhoTabela = info['tamanho'] + 1;

    return Scaffold(
      appBar: AppBar(
        title: title,
        centerTitle: false,

        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        leading : IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
      ),

      backgroundColor: Theme.of(context).backgroundColor,

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: [
              formulario(),
              localizacao(),
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
                          if (currentIndex != 2) {
                            if (currentIndex == 0) {
                              var campos = validacaoCamposAmostra();
                              
                              if (campos == 'sucess') { bloquearCampo = false; }
                              else { bloquearCampo = true; }
                            } else if (currentIndex == 1) {
                              var campos = validacaoCamposLocalizacao();
                              
                              if (campos == 'sucess') { bloquearCampo = false; }
                              else { bloquearCampo = true; }
                            }
                            if (bloquearCampo == false) {
                              _pageController.nextPage(
                              duration: _kDuration, curve: _kCurve);
                              if (currentIndex == 0) { title = Text('Localização');}
                              else { title = Text('Imagens'); }
                            }
                          }
                          else {
                            var erro = '';
                            FirebaseFirestore.instance.collection(info['tabela'])
                            .add(
                              {
                                'amostra': tamanhoTabela,
                                'secao':secao.text,
                                'quadra':quadra.text,
                                'talhao':talao.text,
                                'level':level.text,
                                'aptas':aptas.text,
                                'pequenas':pequenas.text,
                                'massas':massas.text,
                                'crisalidas': crisalidas.text,
                                'outParasita':outParasita.text,
                                'colaboradores': colaboradores.text,
                                'tempo':tempo.text,
                                'prePos': pre == true ? 'pre' : 'pos'
                              }
                            ).catchError((erro) {
                              erro = erro.toString();
                              print(erro.toString());
                            });

                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 15)),
                                  Text(
                                    'Amostra $tamanhoTabela adicionada com sucesso!',
                                    style: GoogleFonts.poppins(color: Colors.white)
                                  ),
                                ],
                              ),
                              duration: const Duration(
                                seconds: 2,
                              ),
                              backgroundColor: Colors.black,
                            ));
                            
                            Navigator.pop(context);
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Listagem(tabela: info['tabela'], titleAplication: info['title'], usuario: info['usuario'])
                              ),
                            );*/
                          }
                           
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

  textoForm(texto, negrito) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          texto,
          style: 
            GoogleFonts.poppins(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
              fontWeight: negrito == true ? FontWeight.bold : FontWeight.normal 
            ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  campoForm(texto,variavelControle,icon, chave) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
            child: Text(
              texto,
              textAlign: TextAlign.end,
              style:
                  GoogleFonts.poppins(fontSize: 16, color: Theme.of(context).primaryColor),
            ),
          ),
          TextField(
            key: Key(chave),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
            ),
            cursorColor: Theme.of(context).secondaryHeaderColor,

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0)
              ),
              suffixIcon: icon == true ? Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor) : null,
              
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 1.0)
              ),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white
            ),
            controller: variavelControle,
          ),
        ],
      ),
    );
  }

  botaoForm(rotulo, valor, nome,chave) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        key: Key(chave),
        style: ElevatedButton.styleFrom(
          primary: valor == true ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
          side: BorderSide(color: Theme.of(context).primaryColor)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 19.5),
              child: Text(
                rotulo,
                style:
                  GoogleFonts.poppins(
                    fontSize: 16,
                    color: valor == true ? Colors.white : Theme.of(context).primaryColor,
                  ),
              ),
            ),
          ],

        ),
        onPressed: () {
          if (nome == 'pre') {
            pre = true;
            pos = false;
          } else {
            pos = true;
            pre = false;
          }
          setState(() {
            botaoForm(rotulo, pre, nome, chave);
          });
        },
        
      ),
    );
  }

  Widget formulario(){
    title = Text('Adicionar Amostra');
    return Container(
      padding: EdgeInsets.fromLTRB(40, 10, 40, 70),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              textoForm('Amostra $tamanhoTabela', true),
              Divider(
                color: Theme.of(context).primaryColor,
                indent: 125,
                endIndent: 125,
                thickness: 2,
              ),
              Divider(
                color: Color.fromRGBO(219, 235, 200, 1),
              ),
              campoForm('Seção (fazenda)', secao, true, 'form_secao'),
              Row(
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 16), child: campoForm('Quadra (Gleba)',quadra, true, 'form_quadra'),),
                  ),
                  Expanded(
                    child: campoForm('Talhão',talao, true, 'form_talhao'),
                  ),
                ],
              ),
              Divider(
                color: Color.fromRGBO(219, 235, 200, 1),
              ),
              Row(
                children: [
                  Expanded(
                    child: campoForm('Nro. Lev.', level, false, 'form_level'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 10, 0),
                    child: botaoForm('PRÉ',pre, 'pre', 'form_pre'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: botaoForm('POS',pos, 'pos', 'form_pos'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 16), child: campoForm('Aptas',aptas, false, 'form_aptas'),),
                  ),
                  Expanded(
                    child: campoForm('Pequenas',pequenas, false, 'form_pequenas'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 16), child: campoForm('Massas',massas, false, 'form_massas'),),
                  ),
                  Expanded(
                    child: campoForm('Crisalidas',crisalidas, false, 'form_crisalidas'),
                  ),
                ],
              ),
              campoForm('Outros Parasitadas',outParasita, false, 'form_outrosp'),
              Row(
                children: [
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 16), child: campoForm('Qtd. Colaboradores',colaboradores, false, 'form_colab'),),
                  ),
                  Expanded(
                    child: campoForm('Tempo/ Pessoa',tempo, false, 'form_temp_pessoa'),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  mensagem(msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.report_problem_outlined,
                color: Colors.amber,
              ),
              Padding(padding: EdgeInsets.only(left: 15)),
              Text(
                msg,
                style: GoogleFonts.poppins(color: Colors.white)
              ),
            ],
          ),
          duration: const Duration(
            seconds: 2,
          ),
          backgroundColor: Colors.black,
        ),
      );
  }

  validacaoCamposAmostra() {
    if (secao.text.isEmpty) { mensagem('Preencha o campo Sessão (fazenda)'); }
    else if (quadra.text.isEmpty) { mensagem('Preencha o campo Quadra (Gleba)'); }
    else if (talao.text.isEmpty) { mensagem('Preencha o campo Talhão'); }
    else if (level.text.isEmpty) { mensagem('Preencha o campo Nro. Lev'); }
    else if (aptas.text.isEmpty) { mensagem('Preencha o campo Aptas'); }
    else if (pequenas.text.isEmpty) { mensagem('Preencha o campo Pequenas'); }
    else if (massas.text.isEmpty) { mensagem('Preencha o campo Massas'); }
    else if (crisalidas.text.isEmpty) { mensagem('Preencha o campo Cristalidas'); }
    else if (outParasita.text.isEmpty) { mensagem('Preencha o campo Outros Parasitas'); }
    else if (colaboradores.text.isEmpty) { mensagem('Preencha o campo Qtd. Colaboradores'); }
    else if (tempo.text.isEmpty) { mensagem('Preencha o campo Tempo/Pessoa'); }
    else { return 'sucess'; }
  }
  
  Widget localizacao() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 550,
      child: ListView(
        children: [
          Container(
            height: 450,
            child: Image.asset(
              'assets/images/mapa.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Latitude',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        //  width: 150,
                        child: TextField(
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                          ),
                          cursorColor:
                              Theme.of(context).secondaryHeaderColor,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1.0)),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 0, 10, 0),
                              filled: true,
                              fillColor: Colors.white,
                              hoverColor: Colors.white),
                          controller: latitude,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Longitude',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        //width: 150,
                        child: TextField(
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                          ),
                          cursorColor:
                              Theme.of(context).secondaryHeaderColor,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      width: 1.0)),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 0, 10, 0),
                              filled: true,
                              fillColor: Colors.white,
                              hoverColor: Colors.white),
                          controller: longitude,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  validacaoCamposLocalizacao() {
    if (latitude.text.isEmpty) { mensagem('Preencha o campo Latitude'); }
    else if (longitude.text.isEmpty) { mensagem('Preencha o campo Longitude'); }
    else { return 'sucess'; }
  }
}
