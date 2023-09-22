import 'dart:convert';
import 'dart:core';

SolicitacaoCodigoFuncionario randomSolicitacaoCodigoFuncionarioFromMap(String str) =>
    SolicitacaoCodigoFuncionario.fromJson(json.decode(str));

class SolicitacaoCodigoFuncionario {
  late String matricula;
  late String codigoEmpresa;

  SolicitacaoCodigoFuncionario({required this.matricula, required this.codigoEmpresa});

  factory SolicitacaoCodigoFuncionario.fromJson(Map<String, dynamic> json) => SolicitacaoCodigoFuncionario(
        matricula: json["matricula"],
        codigoEmpresa: json["codigoEmpresa"],
      );

  Map<String, dynamic> toMap() => {
        "matricula": matricula,
        "codigoEmpresa": codigoEmpresa,
      };
}
