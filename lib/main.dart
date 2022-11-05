import 'package:animation_app/src/pages/animations_page.dart';
import 'package:animation_app/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: AnimationPage()
    );
  }
}