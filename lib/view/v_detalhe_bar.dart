import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetalheBar extends StatelessWidget {
  final Anuncio anuncio;
  final int index;

  DetalheBar({Key key, this.anuncio, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imagens = new List<Widget>();
    anuncio.imagem.forEach((imagem){
      imagens.add(Image.network("http://pipbeta.com.br/fotos/imoveis/" +
      imagem.diretorio + "/" + imagem.nome)
      );  
    });

    List<Widget> _widgets = <Widget>[
      Column(
        children: <Widget>[
          CarouselSlider(
             items: imagens,
             enlargeCenterPage: true,
            aspectRatio: 2.0,
          ),         
          /*Image.network("http://pipbeta.com.br/fotos/imoveis/" +
              anuncio.imagem[0].diretorio +
              "/" +
              anuncio.imagem[0].nome),*/
          SizedBox(
            height: 50,
          ),
          Text(anuncio.tituloanuncio),
          Text(anuncio.descricaoanuncio),
        ],
      ),
      ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.attach_money,
              size: 35,
            ),
            title: Text(
              "Valor",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              moneyFormat(anuncio.valormin),
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.hotel,
              size: 35,
            ),
            title: Text(
              "Quartos",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              anuncio.quarto,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.hot_tub,
              size: 35,
            ),
            title: Text(
              "Banheiro",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              anuncio.banheiro,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.directions_car,
              size: 35,
            ),
            title: Text(
              "Garagem",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              anuncio.garagem,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.zoom_out_map,
              size: 35,
            ),
            title: Text(
              "Área",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              anuncio.area,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.local_hotel,
              size: 35,
            ),
            title: Text(
              "Suíte",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              anuncio.suite,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.ac_unit,
              size: 35,
            ),
            title: Text(
              "Condição",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Text(
              anuncio.condicao,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      Text(anuncio.logradouro +
          " " +
          anuncio.cidade +
          " " +
          anuncio.bairro +
          " " +
          anuncio.cep +
          " " +
          anuncio.numero +
          " " +
          anuncio.estado +
          " " +
          anuncio.complemento.toString() +
          " " +
          anuncio.longitude.toString() +
          " " +
          anuncio.latitude.toString()),
      Text(anuncio.email),
    ];
    return _widgets.elementAt(index);
  }

  String moneyFormat(String money) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: double.parse(money),
        settings: MoneyFormatterSettings(
            symbol: 'R\$',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 2,
            compactFormatType: CompactFormatType.short));
    return fmf.output.symbolOnLeft;
  }
}
