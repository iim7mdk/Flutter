import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الإعدادات",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "الإعدادات العامة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  // قسم الحساب
                  _buildSectionHeader("الحساب"),
                  _buildSettingsTile(
                    icon: Icons.person,
                    title: "معلومات الحساب",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.lock,
                    title: "خصوصية الحساب",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.language,
                    title: "اللغة",
                    subtitle: "العربية",
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),

                  // قسم الإشعارات
                  _buildSectionHeader("الإشعارات"),
                  _buildSwitchTile(
                    icon: Icons.notifications,
                    title: "الإشعارات العامة",
                    value: true,
                    onChanged: (value) {},
                  ),
                  _buildSwitchTile(
                    icon: Icons.email,
                    title: "الإشعارات البريدية",
                    value: false,
                    onChanged: (value) {},
                  ),
                  _buildSwitchTile(
                    icon: Icons.vibration,
                    title: "الاهتزاز",
                    value: true,
                    onChanged: (value) {},
                  ),

                  const SizedBox(height: 16),

                  // قسم المظهر
                  _buildSectionHeader("المظهر"),
                  _buildSettingsTile(
                    icon: Icons.dark_mode,
                    title: "الوضع الليلي",
                    subtitle: "تلقائي",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.format_paint,
                    title: "لون التطبيق",
                    subtitle: "أزرق",
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),

                  // قسم حول التطبيق
                  _buildSectionHeader("حول"),
                  _buildSettingsTile(
                    icon: Icons.info,
                    title: "عن التطبيق",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.shield,
                    title: "سياسة الخصوصية",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.description,
                    title: "شروط الخدمة",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.star,
                    title: "قيم التطبيق",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة لبناء عنصر القائمة العادي
  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  // دالة لبناء عنصر القائمة مع مفتاح تبديل
  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  // دالة لبناء عنوان القسم
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}