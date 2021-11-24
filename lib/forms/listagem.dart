import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Listagem extends StatefulWidget {

  const Listagem({ Key? key}) : super(key: key);

  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  var psecao = TextEditingController();
  var pquadra = TextEditingController();
  var ptalao = TextEditingController();
  var pesquisa = TextEditingController();
  bool _isVisible = false;
  var visualizar = false;
  var lista;

  @override
  void initState() {
    super.initState();

    //Referenciar a Coleção desejada
    //cafes = FirebaseFirestore.instance.collection('cafes')
    //  .where('nome', isEqualTo: 'UTAM'); - filtro
    lista = FirebaseFirestore.instance.collection('brocas');
  }

  Widget exibirItem(item) {
    String amostra = item.data()['amostra'];
    String secao = item.data()['secao'];
    return ListTile(
      title: Text(
        amostra,
        style: const TextStyle(fontSize: 30),
      ),
      subtitle: Text(
        'R\$ $secao',
        style: const TextStyle(fontSize: 24),
      ),
      trailing: SizedBox(
        width: 80,
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'formulario', arguments:  item.id);
            }, icon: const Icon(Icons.edit)),
            IconButton(onPressed: (){
              //DELETAR UM DOCUMENTO
              lista.doc(item.id).delete();
            }, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, 'telaInicial');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'formulario', arguments: title);
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
                        campo(null, 'Seção (fazenda)', psecao),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: campo(null, 'Quadra (Gleba)', pquadra),
                              ),
                            ),
                            Expanded(
                              child: campo(null, 'Talhão', ptalao),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34, vertical: 5),
              child: Row(
                children: [
                  textoPadding('Amostra', 0.0, 0.0),
                  textoPadding('Seção', 74.0, 30.0),
                  textoPadding('Quadra', 0.0, 0.0),
                  textoPadding('Talhão', 30.0, 35.0),
                ],
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
      padding: const EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>( //toda e qualquer opração no firestore, FutureBuilder - não monitora em tempo real
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
                              fontWeight: FontWeight.bold
                            ),
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

  textoLista(texto, double tamanho) {
    return SizedBox(
      width: tamanho,
      child: Text(
        texto,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black,
        ),
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
}
