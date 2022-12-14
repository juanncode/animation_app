
import 'package:animation_app/src/pages/emergency/boton_gordo.dart';
import 'package:animation_app/src/pages/emergency/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 270),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
                BotonGordoTmp(),
              ],
            ),
          const PageHeader(),

        ],
      ),
    );
  }
}

class BotonGordoTmp extends StatefulWidget {
  const BotonGordoTmp({
    super.key,
  });

  @override
  State<BotonGordoTmp> createState() => _BotonGordoTmpState();
}

class _BotonGordoTmpState extends State<BotonGordoTmp>  with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> move;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    move = Tween(begin: -50.0, end: 50.0).animate(controller);
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
      child: BotonGordo(
        onPress: () {
          print("click");
        },
        texto: "Motor accident2",
        color1: const Color(0xff6989f5),
        color2: const Color(0xff6939e5),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset((move.value) - 50 , 0),
          child: child,
        );
      },
      
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      titulo: 'Haz solicitado',
      subtitle: "Aistencia médica",
      iconData: FontAwesomeIcons.plus,
      color1: Color(0xff526df6),
      color2: Color(0xff67acf2),
    );
  }
}
