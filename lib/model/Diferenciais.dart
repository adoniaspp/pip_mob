class Diferenciais {
  String idimovel;
  String descricao;

  Diferenciais({this.idimovel, this.descricao});

  Diferenciais.fromJson(Map<String, dynamic> json) {
    idimovel = json['idimovel'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idimovel'] = this.idimovel;
    data['descricao'] = this.descricao;
    return data;
  }
}