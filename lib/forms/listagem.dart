import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Listagem extends StatefulWidget {
  final String tabela;
  final String titleAplication;
  final String usuario;
  const Listagem(
      {Key? key,
      required this.tabela,
      required this.titleAplication,
      required this.usuario})
      : super(key: key);

  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  var psecao;
  var pquadra;
  var ptalao;
  var pesquisa = TextEditingController();
  bool _isVisible = false;
  var visualizar = false;
  var lista;
  var tabela;
  int tamanhoTabela = 0;

  @override
  void initState() {
    super.initState();
    tabela = widget.tabela;
    lista = FirebaseFirestore.instance.collection(widget.tabela);
  }

  Widget exibirItem(item) {
    int amostra = item.data()['amostra'];
    String secao = '';
    String quadra = item.data()['quadra'];
    String talhao = item.data()['talhao'];

    if (item.data()['secao'] == 1 || item.data()['secao'] == '1') {
      secao = 'SÃO JOSÉ';
    } else {
      secao = 'SÃO SIMÃO';
    }

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          'Amostra $amostra',
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Seção: $secao',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          Text(
            'Quadra: $quadra           Talhão: $talhao',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        ]),
        trailing: SizedBox(
          width: 80,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'onboardingFormulario',
                        arguments: item.id);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    //DELETAR UM DOCUMENTO
                    lista.doc(item.id).delete();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).primaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var title = ModalRoute.of(context)!.settings.arguments.toString();
    //var info = ModalRoute.of(context)!.settings.arguments as Map;
    tabela = widget.tabela;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleAplication),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, 'telaInicial',
                arguments: widget.usuario);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, 'formulario', arguments: title);
          Navigator.pushNamed(context, 'onboardingFormulario', arguments: {
            'title': widget.titleAplication,
            'tabela': tabela,
            'usuario': widget.usuario,
            'tamanho': tamanhoTabela
          });
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: campo('Pesquisa', null, pesquisa)),
                botao(),
              ],
            ),
            Visibility(
              visible: _isVisible,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        comboForm('Seção (fazenda)', psecao, 'psecao'),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: comboForm(
                                    'Quadra (Gleba)', pquadra, 'pquadra'),
                              ),
                            ),
                            Expanded(
                              child: comboForm('Talhão', ptalao, 'ptalao'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: listagem(),
            ),
          ],
        ),
      ),
    );
  }

  listagem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: StreamBuilder<QuerySnapshot>(
        //toda e qualquer opração no firestore, FutureBuilder - não monitora em tempo real
        //fonte de dados (coleção)
        stream: lista.snapshots(),

        //exibir os dados recuperados
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('Não foi possível conectar ao Firestore'),
              );

            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );

            default:
              final dados = snapshot.requireData;
              tamanhoTabela = dados.size;
              if (dados.size == 0) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Logo cinza.png',
                        fit: BoxFit.fitHeight,
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Nenhuma amostra encontrada!',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirItem(dados.docs[index]);
                  },
                );
              }
          }
        },
      ),
    );
  }

  textoPadding(texto, pright, pleft) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: pright, right: pleft),
        child: Text(
          texto,
          style: GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  textoLista(texto, pleft, pright) {
    return Padding(
      padding: EdgeInsets.only(right: pright, left: pleft),
      child: Text(
        texto,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
    );
  }

  campo(title, texto, variavelControle) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(34, 6, 34, 6),
            child: title == null
                ? Text(
                    texto,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Theme.of(context).primaryColor),
                  )
                : null,
          ),
          Padding(
            padding: title == null
                ? EdgeInsets.fromLTRB(34, 6, 34, 6)
                : EdgeInsets.fromLTRB(34, 6, 0, 6),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
              cursorColor: Theme.of(context).secondaryHeaderColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1.0)),
                suffixIcon: title == null
                    ? Icon(Icons.keyboard_arrow_down,
                        color: Theme.of(context).primaryColor)
                    : null,
                prefixIcon: texto == null
                    ? Icon(Icons.search, color: Theme.of(context).primaryColor)
                    : null,
                hintText: texto == null ? title : null,
                hintStyle: TextStyle(
                    color: Color.fromRGBO(183, 183, 183, 1), fontSize: 16),
                filled: true,
                fillColor: Colors.white,
                hoverColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor)),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              ),
              controller: variavelControle,
            ),
          ),
        ],
      ),
    );
  }

  botao() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextButton.icon(
          icon: Icon(
            Icons.filter_list_alt,
            color: Theme.of(context).primaryColor,
            size: 40,
          ),
          onPressed: () {
            visualizar = visualizar == false ? true : false;
            setState(() {
              botao();
              _isVisible = visualizar == false ? false : true;
            });
          },
          label: Text('')),
    );
  }

  comboForm(texto, menu, chave) {
    var lista;
    if (chave == 'psecao') {
      lista = [
        DropdownMenuItem(child: Text('FAZENDA SÃO JOSÉ'), value: '1'),
        DropdownMenuItem(child: Text('FAZENDA SÃO SIMÃO'), value: '2'),
      ];
    } else if (chave == 'pquadra') {
      lista = [
        DropdownMenuItem(child: Text('1'), value: '1'),
        DropdownMenuItem(child: Text('2'), value: '2'),
      ];
    } else {
      lista = [
        DropdownMenuItem(child: Text('1'), value: '1'),
        DropdownMenuItem(child: Text('2'), value: '2'),
      ];
    }
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
              style: GoogleFonts.poppins(
                  fontSize: 16, color: Theme.of(context).primaryColor),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: DropdownButton<String>(
                    key: Key(chave),
                    value: chave == 'psecao'
                        ? psecao
                        : (chave == 'pquadra' ? pquadra : ptalao),
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Theme.of(context).primaryColor,
                    ),
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (chave == 'psecao') {
                          psecao = newValue.toString();
                        } else if (chave == 'pquadra') {
                          pquadra = newValue.toString();
                        } else {
                          ptalao = newValue.toString();
                        }
                      });
                    },
                    items: lista,
                  ))),
        ],
      ),
    );
  }
}
