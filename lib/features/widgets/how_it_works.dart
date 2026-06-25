import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 40 * (1 - value)),
              child: child,
            ),
          );
        },
        child: Column(
          children: [
            const Text(
              'HOW IT WORKS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            isDesktop
                ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _StepCard(number: '1', title: 'CONNECT TO CAR', subTitle: 'Plug your ELM327 scanner directly into the vehicle\'s OBD2 port.', icon: Icons.directions_car)),
                Expanded(child: _StepCard(number: '2', title: 'PAIR WITH PHONE', subTitle: 'Connect via Wi-Fi or BT. Note: iOS does not support BT Classic.', icon: Icons.bluetooth_searching)),
                Expanded(child: _StepCard(number: '3', title: 'SELECT YOUR VEHICLE', subTitle: 'Specify your car model for accurate diagnostics interpretation.', icon: Icons.fact_check_outlined)),
                Expanded(child: _StepCard(number: '4', title: 'OFFLINE AI ASSISTANT', subTitle: 'Built-in autonomous 2-5 GB AI model that works entirely without internet.', icon: Icons.psychology_outlined)),
              ],
            )
                : Column(
              children: [
                _StepCard(number: '1', title: 'CONNECT TO CAR', subTitle: 'Plug your ELM327 scanner directly into the vehicle\'s OBD2 port.', icon: Icons.directions_car, isMobile: true),
                const SizedBox(height: 40),
                _StepCard(number: '2', title: 'PAIR WITH PHONE', subTitle: 'Connect via Wi-Fi or BT. Note: iOS does not support BT Classic.', icon: Icons.bluetooth_searching, isMobile: true),
                const SizedBox(height: 40),
                _StepCard(number: '3', title: 'SELECT YOUR VEHICLE', subTitle: 'Specify your car model for accurate diagnostics interpretation.', icon: Icons.fact_check_outlined, isMobile: true),
                const SizedBox(height: 40),
                _StepCard(number: '4', title: 'OFFLINE AI ASSISTANT', subTitle: 'Built-in autonomous 2-5 GB AI model that works entirely without internet.', icon: Icons.psychology_outlined, isMobile: true),
              ],
            ),
          ],
        ),
      );
  }
}

class _StepCard extends StatelessWidget {
  final String number;
  final String title;
  final String subTitle;
  final IconData icon;
  final bool isMobile;

  const _StepCard({
    required this.number,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0.0 : 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Растягивает элементы по высоте самого высокого (текста)
              children: [
                // Блок с цифрой, центрированный строго по вертикали относительно текста рядом
                Center(
                  child: Text(
                    number,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.12),
                      fontSize: 56, // Размер подобран под высоту 2 строк заголовка + 2 строк описания
                      fontWeight: FontWeight.bold,
                      height: 2.0, // Убираем дефолтные отступы шрифта для точного выравнивания
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Блок текста
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center, // Центрируем текст по вертикали относительно цифры
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            icon,
            size: 128,
            color: Colors.white.withOpacity(0.2),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
