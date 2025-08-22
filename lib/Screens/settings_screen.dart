import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الإعدادات")),
      body: ListView(
        children: [
          SwitchListTile(
            value: true,
            onChanged: (val) {},
            title: const Text("الوضع الليلي"),
          ),
          ListTile(
            title: const Text("اللغة"),
            subtitle: const Text("العربية"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("العملة"),
            subtitle: const Text("ريال سعودي"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}