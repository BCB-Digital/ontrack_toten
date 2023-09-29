import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ontrack_toten/app/core/domain/model/codigo_ativacao.dart';
import 'package:ontrack_toten/app/core/domain/model/erro_code_response.dart';
import 'package:ontrack_toten/app/core/domain/model/solicitacao_codigo_funcionario.dart';
import 'package:ontrack_toten/app/core/requests/app_requests.dart';

class OntrackService {
  Future<Object> postCodigoPonto(SolicitacaoCodigoFuncionario solicitacaoCodigoFuncionario) async {
    final response = await http.post(
      Uri.parse(AppRequests.requisicaoGeraCodigoPonto),
      headers: {
        'Content-Type': 'application/json', // Defina o cabeçalho Content-Type como application/json
      },
      body: jsonEncode(solicitacaoCodigoFuncionario.toMap()),
    );

    if (response.statusCode == 200) {
      return CodigoAtivacao.fromJson(jsonDecode(response.body));
    } else {
      return ErroCodeResponse.fromJson(jsonDecode(response.body));
    }
  }
}
