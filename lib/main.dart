import 'package:animation_app/src/pages/animations_page.dart';
import 'package:animation_app/src/labs/circular_progress_page.dart';
import 'package:animation_app/src/pages/graficas_circulares_page.dart';
import 'package:animation_app/src/pages/headers_page.dart';
import 'package:animation_app/src/pages/pinterest_page.dart';
import 'package:animation_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PinterestPage()
    );
  }
}