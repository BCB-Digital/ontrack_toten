import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import '../../core/theme/app_colors_theme.dart';

class DigitalClockComponent extends StatefulWidget {
  const DigitalClockComponent({super.key});

  @override
  State<DigitalClockComponent> createState() => _DigitalClockComponentState();
}

class _DigitalClockComponentState extends State<DigitalClockComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
