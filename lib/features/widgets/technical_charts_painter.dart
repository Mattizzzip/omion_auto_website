import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TechnicalChartsPainter extends CustomPainter {
  final double progress;

  TechnicalChartsPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // 1. ОТРИСОВКА ЛЕГКОЙ ФОНОВОЙ СЕТКИ (Grid)
    _drawBackgroundGrid(canvas, size);

    // Кисть для графиков
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Фиксируем координаты для оранжевой точки-маркера
    // Пусть точка будет на 65% ширины экрана
    final double targetXPercent = 0.65;
    final double markerX = size.width * targetXPercent;
    // Вычисляем Y для оранжевого графика в этой точке (согласно его формуле из _buildCurveTelemetryPath)
    final double markerY = size.height * 0.60 + (math.sin(markerX * 0.03 + 12) * 35);

    // Запоминаем состояние канваса и обрезаем его по прогрессу анимации (эффект слева направо)
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width * progress, size.height));

    final List<Color> chartColors = [
      AppColors.chartBlue,
      AppColors.chartTeal,
      AppColors.chartOrange,
      AppColors.chartRed,
      AppColors.chartPurple,
    ];

    for (int i = 0; i < 5; i++) {
      paint.color = chartColors[i].withOpacity(i > 3 ? 0.4 : 0.9);
      final path = Path();

      switch (i) {
        case 0:
          _buildTelemetryPath(path, size, yOffset: size.height * 0.25, stepX: 30, seed: 10, amplitude: 40);
          break;
        case 1:
          _buildSharpTelemetryPath(path, size, yOffset: size.height * 0.45, stepX: 25, seed: 25, amplitude: 35);
          break;
        case 2:
        // 1. ТЗ: Искривляем оранжевый график краткосрочной коррекции
          _buildCurveTelemetryPath(path, size, yOffset: size.height * 0.60, stepX: 20, seed: 12, amplitude: 35);
          break;
        case 3:
          _buildStepUpTelemetryPath(path, size, yOffset: size.height * 0.75, stepX: 40, amplitude: 30);
          break;
        case 4:
          _buildTelemetryPath(path, size, yOffset: size.height * 0.15, stepX: 50, seed: 5, amplitude: 20);
          break;
      }

      canvas.drawPath(path, paint);
    }

    // Возвращаем канвас из зажима clipRect, чтобы элементы интерфейса не резались наполовину
    canvas.restore();

    // 2 & 3. ТЗ: Отрисовка точки и островка данных
    // Показываем их только тогда, когда линия анимации дошла до этой точки (progress >= targetXPercent)
    if (progress >= targetXPercent) {
      // Плавно проявляем точку и островок в зависимости от оставшегося прогресса
      final double elementOpacity = ((progress - targetXPercent) / (1.0 - targetXPercent)).clamp(0.0, 1.0);

      _drawMarkerAndIsland(canvas, markerX, markerY, elementOpacity);
    }
  }

  // Метод отрисовки легкой сетки
  void _drawBackgroundGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = AppColors.lightStyle.withOpacity(0.04) // Очень легкая, едва заметная сетка
      ..strokeWidth = 1.0;

    const double step = 40.0; // Шаг ячейки сетки в пикселях

    // Вертикальные линии
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    // Горизонтальные линии
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  // Метод отрисовки точки и информационного островка
  void _drawMarkerAndIsland(Canvas canvas, double x, double y, double opacity) {
    // 1. Рисуем оранжевую точку-маркер
    final markerPaint = Paint()
      ..color = AppColors.chartOrange.withValues(alpha: opacity)
      ..style = PaintingStyle.fill;
    final markerLightPaint = Paint()
      ..color = AppColors.chartOrange.withValues(alpha: opacity)
      ..style = PaintingStyle.fill;

    // Внутренняя плотная точка
    canvas.drawCircle(Offset(x, y), 5.0, markerPaint);
    // Внешнее полупрозрачное свечение вокруг точки
    canvas.drawCircle(Offset(x, y), 10.0, markerLightPaint);

    // 2. Рисуем технологичный островок (плашку с текстом) чуть выше и правее точки
    final double islandWidth = 128.0;
    final double islandHeight = 55.0;
    final double offsetX = 20.0; // Смещение вправо от точки
    final double offsetY = -65.0; // Смещение вверх от точки (чтобы не перекрывать график)

    final Rect islandRect = Rect.fromLTWH(x + offsetX, y + offsetY, islandWidth, islandHeight);
    final RRect roundedIsland = RRect.fromRectAndRadius(islandRect, const Radius.circular(6.0));

    // Фон островка — темный, слегка прозрачный, с оранжевой границей в стиле первого референса
    final islandBgPaint = Paint()
      ..color = const Color(0xFF0D1117).withOpacity(opacity * 0.85)
      ..style = PaintingStyle.fill;

    final islandBorderPaint = Paint()
      ..color = AppColors.chartOrange.withOpacity(opacity * 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawRRect(roundedIsland, islandBgPaint);
    canvas.drawRRect(roundedIsland, islandBorderPaint);

    // 3. Выводим текст внутри островка
    final textPainterTitle = TextPainter(
      text: TextSpan(
        text: 'Short Term Fuel Trim:',
        style: TextStyle(
          color: AppColors.lightStyle.withOpacity(opacity * 0.6),
          fontSize: 11,
          fontFamily: 'Roboto', // Можно заменить на ваш системный шрифт
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final textPainterValue = TextPainter(
      text: TextSpan(
        text: 'value: ',
        style: TextStyle(color: AppColors.lightStyle.withOpacity(opacity * 0.5), fontSize: 13),
        children: [
          TextSpan(
            text: '5.5%',
            style: TextStyle(color: AppColors.chartOrange.withOpacity(opacity), fontWeight: FontWeight.bold),
          ),
        ],
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Размещаем текст с отступами внутри отрисованной плашки
    textPainterTitle.paint(canvas, Offset(x + offsetX + 12, y + offsetY + 10));
    textPainterValue.paint(canvas, Offset(x + offsetX + 12, y + offsetY + 28));
  }

  // Искривленный график (Ломаная линия с частым шагом для создания эффекта кривизны)
  void _buildCurveTelemetryPath(Path path, Size size, {required double yOffset, required double stepX, required int seed, required double amplitude}) {
    bool isFirst = true;
    for (double x = 0; x <= size.width; x += stepX) {
      // Используем плавную синусоидальную основу, чтобы график стал волнообразным и искривленным
      double y = yOffset + (math.sin(x * 0.03 + seed) * amplitude);

      if (isFirst) {
        path.moveTo(x, y);
        isFirst = false;
      } else {
        path.lineTo(x, y);
      }
    }
  }

  // Остальные методы генерации путей (оставляем без изменений)
  void _buildTelemetryPath(Path path, Size size, {required double yOffset, required double stepX, required int seed, required double amplitude}) {
    bool isFirst = true;
    for (double x = 0; x <= size.width; x += stepX) {
      double randomFactor = math.sin(x * 0.05 + seed) * math.cos(x * 0.02);
      double y = yOffset + (randomFactor * amplitude);
      if (isFirst) { path.moveTo(x, y); isFirst = false; } else { path.lineTo(x, y); }
    }
  }

  void _buildSharpTelemetryPath(Path path, Size size, {required double yOffset, required double stepX, required int seed, required double amplitude}) {
    bool isFirst = true;
    for (double x = 0; x <= size.width; x += stepX) {
      double randomFactor = (math.sin(x * 0.1 + seed).abs() - 0.5) * 2;
      double y = yOffset + (randomFactor * amplitude);
      if (isFirst) { path.moveTo(x, y); isFirst = false; } else { path.lineTo(x, y); }
    }
  }

  void _buildStepUpTelemetryPath(Path path, Size size, {required double yOffset, required double stepX, required double amplitude}) {
    path.moveTo(0, yOffset);
    double currentY = yOffset;
    for (double x = 0; x <= size.width; x += stepX) {
      if (x > size.width * 0.4 && x < size.width * 0.75) { currentY = yOffset - amplitude * 0.5; }
      else if (x >= size.width * 0.75) { currentY = yOffset - amplitude; }
      path.lineTo(x, currentY);
    }
  }

  @override
  bool shouldRepaint(covariant TechnicalChartsPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
