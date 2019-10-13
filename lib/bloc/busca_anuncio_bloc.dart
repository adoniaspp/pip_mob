import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:pip_mob/service/busca_anuncio.dart';

class AnuncioBloc extends BlocBase{

  AnuncioBloc();

  var _buscaAnuncioController = BehaviorSubject<BuscaAnuncio>();

  Stream<BuscaAnuncio> get outBuscaAnuncio => _buscaAnuncioController.stream;

  Sink<BuscaAnuncio> get inBuscaAnuncio => _buscaAnuncioController.sink;

  var _detalheAnuncioController = BehaviorSubject<BuscaAnuncio>();

  Stream<BuscaAnuncio> get outDetalheAnuncio => _detalheAnuncioController.stream;

  Sink<BuscaAnuncio> get inDetalheAnuncio => _detalheAnuncioController.sink;

  buscaAnuncio() async{
      inBuscaAnuncio.add(await BuscaAnuncioService.buscaAnuncio());
  }

  detalharAnuncio(final parametros) async{
      inDetalheAnuncio.add(await BuscaAnuncioService.detalheAnuncio());
  }

  @override
  void dispose() {
    _buscaAnuncioController.close();
    _detalheAnuncioController.close();
    super.dispose();
  }

}