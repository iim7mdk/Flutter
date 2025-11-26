import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ابحث'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'استكشف',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.search),
                  title: Text('سمك'),
                  subtitle: Text('فيه فيتامينات وعناصر غذائية مهمة'),
                  onTap: () {
                    debugPrint('يتم النقل الى الصفحة الاخرى');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('يتم النقل الى الصفحة الاخرى')),
                    );
                  },
                ),ListTile(
                  leading: const Icon(Icons.search),
                  title: Text('حليب'),
                  subtitle: Text('فيه كالسيوم وعناصر غذائية مهمة'),
                  onTap: () {
                    debugPrint('يتم النقل الى الصفحة الاخرى');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('يتم النقل الى الصفحة الاخرى')),
                    );
                  },
                ),ListTile(
                  leading: const Icon(Icons.search),
                  title: Text('رز'),
                  subtitle: Text('النشويات الاكثر شراء'),
                  onTap: () {
                    debugPrint('يتم النقل الى الصفحة الاخرى');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('يتم النقل الى الصفحة الاخرى')),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
