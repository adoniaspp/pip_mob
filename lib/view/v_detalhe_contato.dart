import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:pip_mob/bloc/anuncio_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/model/busca_anuncio.dart';

class DetalheContato extends StatelessWidget {
  final int index;
  AnuncioBloc bloc = BlocProvider.getBloc<AnuncioBloc>();

  DetalheContato({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: bloc.outBuscaAnuncio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BuscaAnuncio listaAnuncios = snapshot.data;
            Anuncio anuncio = listaAnuncios.anuncio[index];
            return Container(
              margin: EdgeInsets.only(left: 17, top: 10, right: 17),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Anunciante:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    anuncio.nome,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "E-mail:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    anuncio.email,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton.icon(
                          label: Text("Enviar Mensagem"),
                          onPressed: () {
                            Navigator.pushNamed(context, '/detalheMensagem');
                          },
                          icon: Icon(Icons.email),
                          color: Colors.blue[100],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton.icon(
                          label: Text("Denunciar Anúncio"),
                          onPressed: () {
                            Navigator.pushNamed(context, '/detalheMensagem');
                          },
                          icon: Icon(Icons.error),
                          color: Colors.red[100],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
