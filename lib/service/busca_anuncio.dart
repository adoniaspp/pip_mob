import 'dart:convert';
import 'package:pip_mob/model/busca_anuncio.dart';
import 'package:dio/dio.dart';

class BuscaAnuncioService
{

static Future<BuscaAnuncio> buscaAnuncio() async{
  var url = "https://www.piponline.com.br";
  FormData formData = new FormData.from({
    'hdnEntidade' : 'Anuncio',
    'hdnAcao' : 'buscarAnuncio',
    'tipoImovel' : 'todos',
    'garagem': 'false',
    'mobileDevice': 'true'
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

static Future<BuscaAnuncio> detalheAnuncio() async{
    var url = "http://192.168.1.107:80/";
    Dio dio = new Dio();
    var response = await dio.get(url);
    return BuscaAnuncio.fromJson(jsonDecode(response.data));
}


}