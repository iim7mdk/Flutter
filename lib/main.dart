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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.park, color: Colors.grey[900], size: 35),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'YelpCamp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Explore the best camps!',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'YelpCamp',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),

      // ---------------- BODY ----------------
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            CampCard(
              imageUrl:
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80',
              title: 'Mountain View Camp',
              description:
              'Enjoy breathtaking views, fresh air, and peaceful nights under the stars 🌙.',
            ),
            SizedBox(height: 16),
            CampCard(
              imageUrl:
              'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
              title: 'Forest Escape Camp',
              description:
              'Hidden deep in the forest, this camp offers privacy and calm nature vibes 🌲.',
            ),
            SizedBox(height: 16),
            CampCard(
              imageUrl:
              'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80',
              title: 'Lake Paradise Camp',
              description:
              'Wake up to the sound of waves and stunning sunrise views by the lake 🌅.',
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
          Image.network(
            imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم الكامب
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // وصف الكامب
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 16),

                // زر التفاصيل
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Viewing details for $title...')),
                      );
                    },
                    child: const Text('View Details'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
