import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:pip_mob/service/busca_anuncio.dart';

class AnuncioBloc extends BlocBase{

  AnuncioBloc();

  var _buscaAnuncioController = BehaviorSubject<BuscaAnuncio>();

  Stream<BuscaAnuncio> get outBuscaAnuncio => _buscaAnuncioController.stream;

  Sink<BuscaAnuncio> get inBuscaAnuncio => _buscaAnuncioController.sink;

  buscaAnuncio() async{
      inBuscaAnuncio.add(await BuscaAnuncioService.buscaAnuncio());
  }

  @override
  void dispose() {
    _buscaAnuncioController.close();
    super.dispose();
  }

}