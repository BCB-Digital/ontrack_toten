import 'package:flutter/material.dart';
import 'package:ontrack_toten/app/core/theme/app_colors_theme.dart';
import 'package:ontrack_toten/app/modules/home/pages/horizontal_page.dart';
import 'package:ontrack_toten/app/modules/home/pages/vertical_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var orientacao = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: AppColorsTheme.backgroundColor,
        body: AnimatedContainer(
          duration: const Duration(seconds: 5),
          child: orientacao == Orientation.portrait
              ? VerticalPage(
                  onPressed: () {},
                )
              : HorizontalPage(
                  onPressed: () {},
                ),
        ),);
  }
}
