import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.rtl,   // ← إجبار التطبيق على العمل RTL بالكامل
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
