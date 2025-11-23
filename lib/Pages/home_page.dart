import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // شريط التطبيق
          SliverAppBar(
            title: const Text(
              "الرئيسية",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 4,
            floating: true,
            snap: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // الانتقال لصفحة الإشعارات
                },
              ),
            ],
          ),

          // محتوى الصفحة
          SliverList(
            delegate: SliverChildListDelegate([
              // بطاقة الترحيب
              _buildWelcomeCard(),

              // الإحصائيات السريعة
              _buildQuickStats(),

              // الخدمات السريعة
              _buildQuickServices(context),

              // النشاط الأخير
              _buildRecentActivity(),

              // المقالات المقترحة
              _buildSuggestedArticles(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.lightBlue],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "مرحباً بعودتك!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "محمد علي الكاف",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "يوم مميز للعمل 💪",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard("المشاريع", "12", Icons.work, Colors.blue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard("المهام", "8", Icons.task, Colors.green),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard("الإنجازات", "24", Icons.emoji_events, Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickServices(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'title': 'البحث',
        'icon': Icons.search,
        'color': Colors.purple,
        'page': 'search',
      },
      {
        'title': 'الملف الشخصي',
        'icon': Icons.person,
        'color': Colors.blue,
        'page': 'profile',
      },
      {
        'title': 'الإعدادات',
        'icon': Icons.settings,
        'color': Colors.green,
        'page': 'settings',
      },
      {
        'title': 'المساعدة',
        'icon': Icons.help,
        'color': Colors.orange,
        'page': 'help',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "الخدمات السريعة",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return InkWell(
                onTap: () {
                  // الانتقال للصفحة المحددة
                  _navigateToPage(context, service['page']);
                },
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: service['color'].withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        service['icon'],
                        color: service['color'],
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service['title'],
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    final List<Map<String, dynamic>> activities = [
      {
        'title': 'تم إنشاء مشروع جديد',
        'time': 'منذ ساعتين',
        'icon': Icons.folder_open,
        'color': Colors.blue,
      },
      {
        'title': 'تم إكمال المهمة',
        'time': 'منذ 5 ساعات',
        'icon': Icons.check_circle,
        'color': Colors.green,
      },
      {
        'title': 'رسالة جديدة',
        'time': 'منذ يوم',
        'icon': Icons.email,
        'color': Colors.orange,
      },
      {
        'title': 'تحديث النظام',
        'time': 'منذ يومين',
        'icon': Icons.update,
        'color': Colors.purple,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "النشاط الأخير",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: activities.map((activity) {
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: activity['color'].withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        activity['icon'],
                        color: activity['color'],
                        size: 20,
                      ),
                    ),
                    title: Text(activity['title']),
                    subtitle: Text(
                      activity['time'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedArticles() {
    final List<Map<String, dynamic>> articles = [
      {
        'title': 'نصائح لزيادة الإنتاجية',
        'category': 'تطوير الذات',
        'readTime': '5 دقائق',
      },
      {
        'title': 'أفضل ممارسات البرمجة',
        'category': 'التقنية',
        'readTime': '8 دقائق',
      },
      {
        'title': 'إدارة الوقت الفعالة',
        'category': 'أعمال',
        'readTime': '6 دقائق',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "مقترحات لك",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Container(
                  width: 280,
                  margin: const EdgeInsets.only(left: 8),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              article['category'],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            article['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                article['readTime'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text("اقرأ المزيد"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context, String page) {
    // يمكنك إضافة التنقل بين الصفحات هنا
    print('الانتقال إلى: $page');
  }
}