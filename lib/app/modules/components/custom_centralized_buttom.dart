import 'package:flutter/material.dart';
import '../../core/theme/app_colors_theme.dart';

class CustomCentralizedButtom extends StatefulWidget {
  final VoidCallback? onPressed;
  final String buttomText;

  const CustomCentralizedButtom({super.key, required this.onPressed, required this.buttomText});

  @override
  State<CustomCentralizedButtom> createState() => _CustomCentralizedButtomState();
}

class _CustomCentralizedButtomState extends State<CustomCentralizedButtom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: widget.onPressed,
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
            child: Center(
              child: Text(
                widget.buttomText,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColorsTheme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
