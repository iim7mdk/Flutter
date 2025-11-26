import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "الرئيسية",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,

            leading: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {

              },
            ),

          ),


          SliverList(
            delegate: SliverChildListDelegate([

              _buildWelcomeCard(),


              _buildQuickServices(context),


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
          colors: [Colors.green, Colors.lightBlue],
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "!مرحباً بعودتك ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 5),
                const Text(
                  "محمد علي الكاف",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
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
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ],
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




  void _navigateToPage(BuildContext context, String page) {
    // يمكنك إضافة التنقل بين الصفحات هنا
    print('الانتقال إلى: $page');
  }
}