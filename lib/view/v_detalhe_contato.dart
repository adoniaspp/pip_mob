import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';

class DetalheContato extends StatelessWidget {
  final Anuncio anuncio;

  DetalheContato({Key key, this.anuncio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
