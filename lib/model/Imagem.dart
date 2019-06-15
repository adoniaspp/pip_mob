class Imagem {
  String idanuncio;
  String diretorio;
  String legenda;
  String nome;
  String destaque;

  Imagem(
      {this.idanuncio, this.diretorio, this.legenda, this.nome, this.destaque});

  Imagem.fromJson(Map<String, dynamic> json) {
    idanuncio = json['idanuncio'];
    diretorio = json['diretorio'];
    legenda = json['legenda'];
    nome = json['nome'];
    destaque = json['destaque'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idanuncio'] = this.idanuncio;
    data['diretorio'] = this.diretorio;
    data['legenda'] = this.legenda;
    data['nome'] = this.nome;
    data['destaque'] = this.destaque;
    return data;
  }
}
