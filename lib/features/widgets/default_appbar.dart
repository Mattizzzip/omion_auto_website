

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';

import 'nav_menu_button.dart';

class DefaultAppbar extends StatefulWidget {
  const DefaultAppbar({super.key});

  @override
  State<DefaultAppbar> createState() => _DefaultAppbarState();
}

class _DefaultAppbarState extends State<DefaultAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background, // Темный фон как на скриншоте
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            // Левая часть: Логотип и Бренд
            SvgPicture.asset(
                "icons/mini_car.svg",
              width: 64,
            ),
            const SizedBox(width: 10),
            const Text(
              'OMION | auto',
              style: TextStyle(color: AppColors.lightStyle, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            NavMenuButton(
              title: "How it works",
              targetKey: GlobalKey(),
            ),
            const SizedBox(width: 8),
            NavMenuButton(
              title: "Features",
              targetKey: GlobalKey(),
            ),
            const SizedBox(width: 8),
            NavMenuButton(
              title: "Contacts",
              targetKey: GlobalKey(),
            ),
            const SizedBox(width: 8),
            NavMenuButton(
              title: "Download",
              targetKey: GlobalKey(),
            ),

          ],
        ),
      ),
    );
  }
}


