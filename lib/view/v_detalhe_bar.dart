import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';


class DetalheBar extends StatelessWidget {

  Anuncio anuncio;
  int index;

  DetalheBar({Key key, this.anuncio, this.index}): super(key: key);

  @override
  Widget build(BuildContext context) {
  List<Widget> _widgets = <Widget> [
    Image.network(
      "http://pipbeta.com.br/fotos/imoveis/" + anuncio.imagem[0].diretorio + "/" + anuncio.imagem[0].nome
    ),
    ListView(children: <Widget>[
      ListTile(
        leading: Icon(Icons.hotel, size: 35,),
        title: Text("Quartos", style: TextStyle(fontSize: 20),),
        trailing: Text(anuncio.quarto, style: TextStyle(fontSize: 20),),
      ),
      ListTile(
        leading: Icon(Icons.hot_tub, size: 35,),
        title: Text("Banheiro", style: TextStyle(fontSize: 20),),
        trailing: Text(anuncio.banheiro, style: TextStyle(fontSize: 20),),
      )
    ],),
    Text(anuncio.cidade),
    Text(anuncio.logradouro),
  ];
    return _widgets.elementAt(index);
  }
}