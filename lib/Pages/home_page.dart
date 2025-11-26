import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الصفحة الرئيسية'),
        backgroundColor: Colors.grey,

      ),

      body: Padding(

        padding: const EdgeInsets.all(32.0),
        child: Column(

          children: [
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: 'ادخل كلام',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller2.text = _controller1.text;
                });
              },
              child: const Text('انسخه'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller2,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'بيكون هنا',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
