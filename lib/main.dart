import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'models/surah_model.dart';
import 'repository/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff283663),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<SurahModel> listSurah = [];
  Repository repository = Repository();

  getData() async {
    listSurah = await repository.getData();
    setState(() {});
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff283663),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
        title: Text(
          'Quran App',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Asslamualaikum',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7B80AD),
                ),
              ),
              Text(
                'Tanvir Ahassan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffDF98FA),
                      Color(0xff9055FF),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.menu_book, color: Colors.white),
                              Text(
                                ' Last Read',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Al-Fatiah',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Ayah No: 1',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 80,
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        'assets/icons/Quran.svg',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  width: 5.0, color: Color(0xffA44AFF))),
                          labelColor: Colors.white,
                          unselectedLabelColor: Color(0xffABAFD7),
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          tabs: [
                            Tab(text: 'Surah'),
                            Tab(text: 'Juz'),
                          ],
                        ),
                      ),
                      Container(
                        height: 400, //height of TabBarView
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            border: Border(
                                top: BorderSide(
                                    color: Color(0xffA44AFF), width: 0.5))),
                        child: TabBarView(
                          children: <Widget>[
                            ListView.separated(
                                itemBuilder: (context, index) {
                                  return SurahItem(
                                    listSurah[index].nomor,
                                    listSurah[index].nama,
                                    listSurah[index].nama_latin,
                                    listSurah[index].jumlah_ayat,
                                    listSurah[index].tempat_turun,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Color(0xff7B80AD),
                                  );
                                },
                                itemCount: listSurah.length),
                            Text('data 2'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff283663),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          items: [
            BottomNavigationBarItem(
              label: 'Icon',
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff16254E),
                ),
                child: SvgPicture.asset('assets/icons/icon_1.svg'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Icon',
              icon: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffA44AFF),
                ),
                child: SvgPicture.asset('assets/icons/icon_2.svg'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Icon',
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff16254E),
                ),
                child: SvgPicture.asset('assets/icons/icon_3.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SurahItem extends StatelessWidget {
  final int nomorSurah;
  final String nama;
  final String nama_latin;
  final int jumlah_ayat;
  final String tempat_turun;

  SurahItem(this.nomorSurah, this.nama, this.nama_latin, this.jumlah_ayat,
      this.tempat_turun);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset('assets/icons/banner_ayat.svg')),
              Text(
                nomorSurah.toString(),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
        title: Text(
          nama_latin,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              tempat_turun.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7B80AD)),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.circle,
              color: Color(0xff7B80AD),
              size: 8,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              jumlah_ayat.toString() + ' ayat'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff7B80AD)),
            ),
          ],
        ),
        trailing: Text(
          nama,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 20,
            color: Color(0xffA44AFF),
          ),
        ),
      ),
    );
  }
}
