import 'package:flutter/material.dart';
import 'package:pip_mob/view/v_detalhe_anuncio/v_detalhe_basico.dart';
import 'package:pip_mob/view/v_detalhe_anuncio/v_detalhe_dados.dart';
import 'package:pip_mob/view/v_detalhe_anuncio/v_detalhe_endereco.dart';
import 'package:pip_mob/view/v_detalhe_anuncio/v_detalhe_contato.dart';


class DetalheBar extends StatelessWidget {
  final int index;
  
  DetalheBar({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    List<Widget> _widgets = <Widget>[
      DetalheBasico(),
      DetalheDados(),
      DetalheEndereco(),
      DetalheContato(),
    ];
    return _widgets.elementAt(index);
  }
}
