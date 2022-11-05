import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>  with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<num> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveRigth;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000)
    );

    rotation = Tween(begin: 0.0, end: pi * 2).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut)
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut))
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    moveRigth = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut))
    );

    agrandar = Tween(begin: 1.0, end: 2.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut))
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
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
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moveRigth.value, 0),
          child: Transform.rotate(
            angle: rotation.value.toDouble(),
            child: Opacity(
              opacity: opacity.value  - opacityOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: child,
              ),
            )
          ),
        );
          
      },
    );
  }
}












class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}