import 'dart:convert';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:dio/dio.dart';

class BuscaAnuncioService
{

static Future<BuscaAnuncio> buscaAnuncio() async{
  var url = "http://192.168.1.107:80/index.php";
  FormData formData = new FormData.from({
    'hdnEntidade' : 'Anuncio',
    'hdnAcao' : 'buscarAnuncio',
    'tipoImovel' : 'todos',
    'garagem': 'false'
  });
  Dio dio = new Dio();
  var response = await dio.post(url, data: formData);
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${jsonDecode(response.data)}');
  return BuscaAnuncio.fromJson(jsonDecode(response.data));
  /*a.anuncio.forEach((anuncio){
    print(anuncio.logradouro);
  });*/
}

static Future<BuscaAnuncio> detalheAnuncio(String idAnuncio) async{
    var url = "http://192.168.1.107:80/" + idAnuncio;
    Dio dio = new Dio();
    var response = await dio.get(url);
    return BuscaAnuncio.fromJson(jsonDecode(response.data));
}

}