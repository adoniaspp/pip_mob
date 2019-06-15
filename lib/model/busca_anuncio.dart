import 'Anuncio.dart';

class BuscaAnuncio {
  List<Anuncio> anuncio;

  BuscaAnuncio({this.anuncio});

  BuscaAnuncio.fromJson(Map<String, dynamic> json) {
    if (json['anuncio'] != null) {
      anuncio = new List<Anuncio>();
      json['anuncio'].forEach((v) {
        anuncio.add(new Anuncio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.anuncio != null) {
      data['anuncio'] = this.anuncio.map((v) => v.toJson()).toList();
    }
    return data;
  }
}