import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحة الاعدادات'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
          leading: const Icon(Icons.settings),
          title: Text('اعداد المظهر'),
          subtitle: Text('قم بضبط المظهر الخاص بك'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on Setting ')),
          );
      },
    ),ListTile(
          leading: const Icon(Icons.info),
          title: Text('عن التطبيق'),
          subtitle: Text('اعرف أكثر عننا'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on Setting ')),
          );
      },
    ),ListTile(
          leading: const Icon(Icons.delete),
          title: Text('حذف الحساب'),
          subtitle: Text('قم بحذف حسابك للأبد'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on Setting ')),
          );
      },
    ),
        ],


      ),
    );
  }
}
