import 'package:flutter/material.dart';

class SessionHome extends StatefulWidget {
  const SessionHome({super.key});

  @override
  State<SessionHome> createState() => _SessionHomeState();
}

class _SessionHomeState extends State<SessionHome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.of(context).pushNamed('/home');
      } else if (_selectedIndex == 1) {
        Navigator.of(context).pushNamed('/report');
      } else if (_selectedIndex == 2) {
        Navigator.of(context).pushNamed('/plan');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background color section
            Container(
              height: 250, // Half the screen height
              color: Color(0xff275052),
            ),
            // Main content section
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(180),
                            boxShadow: [
                              BoxShadow(blurRadius: 0.5),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/section');
                        },
                      ),
                      SizedBox(width: 65),
                      Text(
                        'سورة الفاتحة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ (1)\n'
                              'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ (2)'
                              ' الرَّحْمَٰنِ الرَّحِيمِ (3)\n'
                              'مَالِكِ يَوْمِ الدِّينِ (4)'
                              ' إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ (5)'
                              ' اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ (6)'
                              ' صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ (7)',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            height: 2.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff275052),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 60,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/session');
                    },
                    child: Text(
                      'بدء الجلسة',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
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
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
