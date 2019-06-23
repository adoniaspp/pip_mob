import 'package:flutter/material.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:pip_mob/view/v_detalhe_basico.dart';
import 'package:pip_mob/view/v_detalhe_dados.dart';
import 'package:pip_mob/view/v_detalhe_endereco.dart';
import 'package:pip_mob/view/v_detalhe_contato.dart';


class DetalheBar extends StatelessWidget {
  final Anuncio anuncio;
  final int index;
  
  DetalheBar({Key key, this.anuncio, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    List<Widget> _widgets = <Widget>[
      DetalheBasico(anuncio: anuncio,),
      DetalheDados(anuncio: anuncio,),
      DetalheEndereco(anuncio: anuncio),
      DetalheContato(anuncio: anuncio,),
    ];
    return _widgets.elementAt(index);
  }
}
