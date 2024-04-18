import 'dart:math';

import 'package:flutter/material.dart';

class SectorDiagram extends StatelessWidget {
  final double usedPercentage;
  final double unusedPercentage;
  final double wastePercentage;

  SectorDiagram({
    required this.usedPercentage,
    required this.unusedPercentage,
    required this.wastePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Required Stocks',
          //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 8.0),
          Stack(
            children: [
              CustomPaint(
                size: Size(200, 200),
                painter: SectorPainter(
                  usedPercentage: usedPercentage,
                  unusedPercentage: unusedPercentage,
                  wastePercentage: wastePercentage,
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomPaint(
                      size: Size(200, 200),
                      painter: PercentagePainter(
                        usedPercentage: usedPercentage,
                        unusedPercentage: unusedPercentage,
                        wastePercentage: wastePercentage,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectorPainter extends CustomPainter {
  final double usedPercentage;
  final double unusedPercentage;
  final double wastePercentage;

  SectorPainter({
    required this.usedPercentage,
    required this.unusedPercentage,
    required this.wastePercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double totalPercentage = usedPercentage + unusedPercentage + wastePercentage;
    double usedAngle = 2 * pi * usedPercentage / totalPercentage;
    double unusedAngle = 2 * pi * unusedPercentage / totalPercentage;
    double wasteAngle = 2 * pi * wastePercentage / totalPercentage;

    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    Paint usedPaint = Paint()..color = Colors.green;
    Paint unusedPaint = Paint()..color = Colors.grey;
    Paint wastePaint = Paint()..color = Colors.red;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      usedAngle,
      true,
      usedPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + usedAngle,
      unusedAngle,
      true,
      unusedPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + usedAngle + unusedAngle,
      wasteAngle,
      true,
      wastePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PercentagePainter extends CustomPainter {
  final double usedPercentage;
  final double unusedPercentage;
  final double wastePercentage;

  PercentagePainter({
    required this.usedPercentage,
    required this.unusedPercentage,
    required this.wastePercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double totalPercentage = usedPercentage + unusedPercentage + wastePercentage;
    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      
    );

    drawPercentageText(
      canvas,
      center,
      radius,
      -pi / 2,
      usedPercentage * totalPercentage,
      usedPercentage,
      Colors.green,
      textPainter,
    );

    drawPercentageText(
      canvas,
      center,
      radius,
      -pi / 2 + 2 * pi * usedPercentage,
      unusedPercentage * totalPercentage,
      unusedPercentage,
      Colors.grey,
      textPainter,
    );

    drawPercentageText(
      canvas,
      center,
      radius,
      -pi / 2 + 2 * pi * (usedPercentage + unusedPercentage),
      wastePercentage * totalPercentage,
      wastePercentage,
      Colors.red,
      textPainter,
    );
  }

  void drawPercentageText(
    Canvas canvas,
    Offset center,
    double radius,
    double startAngle,
    double totalAngle,
    double percentage,
    Color color,
    TextPainter textPainter,
  ) {
    double angle = startAngle + totalAngle / 2;
    Offset textOffset = Offset(
      center.dx + radius * 0.7 * cos(angle),
      center.dy + radius * 0.7 * sin(angle),
    );

    textPainter.text = TextSpan(
    
      text: '${(percentage * 100).toStringAsFixed(0)}%',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    );

    textPainter.layout();
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
