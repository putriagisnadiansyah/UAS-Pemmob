import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class SettingsPage extends StatelessWidget {
  final HomeController controller;

  SettingsPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Ketentuan & Layanan
            ListTile(
              title: Text('Ketentuan & Layanan'),
              onTap: () {
                // Aksi untuk Ketentuan & Layanan
                print("Ketentuan & Layanan tapped");
              },
            ),
            Divider(),

            // Tampilan Mode
            ListTile(
              title: Text('Tampilan Mode'),
              onTap: () {
                // Aksi untuk Tampilan Mode
                print("Tampilan Mode tapped");
              },
            ),
            Divider(),

            // Pengaturan Bahasa
            ListTile(
              title: Text('Pengaturan Bahasa'),
              onTap: () {
                // Aksi untuk Pengaturan Bahasa
                print("Pengaturan Bahasa tapped");
              },
            ),
            Divider(),
          ],
        ),
      ),
      selectedIndex: 2, // Settings tab is selected
      controller: controller,
    );
  }
}
