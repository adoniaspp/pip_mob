import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pip_mob/bloc/busca_anuncio_bloc.dart';

class DadosTerreno extends StatelessWidget {
  
  final AnuncioBloc bloc = BlocProvider.getBloc<AnuncioBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: bloc.outDetalheAnuncio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic listaAnuncios = snapshot.data;
            dynamic anuncio = listaAnuncios.anuncio[0];
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
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
