import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:pip_mob/util/functions.dart';
import 'package:pip_mob/bloc/anuncio_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:pip_mob/model/Anuncio.dart';


class DetalheEndereco extends StatelessWidget {
  final int index;
  AnuncioBloc bloc = BlocProvider.getBloc<AnuncioBloc>();
  
  DetalheEndereco({Key key, this.index}) : super(key: key);

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: bloc.outBuscaAnuncio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BuscaAnuncio listaAnuncios = snapshot.data;
            Anuncio anuncio = listaAnuncios.anuncio[index];
            return ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 17, top: 10, right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Logradouro:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*Text(
                        anuncio.logradouro +
                            " nº " +
                            anuncio.numero +
                            " " +
                            anuncio.complemento.toString() == 'null' ? '' : anuncio.complemento,
                        style: TextStyle(fontSize: 20),
                      ),*/
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bairro:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                    zoomGesturesEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(anuncio.latitude),
                          double.parse(anuncio.longitude)),
                      zoom: 16.75,
                    ),
                    markers: <Marker>{
                      Marker(
                        markerId: MarkerId(anuncio.latitude.toString()),
                        position: LatLng(double.parse(anuncio.latitude),
                            double.parse(anuncio.longitude)),
                        infoWindow: InfoWindow(
                          title: anuncio.finalidade + " de " + anuncio.tipo,
                          snippet: Functions.moneyFormat(anuncio.valormin),
                        ),
                        icon: BitmapDescriptor.defaultMarker,
                      )
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
