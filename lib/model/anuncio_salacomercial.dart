import 'Imagem.dart';

class ListaSalaComercial {
  List<SalaComercial> anuncio;
  int qtdAnuncios;
  String loginUsuario;
  int qtdMensagem;
  Null difPlantas;
  Null mensagem;

  ListaSalaComercial(
      {this.anuncio,
      this.qtdAnuncios,
      this.loginUsuario,
      this.qtdMensagem,
      this.difPlantas,
      this.mensagem});

  ListaSalaComercial.fromJson(Map<String, dynamic> json) {
    if (json['anuncio'] != null) {
      anuncio = new List<SalaComercial>();
      json['anuncio'].forEach((v) {
        anuncio.add(new SalaComercial.fromJson(v));
      });
    }
    qtdAnuncios = json['qtdAnuncios'];
    loginUsuario = json['loginUsuario'];
    qtdMensagem = json['qtdMensagem'];
    difPlantas = json['difPlantas'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.anuncio != null) {
      data['anuncio'] = this.anuncio.map((v) => v.toJson()).toList();
    }
    data['qtdAnuncios'] = this.qtdAnuncios;
    data['loginUsuario'] = this.loginUsuario;
    data['qtdMensagem'] = this.qtdMensagem;
    data['difPlantas'] = this.difPlantas;
    data['mensagem'] = this.mensagem;
    return data;
  }
}

class SalaComercial {
  String idimovel;
  String area;
  String banheiro;
  String garagem;
  String condominio;
  String idanuncio;
  String ordem;
  String idanuncioformatado;
  String finalidade;
  String tituloanuncio;
  String descricaoanuncio;
  String status;
  String publicarmapa;
  String publicarcontato;
  String valormin;
  String datahoracadastro;
  String condicao;
  String tipo;
  String cep;
  String logradouro;
  String numero;
  String idbairro;
  String bairro;
  String idcidade;
  String cidade;
  String idestado;
  String estado;
  Null complemento;
  Null latitude;
  Null longitude;
  String id;
  String nome;
  String tipousuario;
  String email;
  String foto;
  Null novovalor;
  Null percentual;
  List<Imagem> imagem;

  SalaComercial(
      {this.idimovel,
      this.area,
      this.banheiro,
      this.garagem,
      this.condominio,
      this.idanuncio,
      this.ordem,
      this.idanuncioformatado,
      this.finalidade,
      this.tituloanuncio,
      this.descricaoanuncio,
      this.status,
      this.publicarmapa,
      this.publicarcontato,
      this.valormin,
      this.datahoracadastro,
      this.condicao,
      this.tipo,
      this.cep,
      this.logradouro,
      this.numero,
      this.idbairro,
      this.bairro,
      this.idcidade,
      this.cidade,
      this.idestado,
      this.estado,
      this.complemento,
      this.latitude,
      this.longitude,
      this.id,
      this.nome,
      this.tipousuario,
      this.email,
      this.foto,
      this.novovalor,
      this.percentual,
      this.imagem});

  SalaComercial.fromJson(Map<String, dynamic> json) {
    idimovel = json['idimovel'];
    area = json['area'];
    banheiro = json['banheiro'];
    garagem = json['garagem'];
    condominio = json['condominio'];
    idanuncio = json['idanuncio'];
    ordem = json['ordem'];
    idanuncioformatado = json['idanuncioformatado'];
    finalidade = json['finalidade'];
    tituloanuncio = json['tituloanuncio'];
    descricaoanuncio = json['descricaoanuncio'];
    status = json['status'];
    publicarmapa = json['publicarmapa'];
    publicarcontato = json['publicarcontato'];
    valormin = json['valormin'];
    datahoracadastro = json['datahoracadastro'];
    condicao = json['condicao'];
    tipo = json['tipo'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    idbairro = json['idbairro'];
    bairro = json['bairro'];
    idcidade = json['idcidade'];
    cidade = json['cidade'];
    idestado = json['idestado'];
    estado = json['estado'];
    complemento = json['complemento'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
    nome = json['nome'];
    tipousuario = json['tipousuario'];
    email = json['email'];
    foto = json['foto'];
    novovalor = json['novovalor'];
    percentual = json['percentual'];
    if (json['imagem'] != null) {
      imagem = new List<Imagem>();
      json['imagem'].forEach((v) {
        imagem.add(new Imagem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idimovel'] = this.idimovel;
    data['area'] = this.area;
    data['banheiro'] = this.banheiro;
    data['garagem'] = this.garagem;
    data['condominio'] = this.condominio;
    data['idanuncio'] = this.idanuncio;
    data['ordem'] = this.ordem;
    data['idanuncioformatado'] = this.idanuncioformatado;
    data['finalidade'] = this.finalidade;
    data['tituloanuncio'] = this.tituloanuncio;
    data['descricaoanuncio'] = this.descricaoanuncio;
    data['status'] = this.status;
    data['publicarmapa'] = this.publicarmapa;
    data['publicarcontato'] = this.publicarcontato;
    data['valormin'] = this.valormin;
    data['datahoracadastro'] = this.datahoracadastro;
    data['condicao'] = this.condicao;
    data['tipo'] = this.tipo;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['idbairro'] = this.idbairro;
    data['bairro'] = this.bairro;
    data['idcidade'] = this.idcidade;
    data['cidade'] = this.cidade;
    data['idestado'] = this.idestado;
    data['estado'] = this.estado;
    data['complemento'] = this.complemento;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipousuario'] = this.tipousuario;
    data['email'] = this.email;
    data['foto'] = this.foto;
    data['novovalor'] = this.novovalor;
    data['percentual'] = this.percentual;
    if (this.imagem != null) {
      data['imagem'] = this.imagem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
