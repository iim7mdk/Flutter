import 'package:flutter/material.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("مثال TextFields")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: text1,
                decoration: InputDecoration(labelText: "الحقل الأول"),
              ),

              SizedBox(height: 20),

              TextField(
                controller: text2,
                decoration: InputDecoration(labelText: "الحقل الثاني"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    text2.text = text1.text;
                  });
                },
                child: Text("طباعه في الثاني"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SecondPage(value: text1.text),
                    ),
                  );
                },
                child: Text("الانتقال لصفحة أخرى مع تمرير البيانات"),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
