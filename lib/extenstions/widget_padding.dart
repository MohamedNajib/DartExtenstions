import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  /// [Padding] Text('Mohamed').paddingAll(50)
  Widget addPaddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget addPaddingVertical(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Widget addPaddingHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Widget addPaddingSymmetric(
          {required double horizontal, required double vertical}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

// ShapeBorder roundedRectangle(double radius) => RoundedRectangleBorder(
//   borderRadius: BorderRadius.all(
//     Radius.circular(radius),
//   ),
// );

  ShapeBorder roundedRectangle(double radius) => RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      );

  addWidgetDecoration({double borderRadius = 15.0, required bool isDark}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5.0,
                  offset: Offset(7, 7),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.white54,
                  blurRadius: 5.0,
                  offset: Offset(7, 7),
                )
              ],
      ),
      child: this,
    );
  }
}

extension SizeBoxExtension on double {
  /// 20.widthBox
  Widget get widthBox => SizedBox(width: this);

  /// 20.heightBox
  Widget get heightBox => SizedBox(height: this);
}
