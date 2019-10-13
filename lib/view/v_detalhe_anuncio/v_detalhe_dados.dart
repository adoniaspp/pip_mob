import 'package:flutter/material.dart';
import 'package:pip_mob/bloc/busca_anuncio_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/model/Anuncio.dart';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:pip_mob/view/v_detalhe_anuncio/v_detalhe_dados_casa.dart';

class DetalheDados extends StatelessWidget {
  final int index;
  AnuncioBloc bloc = BlocProvider.getBloc<AnuncioBloc>();

  DetalheDados({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listDados = {
      'casa': DadosCasa(index: index,),
    };
    return StreamBuilder<Object>(
        stream: bloc.outBuscaAnuncio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BuscaAnuncio listaAnuncios = snapshot.data;
            Anuncio anuncio = listaAnuncios.anuncio[index];
            return listDados[anuncio.tipo];
          }else{
            return CircularProgressIndicator();
          }
        });
  }
}
