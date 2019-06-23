import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/bloc/anuncio_bloc.dart';
import 'package:pip_mob/view/v_busca.dart';
import 'package:pip_mob/view/v_detalhe_anuncio.dart';
import 'package:pip_mob/view/v_detalhe_mensagem.dart';
import 'package:pip_mob/view/v_modal_busca.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        routes: {
          '/detalheAnuncio': (context) => DetalheAnuncio(),
          '/detalheMensagem': (context) => DetalheMensagem(),
          '/modalBusca': (context) => ModalBusca(),
        },
        debugShowCheckedModeBanner: false,
        home: VisaoBusca(),
      ),
      blocs: [
        Bloc((i) => AnuncioBloc()),
      ],
    );
  }
}
