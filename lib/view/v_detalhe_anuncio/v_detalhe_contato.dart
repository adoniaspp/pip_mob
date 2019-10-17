import 'package:flutter/material.dart';
import 'package:pip_mob/bloc/busca_anuncio_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class DetalheContato extends StatelessWidget {

  final AnuncioBloc bloc = BlocProvider.getBloc<AnuncioBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: bloc.outDetalheAnuncio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic listaAnuncios = snapshot.data;
            dynamic anuncio = listaAnuncios.anuncio[0];
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
