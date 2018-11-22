import 'package:flutter/material.dart';

class DevelopmentProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CustomPaint(painter: DevelopmentProgressPainter());
  }
}

class DevelopmentProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

final colors = [
  Color(0xffff0000), Color(0xffffff00), Color(0xff00ff00),
  Color(0xff00ffff), Color(0xff0000ff), Color(0xffff00ff), Color(0xffff0000),
];
final colorStops = [0 / 6, 1 / 6, 2 / 6, 3 / 6, 4 / 6, 5 / 6, 6 / 6];
final gradient = new LinearGradient(colors: colors, stops: colorStops);

    var center = Offset(0, 0);

    var paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(Rect.fromCircle(center: center, radius: 50))
      ..strokeWidth = 5.0;


    //canvas.drawCircle(center, 50, paint);
    canvas.drawArc(        Rect.fromCircle(center: center, radius: 50), 0, 5, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
