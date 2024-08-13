import 'package:flutter/material.dart';

class Plans extends StatefulWidget {
  const Plans({super.key});

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  int _selectedIndex = 2;

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
      // Add logic for other indices if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
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
                SizedBox(width: 55),
                Text(
                  'الخطة التدريبية',
                  style: TextStyle(
                    color: Color(0xff275052),
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            const Text(
              'رحلتك التطويرية',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  TrainingStep(
                    title: 'النطق',
                    subtitle: 'إبدال حرف بحرف غيره',
                    exerciseCount: 5,
                    isCompleted: true,
                  ),
                  TrainingStep(
                    title: 'المتشابهات القرآنية',
                    subtitle: 'من حيث الشكل',
                    exerciseCount: 12,
                    isCompleted: false,
                  ),
                  TrainingStep(
                    title: 'التجويد',
                    subtitle: 'إدغام حرف النون',
                    exerciseCount: 9,
                    isCompleted: false,
                  ),
                  TrainingStep(
                    title: 'المتشابهات القرآنية',
                    subtitle: 'من حيث المعنى',
                    exerciseCount: 9,
                    isCompleted: false,
                  ),
                  TrainingStep(
                    title: 'الإظهار',
                    subtitle: '',
                    exerciseCount: 16,
                    isCompleted: false,
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
}

// TrainingStep Widget
class TrainingStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final int exerciseCount;
  final bool isCompleted;

  const TrainingStep({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.exerciseCount,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Exercise Info
        Expanded(
          child: InkWell(
            onTap: () {
              print("hi");
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '$exerciseCount تمارين',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Progress Indicator
        Column(
          children: [
            CircleAvatar(
              backgroundColor: isCompleted ? Colors.teal : Colors.grey[200],
              radius: 12,
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            Container(
              width: 2,
              height: 120,
              color: isCompleted ? Colors.teal : Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
