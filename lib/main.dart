import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/bloc/anuncio_bloc.dart';
import 'package:pip_mob/view/v_busca.dart';
import 'package:pip_mob/view/v_detalhe_anuncio.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        routes: {
          '/detalheAnuncio': (context) => DetalheAnuncio(),
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
