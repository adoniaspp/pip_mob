import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pip_mob/model/anuncio_casa.dart';
import 'package:pip_mob/model/anuncio_salacomercial.dart';
import 'package:pip_mob/model/anuncio_terreno.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:pip_mob/service/busca_anuncio.dart';

class AnuncioBloc extends BlocBase{

  AnuncioBloc();

  var _buscaAnuncioController = BehaviorSubject<BuscaAnuncio>();

  Stream<BuscaAnuncio> get outBuscaAnuncio => _buscaAnuncioController.stream;

  Sink<BuscaAnuncio> get inBuscaAnuncio => _buscaAnuncioController.sink;

  var _detalheAnuncioController = BehaviorSubject<Object>();

  Stream<Object> get outDetalheAnuncio => _detalheAnuncioController.stream;

  Sink<Object> get inDetalheAnuncio => _detalheAnuncioController.sink;

  buscaAnuncio() async{
      final data = await BuscaAnuncioService.buscaAnuncio();
      inBuscaAnuncio.add(BuscaAnuncio.fromJson(data));
  }

  detalharAnuncio(final tipoImovel, final idAnuncio) async{
      inDetalheAnuncio.add(null);
      final data = await BuscaAnuncioService.detalheAnuncio(tipoImovel, idAnuncio);
      
      switch(tipoImovel){
        case 'salacomercial':
          inDetalheAnuncio.add(ListaSalaComercial.fromJson(data));
        break;
        case 'casa':
          inDetalheAnuncio.add(ListaCasa.fromJson(data));
        break;
        case 'terreno':
          inDetalheAnuncio.add(ListaTerreno.fromJson(data));
        break;
        case 'apartamento':
          inDetalheAnuncio.add(ListaTerreno.fromJson(data));
        break;
        case 'prediocomercial':
          inDetalheAnuncio.add(ListaTerreno.fromJson(data));
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