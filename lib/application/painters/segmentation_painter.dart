import 'dart:math';

import 'package:coco_explorer/domain/coco_dataset/entities/coco_instance.dart';
import 'package:flutter/material.dart';

class SegmentationPainter extends CustomPainter {
  final List<CocoInstance> instances;
  final double widthFraction;
  final double heightFraction;

  SegmentationPainter(this.instances, this.widthFraction, this.heightFraction);

  @override
  void paint(Canvas canvas, Size size) {
    if (instances.isEmpty) return;

    for (CocoInstance instance in instances) {
        if (instance.segmentation.isEmpty) continue;

        final path = Path();

        final r = (Random().nextDouble() * 255).floor();
        final g = (Random().nextDouble() * 255).floor();
        final b = (Random().nextDouble() * 255).floor();
        final color = Color.fromRGBO(r, g, b, 1);

        final paint = Paint()..style = PaintingStyle.fill..color = color.withOpacity(0.4);
        final borderPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 4..color = color;

        path.moveTo(instance.segmentation[0].toDouble() * widthFraction, instance.segmentation[1].toDouble() * heightFraction);

        for (int i = 0; i < instance.segmentation.length; i += 2) {
          path.lineTo(instance.segmentation[i].toDouble() * widthFraction,
              instance.segmentation[i + 1].toDouble() * heightFraction);
        }

        path.close();
        canvas.drawPath(path, borderPaint);
        canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(SegmentationPainter oldDelegate) {
    return oldDelegate.instances != instances;
  }
}
