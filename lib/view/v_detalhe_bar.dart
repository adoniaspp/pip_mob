import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:photo_view/photo_view.dart';

class DetalheBar extends StatelessWidget {
  final Anuncio anuncio;
  final int index;

  DetalheBar({Key key, this.anuncio, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imagens = new List<Widget>();
    anuncio.imagem.forEach((imagem) {
      imagens.add(GestureDetector(
          onTap: () {
            print('oi');
          },
          child: Container(
              child: FittedBox(
            fit: BoxFit.cover,
            child: FadeInImage.assetNetwork(
              image: "http://pipbeta.com.br/fotos/imoveis/" +
                  imagem.diretorio +
                  "/" +
                  imagem.nome,
              placeholder: 'assets/casa.png',
            ),
          ))));
    });
    List<Widget> _widgets = <Widget>[
      ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            viewportFraction: 1.0,
            items: imagens,
            enlargeCenterPage: true,
            //aspectRatio: 1.8,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              anuncio.finalidade,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              anuncio.tipo,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              moneyFormat(anuncio.valormin),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(color: Colors.black,),
          Container(
            margin: EdgeInsets.only(left: 17, right: 17, bottom: 17, top: 20),
            child: Text(
              anuncio.tituloanuncio,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 17, right: 17),
            child: Text(anuncio.descricaoanuncio)),
        ],
      ),
      ListView(
        children: <Widget>[
          
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
