import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetalheBar extends StatelessWidget {
  final Anuncio anuncio;
  final int index;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controller = Completer();

  DetalheBar({Key key, this.anuncio, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String complemento =
        anuncio.complemento.toString() == 'null' ? '' : anuncio.complemento;
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          Divider(
            color: Colors.black,
          ),
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
              color: Colors.brown,
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
              color: Colors.blue,
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
              color: Colors.black,
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
              color: Colors.green,
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
              color: Colors.purple,
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
              color: Colors.yellow,
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
      ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 17, top: 10, right: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Logradouro:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  anuncio.logradouro +
                      " nº " +
                      anuncio.numero +
                      " " +
                      complemento,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bairro:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  anuncio.bairro,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cidade/Estado:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  anuncio.cidade + "-" + anuncio.estado,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            height: 300,
            width: 300,
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          )
        ],
      ),
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
