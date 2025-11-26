import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الحساب'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 16),
            const Text(
              'محمد علي',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'مطور برمجيات',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('الايميل'),
              subtitle: const Text('mohammed@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('الجوال'),
              subtitle: const Text('+967 739 404 244'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('الموقع'),
              subtitle: const Text('سيئون, اليمن'),
            ),
          ],
        ),
      ),
    );
  }
}
