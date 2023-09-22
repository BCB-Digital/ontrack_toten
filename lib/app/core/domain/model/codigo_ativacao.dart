import 'dart:convert';
import 'dart:core';

CodigoAtivacao randomCodigoAtivacaoFromMap(String str) => CodigoAtivacao.fromJson(json.decode(str));

class CodigoAtivacao {

  late String codigoAtivacao;
  late String matricula;

  CodigoAtivacao({required this.codigoAtivacao, required this.matricula});

  factory CodigoAtivacao.fromJson(Map<String, dynamic> json) => CodigoAtivacao(codigoAtivacao: json["codigoAtivacao"], matricula: json["matricula"]);
  Map<String, dynamic> toMap() => {
    "codigoAtivacao": codigoAtivacao,
    "matricula": matricula,
  };
}