import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  final IconData iconData;
  final String titulo;
  final String subtitle;
  final Color color1;
  final Color color2;

  const IconHeader({super.key, required this.iconData, required this.titulo, required this.subtitle, this.color1 = Colors.blueAccent, this.color2 = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorWhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            iconData,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(height: size.height * 0.08, width: size.width),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 20,
                color: colorWhite,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: 25, color: colorWhite, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.04),
            FaIcon(
              iconData,
              size: 80,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
    final Color color1;
    final Color color2;
  const _IconHeaderBackground({ required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(85)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color1,
              color2,
            ],
          )),
    );
  }
}
