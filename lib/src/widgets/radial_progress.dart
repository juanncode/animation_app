import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  double porcentaje;
  RadialProgress({Key? key, required this.porcentaje}) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double oldPorcentaje;


  @override
  void initState() {
    oldPorcentaje = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);
    final diferenciaAnimar = widget.porcentaje - oldPorcentaje;
    oldPorcentaje = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, 
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress((widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value)),
          ),
        );
      },
    );
    
  }
}


class _MyRadialProgress  extends CustomPainter{
  final double porcentaje;

  _MyRadialProgress(this.porcentaje);
  
  @override
  void paint(Canvas canvas, Size size) {
    // circulo completado
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    // arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.orange
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // parte q se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi/2,
      arcAngle,
      false,
      paintArco
    );



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}