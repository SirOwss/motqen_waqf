import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.of(context).pushNamed('/home');
      } else if (_selectedIndex == 1) {
        Navigator.of(context).pushNamed('/report');
      } else if (_selectedIndex == 2) {
        Navigator.of(context).pushNamed('/plan');
      } else if (_selectedIndex == 3) {
        Navigator.of(context).pushNamed('/profile');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Row(
              children: [
                InkWell(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(180),
                      boxShadow: const [
                        BoxShadow(blurRadius: 0.5),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop(); // Navigate back
                  },
                ),
                const SizedBox(width: 105),
                const Text(
                  'التقارير',
                  style: TextStyle(
                    color: Color(0xff66728E),
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Text(
                  'أكملت 40% من خطتك',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff66728E),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 180,
                  child: LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey,
                    color: Color(0xff275052),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildReportItem(
                    title: 'سورة الفاتحة',
                    images: 'asset/makkah.png', // Placeholder icon for Kaaba
                    percentage: 0.94,
                    sections: 1,
                    color: Color(0xff275052),
                  ),
                  _buildReportItem(
                    title: 'سورة البقرة',
                    images: 'asset/madina.png', // Placeholder icon for mosque
                    percentage: 0.68,
                    sections: 21,
                    color: Colors.amber,
                  ),
                  _buildReportItem(
                    title: 'سورة آل عمران',
                    images: 'asset/madina.png', // Placeholder icon for mosque
                    percentage: 0.90,
                    sections: 15,
                    color: Color(0xff275052),
                  ),
                  _buildReportItem(
                    title: 'سورة النساء',
                    images: 'asset/madina.png', // Placeholder icon for mosque
                    percentage: 0.44,
                    sections: 7,
                    color: Colors.red,
                  ),
                  _buildReportItem(
                    title: 'سورة المائدة',
                    images: 'asset/makkah.png', // Placeholder icon for Kaaba
                    percentage: 0.48,
                    sections: 11,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'التقارير',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'التدريبات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الحساب',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff275052),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildReportItem({
    required String title,
    required double percentage,
    required int sections,
    required Color color,
    required String images,
  }) {
    return InkWell(
      onTap: () {
        // Handle item tap
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(images, height: 40, width: 40),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "تمرين $sections",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '${(percentage * 100).toInt()}%',
                    style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 60,
                    child: LinearProgressIndicator(
                      value: percentage,
                      backgroundColor: Colors.grey[300],
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
