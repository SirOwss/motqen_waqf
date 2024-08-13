import 'package:flutter/material.dart';

class ChooseSection extends StatefulWidget {
  const ChooseSection({super.key});

  @override
  State<ChooseSection> createState() => _ChooseSectionState();
}

class _ChooseSectionState extends State<ChooseSection> {
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
      else if(_selectedIndex == 3){
        Navigator.of(context).pushNamed('/account');
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
                      Navigator.of(context).pushNamed('/rewaya');
                    },
                  ),
                  SizedBox(width: 85),
                  Text(
                    'اختر السورة',
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
                    hintText: 'ابحث عن السورة',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildSurahTile('سورة الفاتحة', '1', '7', 'صفحة 1'),
                  buildSurahTile('سورة البقرة', '2', '286', 'صفحة 2'),
                  buildSurahTile('سورة آل عمران', '3', '200', 'صفحة 50'),
                  buildSurahTile('سورة النساء', '4', '176', 'صفحة 77'),
                  buildSurahTile('سورة المائدة', '5', '120', 'صفحة 106'),
                  buildSurahTile('سورة الأنعام', '6', '165', 'صفحة 128'),
                  buildSurahTile('سورة الأعراف', '7', '206', 'صفحة 151'),
                  buildSurahTile('سورة الأنفال', '8', '75', 'صفحة 177'),
                  buildSurahTile('سورة التوبة', '9', '129', 'صفحة 187'),
                  buildSurahTile('سورة يونس', '10', '109', 'صفحة 208'),
                  buildSurahTile('سورة هود', '11', '123', 'صفحة 221'),
                  buildSurahTile('سورة يوسف', '12', '111', 'صفحة 235'),
                  buildSurahTile('سورة الرعد', '13', '43', 'صفحة 249'),
                  buildSurahTile('سورة إبراهيم', '14', '52', 'صفحة 255'),
                  buildSurahTile('سورة الحجر', '15', '99', 'صفحة 262'),
                  buildSurahTile('سورة النحل', '16', '128', 'صفحة 267'),
                  buildSurahTile('سورة الإسراء', '17', '111', 'صفحة 282'),
                  buildSurahTile('سورة الكهف', '18', '110', 'صفحة 293'),
                  buildSurahTile('سورة مريم', '19', '98', 'صفحة 305'),
                  buildSurahTile('سورة طه', '20', '135', 'صفحة 312'),
                  buildSurahTile('سورة الأنبياء', '21', '112', 'صفحة 322'),
                  buildSurahTile('سورة الحج', '22', '78', 'صفحة 332'),
                  buildSurahTile('سورة المؤمنون', '23', '118', 'صفحة 342'),
                  buildSurahTile('سورة النور', '24', '64', 'صفحة 350'),
                  buildSurahTile('سورة الفرقان', '25', '77', 'صفحة 359'),
                  buildSurahTile('سورة الشعراء', '26', '227', 'صفحة 367'),
                  buildSurahTile('سورة النمل', '27', '93', 'صفحة 377'),
                  buildSurahTile('سورة القصص', '28', '88', 'صفحة 385'),
                  buildSurahTile('سورة العنكبوت', '29', '69', 'صفحة 396'),
                  buildSurahTile('سورة الروم', '30', '60', 'صفحة 404'),
                  buildSurahTile('سورة لقمان', '31', '34', 'صفحة 411'),
                  buildSurahTile('سورة السجدة', '32', '30', 'صفحة 414'),
                  buildSurahTile('سورة الأحزاب', '33', '73', 'صفحة 417'),
                  buildSurahTile('سورة سبأ', '34', '54', 'صفحة 428'),
                  buildSurahTile('سورة فاطر', '35', '45', 'صفحة 434'),
                  buildSurahTile('سورة يس', '36', '83', 'صفحة 440'),
                  buildSurahTile('سورة الصافات', '37', '182', 'صفحة 446'),
                  buildSurahTile('سورة ص', '38', '88', 'صفحة 453'),
                  buildSurahTile('سورة الزمر', '39', '75', 'صفحة 458'),
                  buildSurahTile('سورة غافر', '40', '85', 'صفحة 467'),
                  buildSurahTile('سورة فصلت', '41', '54', 'صفحة 477'),
                  buildSurahTile('سورة الشورى', '42', '53', 'صفحة 483'),
                  buildSurahTile('سورة الزخرف', '43', '89', 'صفحة 489'),
                  buildSurahTile('سورة الدخان', '44', '59', 'صفحة 496'),
                  buildSurahTile('سورة الجاثية', '45', '37', 'صفحة 499'),
                  buildSurahTile('سورة الأحقاف', '46', '35', 'صفحة 502'),
                  buildSurahTile('سورة محمد', '47', '38', 'صفحة 507'),
                  buildSurahTile('سورة الفتح', '48', '29', 'صفحة 511'),
                  buildSurahTile('سورة الحجرات', '49', '18', 'صفحة 515'),
                  buildSurahTile('سورة ق', '50', '45', 'صفحة 518'),
                  buildSurahTile('سورة الذاريات', '51', '60', 'صفحة 520'),
                  buildSurahTile('سورة الطور', '52', '49', 'صفحة 523'),
                  buildSurahTile('سورة النجم', '53', '62', 'صفحة 526'),
                  buildSurahTile('سورة القمر', '54', '55', 'صفحة 528'),
                  buildSurahTile('سورة الرحمن', '55', '78', 'صفحة 531'),
                  buildSurahTile('سورة الواقعة', '56', '96', 'صفحة 534'),
                  buildSurahTile('سورة الحديد', '57', '29', 'صفحة 537'),
                  buildSurahTile('سورة المجادلة', '58', '22', 'صفحة 541'),
                  buildSurahTile('سورة الحشر', '59', '24', 'صفحة 544'),
                  buildSurahTile('سورة الممتحنة', '60', '13', 'صفحة 549'),
                  buildSurahTile('سورة الصف', '61', '14', 'صفحة 551'),
                  buildSurahTile('سورة الجمعة', '62', '11', 'صفحة 553'),
                  buildSurahTile('سورة المنافقون', '63', '11', 'صفحة 554'),
                  buildSurahTile('سورة التغابن', '64', '18', 'صفحة 556'),
                  buildSurahTile('سورة الطلاق', '65', '12', 'صفحة 558'),
                  buildSurahTile('سورة التحريم', '66', '12', 'صفحة 560'),
                  buildSurahTile('سورة الملك', '67', '30', 'صفحة 562'),
                  buildSurahTile('سورة القلم', '68', '52', 'صفحة 564'),
                  buildSurahTile('سورة الحاقة', '69', '52', 'صفحة 566'),
                  buildSurahTile('سورة المعارج', '70', '44', 'صفحة 568'),
                  buildSurahTile('سورة نوح', '71', '28', 'صفحة 570'),
                  buildSurahTile('سورة الجن', '72', '28', 'صفحة 572'),
                  buildSurahTile('سورة المزمل', '73', '20', 'صفحة 574'),
                  buildSurahTile('سورة المدثر', '74', '56', 'صفحة 575'),
                  buildSurahTile('سورة القيامة', '75', '40', 'صفحة 577'),
                  buildSurahTile('سورة الإنسان', '76', '31', 'صفحة 578'),
                  buildSurahTile('سورة المرسلات', '77', '50', 'صفحة 580'),
                  buildSurahTile('سورة النبأ', '78', '40', 'صفحة 582'),
                  buildSurahTile('سورة النازعات', '79', '46', 'صفحة 583'),
                  buildSurahTile('سورة عبس', '80', '42', 'صفحة 585'),
                  buildSurahTile('سورة التكوير', '81', '29', 'صفحة 586'),
                  buildSurahTile('سورة الإنفطار', '82', '19', 'صفحة 587'),
                  buildSurahTile('سورة المطففين', '83', '36', 'صفحة 587'),
                  buildSurahTile('سورة الإنشقاق', '84', '25', 'صفحة 589'),
                  buildSurahTile('سورة البروج', '85', '22', 'صفحة 590'),
                  buildSurahTile('سورة الطارق', '86', '17', 'صفحة 591'),
                  buildSurahTile('سورة الأعلى', '87', '19', 'صفحة 591'),
                  buildSurahTile('سورة الغاشية', '88', '26', 'صفحة 592'),
                  buildSurahTile('سورة الفجر', '89', '30', 'صفحة 593'),
                  buildSurahTile('سورة البلد', '90', '20', 'صفحة 594'),
                  buildSurahTile('سورة الشمس', '91', '15', 'صفحة 595'),
                  buildSurahTile('سورة الليل', '92', '21', 'صفحة 595'),
                  buildSurahTile('سورة الضحى', '93', '11', 'صفحة 596'),
                  buildSurahTile('سورة الشرح', '94', '8', 'صفحة 597'),
                  buildSurahTile('سورة التين', '95', '8', 'صفحة 597'),
                  buildSurahTile('سورة العلق', '96', '19', 'صفحة 597'),
                  buildSurahTile('سورة القدر', '97', '5', 'صفحة 598'),
                  buildSurahTile('سورة البينة', '98', '8', 'صفحة 598'),
                  buildSurahTile('سورة الزلزلة', '99', '8', 'صفحة 599'),
                  buildSurahTile('سورة العاديات', '100', '11', 'صفحة 599'),
                  buildSurahTile('سورة القارعة', '101', '11', 'صفحة 600'),
                  buildSurahTile('سورة التكاثر', '102', '8', 'صفحة 600'),
                  buildSurahTile('سورة العصر', '103', '3', 'صفحة 601'),
                  buildSurahTile('سورة الهمزة', '104', '9', 'صفحة 601'),
                  buildSurahTile('سورة الفيل', '105', '5', 'صفحة 601'),
                  buildSurahTile('سورة قريش', '106', '4', 'صفحة 602'),
                  buildSurahTile('سورة الماعون', '107', '7', 'صفحة 602'),
                  buildSurahTile('سورة الكوثر', '108', '3', 'صفحة 602'),
                  buildSurahTile('سورة الكافرون', '109', '6', 'صفحة 603'),
                  buildSurahTile('سورة النصر', '110', '3', 'صفحة 603'),
                  buildSurahTile('سورة المسد', '111', '5', 'صفحة 603'),
                  buildSurahTile('سورة الإخلاص', '112', '4', 'صفحة 604'),
                  buildSurahTile('سورة الفلق', '113', '5', 'صفحة 604'),
                  buildSurahTile('سورة الناس', '114', '6', 'صفحة 604'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSurahTile(String surahName, String surahNumber, String ayaCount, String pageNumber) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: Text(
        surahName,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            'عدد الآيات: $ayaCount',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(width: 20),
          Text(
            'صفحة: $pageNumber',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      trailing: CircleAvatar(
        backgroundColor: Color(0xff275052),
        child: Text(
          surahNumber,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      onTap: () {
        // أضف السلوك هنا عند النقر على السورة
      },
    );
  }
}
