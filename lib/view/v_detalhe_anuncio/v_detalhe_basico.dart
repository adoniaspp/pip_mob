import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pip_mob/bloc/busca_anuncio_bloc.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:pip_mob/util/functions.dart';
import 'package:pip_mob/model/busca_anuncio.dart';

class DetalheBasico extends StatelessWidget {
  final int index;

  DetalheBasico({Key key, this.index}) : super(key: key);

  AnuncioBloc bloc = BlocProvider.getBloc<AnuncioBloc>();

  List<Widget> imagens = new List<Widget>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: bloc.outBuscaAnuncio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BuscaAnuncio listaAnuncios = snapshot.data;
            Anuncio anuncio = listaAnuncios.anuncio[index];
            anuncio.imagem.forEach((imagem) {
              imagens.add(GestureDetector(
                  onTap: () {
                    print('oi');
                  },
                  child: Container(
                      child: FittedBox(
                    fit: BoxFit.cover,
                    child: FadeInImage.assetNetwork(
                        image:
                            "https://opcionis.cl/blog/wp-content/uploads/2015/10/casa.jpg",
                        placeholder: 'assets/casa.png'),

                    /*FadeInImage.assetNetwork(
              image: "http://pipbeta.com.br/fotos/imoveis/" +
                  imagem.diretorio +
                  "/" +
                  imagem.nome,
              placeholder: 'assets/casa.png',
            ),*/
                  ))));
            });
            return ListView(
              children: <Widget>[
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
                    Functions.moneyFormat(anuncio.valormin),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 17, right: 17, bottom: 17, top: 20),
                  child: Text(
                    anuncio.tituloanuncio,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 17, right: 17),
                    child: Text(anuncio.descricaoanuncio)),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
