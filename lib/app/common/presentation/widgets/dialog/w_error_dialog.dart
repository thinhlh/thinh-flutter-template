import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tfc/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:tfc/config/colors.dart';
import 'package:tfc/config/app_sizes.dart';
import 'package:tfc/config/styles.dart';
import 'package:tfc/utils/extensions/context_extension.dart';

class WErrorDialog extends Dialog {
  final DialogType dialogType;
  final String content;
  final void Function() onActionProceed;
  final String? title;
  final String? actionString;

  WErrorDialog({
    Key? key,
    required this.dialogType,
    required this.content,
    required this.onActionProceed,
    this.title,
    this.actionString,
  }) : super(
          key: key,
          child: SizedBox(
            height: 0.35.sh,
            width: 1.sw,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppSizes.extraLargeRadius,
                    ),
                  ),
                  child: CustomPaint(
                    painter: QuaterCirclePainter(
                      color: dialogType.primaryColor,
                    ),
                    foregroundPainter: IconPainter(
                      icon: dialogType.displayIcon,
                      iconColor: dialogType.iconColor,
                    ),
                    size: Size(0.25.sw, 0.25.sw),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.mediumWidthDimens,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title ?? dialogType.title,
                            textAlign: TextAlign.center,
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: AppStyles.bold,
                              color: AppColors.primaryDark,
                            ),
                          ),
                          SizedBox(height: AppSizes.largeHeightDimens),
                          Text(
                            content,
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(height: AppSizes.largeHeightDimens),
                          SizedBox(height: AppSizes.largeHeightDimens),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              onActionProceed.call();
                            },
                            child: Text(
                              (actionString ?? dialogType.actionString)
                                  .toUpperCase(),
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: AppStyles.bold,
                                color: dialogType.primaryColorText,
                                letterSpacing: 4,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.extraLargeRadius,
            ),
          ),
        );
}

class QuaterCirclePainter extends CustomPainter {
  QuaterCirclePainter({required this.color}) : super();

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    const Offset center = Offset(0, 0);

    canvas.drawCircle(center, size.width, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class IconPainter extends CustomPainter {
  final Color? iconColor;
  final IconData icon;

  IconPainter({required this.icon, this.iconColor});
  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: 40.r,
        fontFamily: icon.fontFamily,
        color: iconColor ?? AppColors.neutral.shade50,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width / 4, size.height / 4));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
