import 'package:flutter/material.dart';

class ChooseRewaya extends StatefulWidget {
  const ChooseRewaya({super.key});

  @override
  State<ChooseRewaya> createState() => _ChooseRewayaState();
}

class _ChooseRewayaState extends State<ChooseRewaya> {
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
      backgroundColor: Colors.white,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    'اختر الرواية',
                    style: TextStyle(
                      color: Color(0xff275052),
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'ابحث عن الرواية',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildSurahTile('رواية حفص بن عاصم', "1"),
                  buildSurahTile('رواية شعبة بن عاصم', "2"),
                  buildSurahTile('رواية قالون عن نافع', "3"),
                  buildSurahTile('رواية ورش عن نافع', "4"),
                  buildSurahTile('رواية قنبل عن ابن كثير', "5"),
                  buildSurahTile('رواية الدوري عن أبي عمرو', "6"),
                  buildSurahTile('رواية البزي عن ابن كثير', "7"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildSurahTile(String title, String number) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: CircleAvatar(
        backgroundColor: Color(0xff275052),
        child: Text(
          number,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xff275052),
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/section');
      },
    );
  }
}
