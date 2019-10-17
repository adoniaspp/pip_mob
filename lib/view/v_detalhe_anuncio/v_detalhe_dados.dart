import 'package:flutter/material.dart';
import 'package:pip_mob/bloc/busca_anuncio_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/view/v_detalhe_anuncio/v_detalhe_dados_casa.dart';
import 'package:pip_mob/view/v_detalhe_anuncio/v_detalhe_dados_salacomercial.dart';

class DetalheDados extends StatelessWidget {
  final AnuncioBloc bloc = BlocProvider.getBloc<AnuncioBloc>();

  @override
  Widget build(BuildContext context) {
    final listDados = {
      'casa': DadosCasa(),
      'salacomercial': DadosSalaComercial(),
    };
    return StreamBuilder<Object>(
        stream: bloc.outDetalheAnuncio,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic listaAnuncios = snapshot.data;
            dynamic anuncio = listaAnuncios.anuncio[0];
            return listDados[anuncio.tipo];
          }else{
            return CircularProgressIndicator();
          }
        });
  }
}
