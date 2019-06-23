import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';

class DetalheDados extends StatelessWidget {

  final Anuncio anuncio;

  DetalheDados({Key key, this.anuncio}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
      );
  }
}