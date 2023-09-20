import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_clock/one_clock.dart';
import 'package:ontrack_toten/app/core/theme/app_colors_theme.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? onPressed;

  const HomePage({super.key, this.onPressed});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var onPressedAction = widget.onPressed;
    var orientacao = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: AppColorsTheme.backgroundColor,
      body: orientacao == Orientation.portrait
          ? Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 280,
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'images/logo_principal.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        border: Border.all(
                          color: AppColorsTheme.secundaryColor,
                          width: 8,
                        ),
                      ),
                      child: DigitalClock(
                        showSeconds: true,
                        isLive: true,
                        digitalClockTextColor: AppColorsTheme.primaryColor,
                        textScaleFactor: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        datetime: DateTime.now(),
                      ),
                    ),
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
                          children: const [
                            SizedBox(
                              width: 360,
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColorsTheme.primaryColor,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Informe sua matrícula',
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            SizedBox(
                              width: 360,
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColorsTheme.primaryColor,
                                ),
                                decoration: InputDecoration(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onPressedAction,
                          child: Container(
                            width: 320,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColorsTheme.secundaryDarkerColor.withAlpha(90),
                              border: Border.all(
                                color: AppColorsTheme.secundaryColor,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Gerar Código",
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColorsTheme.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                ),
                Positioned(
                  left: -100,
                  bottom: -150,
                  height: 500,
                  width: 450,
                  child: SvgPicture.asset(
                    'images/relogio_3d.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Tela na horizontal"),
                    ),
                    DigitalClock(
                      showSeconds: true,
                      isLive: true,
                      digitalClockTextColor: Colors.black,
                      textScaleFactor: 5,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      datetime: DateTime.now(),
                    ),
                  ],
                ),
                Positioned(
                  left: -100,
                  bottom: -150,
                  height: 500,
                  width: 450,
                  child: SvgPicture.asset(
                    'images/relogio_3d.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
    );
  }
}
