import 'package:flutter/material.dart';

class ReviewAfterSession extends StatefulWidget {
  const ReviewAfterSession({super.key});

  @override
  State<ReviewAfterSession> createState() => _ReviewAfterSessionState();
}

class _ReviewAfterSessionState extends State<ReviewAfterSession> {
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0){
        Navigator.of(context).pushNamed('/home');
      }else if(_selectedIndex == 1){
        Navigator.of(context).pushNamed('/report');
      }
      else if(_selectedIndex == 2){
        Navigator.of(context).pushNamed('/plan');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Keep the original body in place
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
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
                  ],
                ),
                CircularProgressIndicator(
                  value: 0.77,
                  strokeWidth: 5,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                ),
                const SizedBox(height: 10),
                const Text(
                  '77%',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 20),
                const Text(
                  'ملخص الأخطاء',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        autofocus: true,
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all(5),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          // Read action
                        },
                        child: const Text('القراءة', style: TextStyle(color: Color(0xff275052), fontSize: 16)),
                      ),
                      TextButton(
                        autofocus: true,
                        onPressed: () {
                          // Pronunciation action
                        },
                        child: const Text('النطق', style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                      TextButton(
                        onPressed: () {
                          // Define action
                        },
                        child: const Text('التجويد', style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ErrorItem(
                        title: 'تبديل حرف مكان حرف',
                        incorrectText: 'اهْدِنَا الصِّرَاطَ المُسْتَقِيمَ',
                        ayahNumber: 6,
                        time: '0:50 / 1:23',
                      ),
                      const SizedBox(height: 10),
                      RightItem(
                        title: 'تبديل حرف مكان حرف',
                        correctText: 'اهْدِنَا الصِّرَاطَ المُسْتَقِيمَ',
                        ayahNumber: 6,
                        time: '0:50 / 1:23',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Add IndexedStack to manage the pages

        ],
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
}

// ErrorItem Widget
class ErrorItem extends StatelessWidget {
  final String title;
  final String incorrectText;
  final int ayahNumber;
  final String time;

  const ErrorItem({
    Key? key,
    required this.title,
    required this.incorrectText,
    required this.ayahNumber,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 120,),
                Text(
                  title + '*',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 85,),
                Flexible(
                  child: Row(
                    children: [
                      Text('($ayahNumber)'),
                      Text(
                        incorrectText,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        // Play audio
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () {
                        // Pause audio
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// RightItem Widget
class RightItem extends StatelessWidget {
  final String title;
  final String correctText;
  final int ayahNumber;
  final String time;

  const RightItem({
    Key? key,
    required this.title,
    required this.correctText,
    required this.ayahNumber,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 125,),
                Text(
                  title + '*',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 85,),
                Flexible(
                  child: Row(
                    children: [
                      Text('($ayahNumber)'),
                      Text(
                        correctText,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        // Play audio
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () {
                        // Pause audio
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
