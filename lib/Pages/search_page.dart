import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _searchResults = [];
  final List<Map<String, dynamic>> _recentSearches = [
    {
      'title': 'Flutter',
      'type': 'التقنية',
    },
    {
      'title': 'برمجة',
      'type': 'التقنية',
    },
    {
      'title': 'تصميم واجهات',
      'type': 'التصميم',
    },
  ];

  final List<Map<String, dynamic>> _allItems = [
    {
      'title': 'Flutter',
      'description': 'إطار عمل Google لتطوير التطبيقات',
      'type': 'التقنية',
      'icon': Icons.code,
    },
    {
      'title': 'Dart',
      'description': 'لغة البرمجة المستخدمة في Flutter',
      'type': 'التقنية',
      'icon': Icons.language,
    },
    {
      'title': 'UI/UX Design',
      'description': 'تصميم تجربة المستخدم وواجهات التطبيقات',
      'type': 'التصميم',
      'icon': Icons.design_services,
    },
    {
      'title': 'Firebase',
      'description': 'منصة Google للتطبيقات الخلفية',
      'type': 'التقنية',
      'icon': Icons.cloud,
    },
    {
      'title': 'API',
      'description': 'واجهة برمجة التطبيقات',
      'type': 'التقنية',
      'icon': Icons.api,
    },
    {
      'title': 'Mobile Development',
      'description': 'تطوير تطبيقات الهواتف',
      'type': 'التقنية',
      'icon': Icons.phone_android,
    },
    {
      'title': 'Web Development',
      'description': 'تطوير تطبيقات الويب',
      'type': 'التقنية',
      'icon': Icons.web,
    },
    {
      'title': 'Database',
      'description': 'قواعد البيانات وإدارتها',
      'type': 'التقنية',
      'icon': Icons.storage,
    },
  ];

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear();
      } else {
        _searchResults.clear();
        for (var item in _allItems) {
          if (item['title'].toString().toLowerCase().contains(query.toLowerCase()) ||
              item['description'].toString().toLowerCase().contains(query.toLowerCase())) {
            _searchResults.add(item);
          }
        }
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "البحث",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Column(
        children: [
          // شريط البحث
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _performSearch,
                      decoration: const InputDecoration(
                        hintText: "ابحث هنا...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: _clearSearch,
                    ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),

          // النتائج أو البحث السابق
          Expanded(
            child: _searchController.text.isEmpty
                ? _buildRecentSearches()
                : _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "البحث السابق",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: _recentSearches.length,
            itemBuilder: (context, index) {
              final item = _recentSearches[index];
              return ListTile(
                leading: const Icon(Icons.history, color: Colors.grey),
                title: Text(item['title']),
                subtitle: Text(item['type']),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: () {
                    _searchController.text = item['title'];
                    _performSearch(item['title']);
                  },
                ),
                onTap: () {
                  _searchController.text = item['title'];
                  _performSearch(item['title']);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty && _searchController.text.isNotEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "لا توجد نتائج",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              "جرب استخدام كلمات بحث أخرى",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final item = _searchResults[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          elevation: 2,
          child: ListTile(
            leading: Icon(item['icon'], color: Colors.blue),
            title: Text(
              item['title'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(item['description']),
            trailing: Chip(
              label: Text(
                item['type'],
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
            onTap: () {
              // يمكنك إضافة الإجراء المناسب هنا
              print('تم النقر على: ${item['title']}');
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}