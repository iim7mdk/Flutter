import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YelpCamp',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CV',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            // SizedBox(height: 12),

            CircleAvatar(
              radius: 200,
              backgroundImage: AssetImage('assets/Profile.jpg'),
            ),
            SizedBox(height: 16), // مسافة بين الصورة والنص
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Mohammed Ali Alkaff'),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Applications Developer',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                Text(
                  'M7md.k@email.com',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Number'),
                Text(
                    '739404244',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),


            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Skills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 6,
                children: const [
                  Chip(label: Text('C++')),
                  Chip(label: Text('Java')),
                  Chip(label: Text('C#')),
                  Chip(label: Text('HTML')),
                  Chip(label: Text('CSS')),
                  Chip(label: Text('JavaScribt')),
                  Chip(label: Text('React')),
                  Chip(label: Text('Flutter')),
                  Chip(label: Text('Dart')),
                  Chip(label: Text('REST API')),
                  Chip(label: Text('SQL')),
                  Chip(label: Text('Firebase')),
                  Chip(label: Text('MongoDB')),
                  Chip(label: Text('Node.js')),
                  Chip(label: Text('Git')),
                  Chip(label: Text('Github')),
                  Chip(label: Text('UI/UX')),
                  Chip(label: Text('Unit Testing')),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),

    );
  }
}

class CampCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const CampCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المخيم



        ],
      ),
    );
  }
}
