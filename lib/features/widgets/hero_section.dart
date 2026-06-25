import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
import 'package:omion_auto_website/features/widgets/store_badge.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
      color: AppColors.background, // Темный фон лендинга
      child: TweenAnimationBuilder<double>(
        // Анимируем значение от 0.0 (старт) до 1.0 (финиш)
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 1500), // Длительность анимации (1 секунда)
        curve: Curves.easeOutCubic, // Мягкое замедление в конце движения
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Изменяем прозрачность от 0.0 до 1.0
            child: Transform.translate(
              // Сдвиг по вертикали (Y): начинается с 50 пикселей внизу и плавно приходит в 0
              offset: Offset(0, 50 * (1 - value)),
              child: child,
            ),
          );
        },
        // Контент выносим в child, чтобы он не перестраивался на каждом кадре анимации
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Центральная графика (Телефон + Автомобиль)
            SvgPicture.asset("icons/car_logo.svg", width: 800,),
            const SizedBox(height: 40),

            const Text(
              'Smart Vehicle Telematics in Your Pocket',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.lightStyle,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/phone_hero.png",
                  width: 128,),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Turn your smartphone into a professional diagnostic tool. OMION connects directly to your car, delivering real-time data, performance metrics, and comprehensive health reports in a clean, intuitive interface.',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: null,
                        style: TextStyle(
                          color: AppColors.lightStyle,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 24),
                      StoreBadgesRow(),
                    ],
                  )
                ),
                const SizedBox(width: 16),
                Image.asset("assets/images/phone_hero.png",
                  width: 128,),
              ],
            )

          ],
        ),
      ),
    );
  }
}
