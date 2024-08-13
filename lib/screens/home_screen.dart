import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: Stack(
          children: [
            // الخلفية العلوية الخضراء
            Container(
              height: 250,
              color: Color(0xff275052),
            ),
            // المحتوى الرئيسي
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'مرحبا عبدالعزيز',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                // البطاقة البيضاء
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(height: 10),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 180, // عرض الدائرة
                              height: 180, // ارتفاع الدائرة
                              child: CircularProgressIndicator(
                                value: 0.4,
                                strokeWidth: 8,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff275052),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'نسبة الإنجاز',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff275052)
                                  ),
                                ),
                                Text(
                                  '40%',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff275052),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'الحفظ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),

                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.grey[300],
                            ),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.grey[300],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // ورد الحفظ
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'عرض الكل',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Text(
                        'ورد الحفظ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                // هنا ستضع محتويات ورد الحفظ
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    childAspectRatio: 1.5,
                    children: [
                      _buildSurahCard(
                        context,
                        surahName: 'سورة العنكبوت',
                        surahStatus: '63%',
                        ayatCount: '256',
                        color: Colors.green,
                        images: 'asset/madina.png'
                      ),
                      _buildSurahCard(
                        context,
                        surahName: 'سورة الكهف',
                        surahStatus: '90%',
                        ayatCount: '7',
                        color: Colors.teal,
                        images: 'asset/makkah.png'
                      ),
                      _buildSurahCard(
                        context,
                        surahName: 'سورة القيامة',
                        surahStatus: '10%',
                        ayatCount: '176',
                        color: Colors.red,
                        images: 'asset/madina.png'
                      ),
                      _buildSurahCard(
                        context,
                        surahName: 'سورة الإسراء',
                        surahStatus: '46%',
                        ayatCount: '200',
                        color: Colors.orange,
                        images: 'asset/madina.png'
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSurahCard(BuildContext context,
      {required String surahName,
        required String surahStatus,
        required String ayatCount,
        required String images,
        required Color color}) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            surahStatus,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            surahName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(images,height: 40,width: 40,),
              SizedBox(width: 5),
              Text(' | '),
              SizedBox(width: 5),

              Text(
                'آيات: $ayatCount',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
