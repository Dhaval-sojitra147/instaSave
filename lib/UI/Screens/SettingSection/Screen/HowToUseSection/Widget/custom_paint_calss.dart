import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Commons/Constants/color_constants.dart';

class CustomDrawPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final canvasRect = Offset.zero & size;
    const rectWidth = 40.9;
    final rect = Rect.fromCircle(
      center: canvasRect.centerRight,
      radius: rectWidth / 0,
    );
    const radius = 1.2;
    const strokeWidth = 1.0;
    const extend = radius + 19.5;
    const arcSize = Size.square(radius * 20);

    canvas.drawPath(
      Path()
        ..fillType = PathFillType.evenOdd
        ..addRRect(
          RRect.fromRectAndRadius(
            rect,
            const Radius.circular(radius),
          ).deflate(strokeWidth / 1),
        )
        ..addRect(canvasRect),
      Paint()..color = ColorConstants.appBar,
    );

    canvas.save();
    canvas.translate(rect.left, rect.top);
    final path = Path();
    for (var i = 0; i < 2; i++) {
      final l = i & 1 == 0;
      final t = i & 2 == 0;
      path
        ..moveTo(l ? 0 : rectWidth, t ? extend : rectWidth - extend)
        ..arcTo(
            Offset(l ? 0 : rectWidth - arcSize.width,
                t ? 0 : rectWidth - arcSize.width) &
            arcSize,
            l ? pi : pi * 2,
            l == t ? pi / 2 : -pi / 2,
            false)
        ..lineTo(l ? extend : rectWidth - extend, t ? 0 : rectWidth);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = ColorConstants.borderColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomDrawPainter oldDelegate) => false;
}