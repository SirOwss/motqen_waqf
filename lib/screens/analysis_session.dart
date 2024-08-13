import 'package:flutter/material.dart';

class AnalysisSession extends StatefulWidget {
  const AnalysisSession({super.key});

  @override
  State<AnalysisSession> createState() => _AnalysisSessionState();
}

class _AnalysisSessionState extends State<AnalysisSession> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 80),
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
                    print("Back!!");
                  },
                ),
                SizedBox(width: 85),
                Text(
                  'تحليل الجلسات السابقة',
                  style: TextStyle(
                    color: Color(0xff66728E),
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAnalysisCard('عدد التكرارات', '3,950', Icons.loop),
                _buildAnalysisCard('مجموع الوقت', '3:30', Icons.access_time),
                _buildAnalysisCard('قسم', '15', Icons.merge_type),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: 0.75, // Adjust this to reflect the correct value
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff17FA2D)),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: 0.78, // Adjust this to reflect the correct value
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1218B3)),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: CircularProgressIndicator(
                        value: 0.78, // Adjust this to reflect the correct value
                        strokeWidth: 6,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff7A12FF)),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLegendItem('تكرار الأخطاء', "خطأ 25", Color(0xff17FA2D)),
                    const SizedBox(height: 20),
                    _buildLegendItem('أحكام التجويد', '8 أحكام', Color(0xff1218B3)),
                    const SizedBox(height: 20),
                    _buildLegendItem('المتشابهات', '3 مواضيع', Color(0xff7A12FF)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Action for the button
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
              child: const Text(
                'اختبر الآن',
                style: TextStyle(fontSize: 18, color: Color(0xffffffff)),
              ),
            ),
            const SizedBox(height: 20),
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

  Widget _buildAnalysisCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Color(0xff275052)),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String title, String value, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: color,
        ),
        const SizedBox(width: 10),
        Text(
          '$title\n$value',
          style: const TextStyle(fontSize: 16, color: Color(0xff66728E)),
        ),
      ],
    );
  }
}
