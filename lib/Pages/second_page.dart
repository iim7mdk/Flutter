import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String value;

  const SecondPage({required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الثانية")),
      body: Center(
        child: Text(
          "القيمة المستلمة: $value",
          style: TextStyle(fontSize: 24),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
