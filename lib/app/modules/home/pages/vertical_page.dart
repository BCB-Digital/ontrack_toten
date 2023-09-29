import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ontrack_toten/app/core/domain/model/codigo_ativacao.dart';
import 'package:ontrack_toten/app/core/domain/model/erro_code_response.dart';
import 'package:ontrack_toten/app/core/domain/model/solicitacao_codigo_funcionario.dart';
import 'package:ontrack_toten/app/core/services/ontrack_service.dart';

import '../../../core/theme/app_colors_theme.dart';
import '../../components/custom_centralized_buttom.dart';
import '../../components/digital_clock_component.dart';
import '../../components/ontrack_banner.dart';

class VerticalPage extends StatefulWidget {
  const VerticalPage({super.key});

  @override
  State<VerticalPage> createState() => _VerticalPageState();
}

class _VerticalPageState extends State<VerticalPage> {
  CodigoAtivacao? codigoAtivacao;
  SolicitacaoCodigoFuncionario? codigoFuncionario;
  final matriculaController = TextEditingController();
  final codigoEmpresaController = TextEditingController();


  void _buRecuperaCodigoParaPonto() async {
    final response = await OntrackService().postCodigoPonto(codigoFuncionario!);
    setState(() {
      if (response is ErroCodeResponse) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: AppColorsTheme.baseColor,
              title: Text(
                response.message,
                style: const TextStyle(color: AppColorsTheme.primaryColor, fontWeight: FontWeight.bold),
              ),
              actions: [
                ElevatedButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(color: AppColorsTheme.primaryColor, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        codigoAtivacao = response as CodigoAtivacao?;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        codigoAtivacao == null
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const OntrackBanner(),
            const DigitalClockComponent(),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        color: AppColorsTheme.secundaryDarkerColor.withAlpha(90),
                        border: Border.all(
                          color: AppColorsTheme.secundaryColor,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        "Matrícula",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColorsTheme.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        color: AppColorsTheme.secundaryDarkerColor.withAlpha(90),
                        border: Border.all(
                          color: AppColorsTheme.secundaryColor,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        "Código Empresa",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColorsTheme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  children: [
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: matriculaController,
                        onChanged: (value) {
                          setState(() {
                            codigoFuncionario?.matricula = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColorsTheme.primaryColor,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Informe sua matrícula',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        controller: codigoEmpresaController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            codigoFuncionario?.codigoEmpresa = value;
                          });
                        },
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColorsTheme.primaryColor,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Informe o código da empresa',
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            CustomCentralizedButtom(
              onPressed: _buRecuperaCodigoParaPonto,
              buttomText: "Gerar Código",
            ),
            const Spacer(
              flex: 6,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "Powered by BYG Nexus",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColorsTheme.primaryColor,
                ),
              ),
            ),
          ],
        )
        : Container(),
        Positioned(
          left: -125,
          bottom: -150,
          height: 500,
          width: 450,
          child: SvgPicture.asset(
            'assets/images/relogio_3d.svg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
