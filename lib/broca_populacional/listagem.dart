import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListagemBrocaPopulacional extends StatefulWidget {
  const ListagemBrocaPopulacional({ Key? key }) : super(key: key);

  @override
  _ListagemBrocaPopulacionalState createState() => _ListagemBrocaPopulacionalState();
}

class _ListagemBrocaPopulacionalState extends State<ListagemBrocaPopulacional> {
  var psecao = TextEditingController();
  var pquadra = TextEditingController();
  var ptalao = TextEditingController();
  var pesquisa = TextEditingController();
  bool _isVisible = false;
  var visualizar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broca Populacional'),
        centerTitle: false,

        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        leading : IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, 'telaInicial');
          },
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'brocaPopulacional');
        },
        child: Icon(Icons.add, color: Theme.of(context).primaryColor,),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: campo('Pesquisa',null,pesquisa)),
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
                    padding: EdgeInsets.symmetric(vertical:10),
                    child: Column(
                      children: [
                        campo(null, 'Seção (fazenda)', psecao),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(padding: EdgeInsets.only(right: 16), child: campo(null, 'Quadra (Gleba)', pquadra),),
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
              padding: EdgeInsets.symmetric(horizontal: 34,vertical: 5),
              child: Row(
                children: [              
                  textoPadding('Amostra',0,0),
                  textoPadding('Seção',74,30),
                  textoPadding('Quadra',0,0),
                  textoPadding('Talhão',30,35),
                ],
              ),
            ),
            Expanded(child: listagem(),),
            
          ],
        ),
      ),
    );
  }
  listagem() {
    return Container(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 34),
              hoverColor: Theme.of(context).backgroundColor,
              title: Row(
                children: [
                  textoLista('Amostra ${index + 1}',145),
                  textoLista('x1',80),
                  textoLista('x2',95),
                  textoLista('x3',null),
                ],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Você clicou na amostra ${index + 1}'),
                ));
              },
            ),
            decoration: 
              BoxDecoration(
                border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 232, 229, 1)), top: index == 0 ? BorderSide(color: Color.fromRGBO(230, 232, 229, 1)) : BorderSide.none)
              ),
          );
        },
      ),
    );
  }

  textoPadding(texto,pright,pleft) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: pright, right: pleft),
        child: Text(
          texto,
          style: 
            GoogleFonts.poppins(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500
            ),
        ),
      ),
      
    );
  }

  textoLista(texto,tamanho) {
    return SizedBox(
      width: tamanho,
      child: Text(
        texto,
        style: 
          GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
          ),
      ),
    );
  }

  campo(title,texto,variavelControle){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(34, 6, 34, 6),
            child: title == null ? Text(
              texto,
              textAlign: TextAlign.end,
              style:
                  GoogleFonts.poppins(fontSize: 16, color: Theme.of(context).primaryColor),
            ): null,
          ),
          Padding(
            padding: title == null ? EdgeInsets.fromLTRB(34, 6, 34, 6) : EdgeInsets.fromLTRB(34, 6, 0, 6),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
              cursorColor: Theme.of(context).secondaryHeaderColor,
              
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0)
                ),
                suffixIcon: title == null ? Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor) : null,
                prefixIcon: texto == null ? Icon(Icons.search, color: Theme.of(context).primaryColor) : null,
                hintText: texto == null ? title : null,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(183, 183, 183, 1),
                  fontSize: 16                
                ),
                filled: true,
                fillColor: Colors.white,
                hoverColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor)
                ),
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
        label: Text('')
      ),
    );
  }
}