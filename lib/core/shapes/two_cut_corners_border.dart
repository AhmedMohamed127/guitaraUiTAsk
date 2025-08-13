import 'package:flutter/material.dart';

class TwoCutCornersBorder extends ShapeBorder {
  final double cutSize;
  final double otherCornerRadius;

  const TwoCutCornersBorder({this.cutSize = 16, this.otherCornerRadius = 16});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => TwoCutCornersBorder(
        cutSize: cutSize * t,
        otherCornerRadius: otherCornerRadius * t,
      );

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double c = cutSize.clamp(0.0, 0.5 * rect.shortestSide);
    final double r = otherCornerRadius;

    final Path path = Path();
    path.moveTo(rect.left + c, rect.top);
    path.lineTo(rect.right - r, rect.top);
    path.arcToPoint(Offset(rect.right, rect.top + r), radius: Radius.circular(r));
    path.lineTo(rect.right, rect.bottom - c);
    path.lineTo(rect.right - c, rect.bottom);
    path.lineTo(rect.left + r, rect.bottom);
    path.arcToPoint(Offset(rect.left, rect.bottom - r), radius: Radius.circular(r));
    path.lineTo(rect.left, rect.top + c);
    path.lineTo(rect.left + c, rect.top);
    path.close();
    return path;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
}


