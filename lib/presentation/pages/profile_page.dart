import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class ProfilePage extends StatelessWidget {
  final HomeController controller;

  ProfilePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VReal Company Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'VReal is a leading innovator in the field of virtual reality technology. '
              'Our mission is to provide immersive, high-quality VR experiences to consumers and businesses alike. '
              'Founded in 2025, VReal is committed to pushing the boundaries of technology and creating groundbreaking VR products.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our Vision',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'To be a world leader in virtual reality technology, transforming the way people interact with digital environments.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'To create innovative VR products that enhance entertainment, education, and professional sectors, providing users with unparalleled virtual experiences.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: contact@vreal.com\nPhone: +1-800-123-4567\nAddress: 123 VR Avenue, Tech City, 12345',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      selectedIndex: 1, // Profile tab is selected
      controller: controller,
    );
  }
}
