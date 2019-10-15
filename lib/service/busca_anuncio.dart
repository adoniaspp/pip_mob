import 'dart:convert';
import 'package:dio/dio.dart';

class BuscaAnuncioService
{

static Future<dynamic> buscaAnuncio() async{
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
  return jsonDecode(response.data);
}

static Future<dynamic> detalheAnuncio(final parametros) async{
    print("aqui");
    var url = "http://192.168.1.107:80/index.php";
    FormData formData = new FormData.from({
    'hdnEntidade' : 'Anuncio',
    'hdnAcao' : 'detalhar',
    'hdnTipoImovel' : parametros['tipoImovel'],
    'hdnCodAnuncio': parametros['idAnuncio'],
    'mobileDevice': 'true'
  });
    Dio dio = new Dio();
    var response = await dio.post(url, data: formData);
    return jsonDecode(response.data);
}


}