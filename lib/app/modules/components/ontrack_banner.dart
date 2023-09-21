import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OntrackBanner extends StatelessWidget {
  const OntrackBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      height: 250,
      width: orientation == Orientation.portrait ? double.infinity : double.infinity * 0.7,
      child: SvgPicture.asset(
        'assets/images/logo_principal.svg',
        fit: BoxFit.cover,
      ),
    );
  }
}
