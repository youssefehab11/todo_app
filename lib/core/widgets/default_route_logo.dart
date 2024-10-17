import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/assets_manager.dart';

class RouteLogo extends StatelessWidget {
  const RouteLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SvgPicture.asset(
        AssetsManager.routeLogoLight,
      ),
    );
  }
}
