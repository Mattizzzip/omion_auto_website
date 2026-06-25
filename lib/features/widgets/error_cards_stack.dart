import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';
import '../theme/breakpoints.dart';

class ErrorCardsStack extends StatelessWidget {
  final Animation<double> animationProgress;

  const ErrorCardsStack({
    super.key,
    required this.animationProgress,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);
    final scale = isMobile ? 0.82 : 1.0;
    const double cardWidth = 320.0;
    const double cardHeight = 160.0;

    return AnimatedBuilder(
      animation: animationProgress,
      builder: (context, child) {
        return Transform.scale(
          scale: scale,
          alignment: Alignment.center,
          child: SizedBox(
            width: cardWidth + 50,
            height: cardHeight + 60,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _buildAppCard(
                  index: 3,
                  width: cardWidth,
                  height: cardHeight,
                  bgColor: AppColors.bodyBg,
                  tagColor: AppColors.bodyTag,
                  textColor: AppColors.background,
                  btnColor: AppColors.bodyTag,
                  categoryName: 'Body',
                  errorTitle: 'Climate Control Failure',
                  errorCode: 'B0100',
                  errorIcon: 'images/error_images/b_type_error.svg',
                ),
                _buildAppCard(
                  index: 2,
                  width: cardWidth,
                  height: cardHeight,
                  bgColor: AppColors.chassisBg,
                  tagColor: AppColors.chassisTag,
                  textColor: AppColors.background,
                  btnColor: AppColors.chassisTag,
                  categoryName: 'Chassis',
                  errorTitle: 'ABS Sensor Circuit Malfunction',
                  errorCode: 'C0035',
                  errorIcon: 'images/error_images/c_type_error.svg',
                ),
                _buildAppCard(
                  index: 1,
                  width: cardWidth,
                  height: cardHeight,
                  bgColor: AppColors.transmissionBg,
                  tagColor: AppColors.transmissionTag,
                  textColor: AppColors.background,
                  btnColor: AppColors.transmissionTag,
                  categoryName: 'Network & Wiring',
                  errorTitle: 'O2 Sensor Circuit Slow Response\n(Bank 1, Sensor 1)',
                  errorCode: 'P0133',
                  isForeground: true,
                  errorIcon: 'images/error_images/p_type_error.svg',
                ),
                _buildAppCard(
                  index: 0,
                  width: cardWidth,
                  height: cardHeight,
                  bgColor: AppColors.networkBg,
                  tagColor: AppColors.networkTag,
                  textColor: AppColors.background,
                  btnColor: AppColors.networkTag,
                  categoryName: 'Network & Wiring',
                  errorTitle: 'CAN Communication Error',
                  errorCode: 'U0300',
                  isForeground: true,
                  errorIcon: 'images/error_images/u_type_error.svg',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppCard({
    required int index,
    required double width,
    required double height,
    required Color bgColor,
    required Color tagColor,
    required Color textColor,
    required Color btnColor,
    required String categoryName,
    required String errorTitle,
    required String errorCode,
    required String errorIcon,
    bool isForeground = false,
  }) {
    final double offsetX = -24.0 * index * animationProgress.value;
    final double offsetY = -20.0 * index * animationProgress.value;
    final double scale = 1.0 - (0.03 * index * animationProgress.value);

    return Positioned(
      left: 10 + offsetX,
      top: 10 + offsetY,
      child: Transform.scale(
        scale: scale,
        alignment: Alignment.topLeft,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isForeground ? 0.15 : 0.05),
                blurRadius: isForeground ? 15 : 5,
                offset: Offset(0, isForeground ? 8 : 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -10,
                  top: -10,
                  child: Opacity(
                    opacity: 0.12,
                    child: SvgPicture.asset(errorIcon, width: 130, color: tagColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: tagColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              categoryName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            errorTitle,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            errorCode,
                            style: TextStyle(
                              color: textColor.withOpacity(0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.search, size: 14, color: Colors.white),
                                SizedBox(width: 4),
                                Text('Search', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: textColor.withOpacity(0.15), width: 1),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.auto_awesome, size: 12, color: textColor),
                                const SizedBox(width: 4),
                                Text('Ask AI', style: TextStyle(color: textColor, fontSize: 11, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
