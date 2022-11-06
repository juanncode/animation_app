import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  double porcentaje = 0;
  double nuevoPorcentaje = 0.0;


  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    controller.addListener(() {
      // print('Valor conmtroler ${controller.value}');
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value) ?? 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0);
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProgress(porcentaje),
          ),
        ),
      ),
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