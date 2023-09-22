import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ontrack_toten/app/core/domain/model/codigo_ativacao.dart';
import 'package:ontrack_toten/app/core/domain/model/solicitacao_codigo_funcionario.dart';
import 'package:ontrack_toten/app/core/requests/app_requests.dart';

class OntrackService {

  Future<CodigoAtivacao> postCodigoPonto(SolicitacaoCodigoFuncionario solicitacaoCodigoFuncionario) async{
    final response = await http.post(
        Uri.parse(AppRequests.requisicaoGeraCodigoPonto),
      body: solicitacaoCodigoFuncionario.toString()
    );

    if(response.statusCode == 200) {
      return CodigoAtivacao.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }
}
