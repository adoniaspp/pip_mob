import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/model/anuncio_salacomercial.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:pip_mob/service/busca_anuncio.dart';

class AnuncioBloc extends BlocBase{

  AnuncioBloc();

  var _buscaAnuncioController = BehaviorSubject<BuscaAnuncio>();

  Stream<BuscaAnuncio> get outBuscaAnuncio => _buscaAnuncioController.stream;

  Sink<BuscaAnuncio> get inBuscaAnuncio => _buscaAnuncioController.sink;

  var _detalheAnuncioController = BehaviorSubject<dynamic>();

  Stream<dynamic> get outDetalheAnuncio => _detalheAnuncioController.stream;

  Sink<dynamic> get inDetalheAnuncio => _detalheAnuncioController.sink;

  buscaAnuncio() async{
      final data = await BuscaAnuncioService.buscaAnuncio();
      inBuscaAnuncio.add(BuscaAnuncio.fromJson(data));
  }

  detalharAnuncio(final parametros) async{

      final data = await BuscaAnuncioService.detalheAnuncio(parametros);
      
      switch(parametros['tipoImovel']){
        case 'salacomercial':
          inDetalheAnuncio.add(ListaSalaComercial.fromJson(data));
        break;
      }
  }

  @override
  void dispose() {
    _buscaAnuncioController.close();
    _detalheAnuncioController.close();
    super.dispose();
  }

}