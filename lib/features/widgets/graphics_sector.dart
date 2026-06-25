
import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/widgets/technical_charts_painter.dart';

import '../theme/app_colors.dart';


class GraphicsSector extends StatefulWidget {
  const GraphicsSector({super.key});

  @override
  State<GraphicsSector> createState() => _GraphicsSectorState();
}

class _GraphicsSectorState extends State<GraphicsSector> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _textFadeAnimation;
  late Animation<double> _chartProgressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Общая длительность сцены
    );

    // Анимация появления текста (первая половина времени)
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Анимация графиков слева направо (идет параллельно и чуть дольше)
    _chartProgressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 1.0, curve: Curves.easeInOutCubic),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > 900;

        // Контент слева (Текст)
        Widget textContent = FadeTransition(
          opacity: _textFadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Real-Time Automotive\nTelemetry & Data\nProcessing',
                style: TextStyle(
                  color: AppColors.lightStyle,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Track sensors, valve, and fuel trim instantly. Our system processes live OBD-II streams with minimal lag, giving you crystal-clear insights into your engine’s performance right as you drive.',
                style: TextStyle(
                  color: AppColors.lightStyle.withAlpha(90),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'From tracking Short Term Fuel Trims to monitoring engine load and coolant temperatures — capture critical anomalies before they turn into costly repairs.',
                style: TextStyle(
                  color: AppColors.lightStyle.withAlpha(90),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );

        // Контент справа (Технические графики)
        Widget chartsContent = AnimatedBuilder(
          animation: _chartProgressAnimation,
          builder: (context, child) {
            return CustomPaint(
              painter: TechnicalChartsPainter(
                progress: _chartProgressAnimation.value,
              ),
              child: const SizedBox(
                width: double.infinity,
                height: 400,
              ),
            );
          },
        );

        // Адаптивная сетка без фонов и контейнеров
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
          child: isDesktop
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 4, child: textContent),
              const SizedBox(width: 40),
              Expanded(flex: 5, child: chartsContent),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textContent,
              const SizedBox(height: 40),
              chartsContent,
            ],
          ),
        );
      },
    );
  }
}
