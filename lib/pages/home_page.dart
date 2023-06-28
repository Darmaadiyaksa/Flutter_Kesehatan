import 'package:flutter/material.dart';
import 'package:flutter_medical_ui/UI/datapost.dart';
import 'package:flutter_medical_ui/detail/detail.dart';
import 'package:flutter_medical_ui/detail/detaill.dart';
import 'package:flutter_medical_ui/detail/dettail.dart';
import 'package:flutter_medical_ui/main.dart';
import 'package:flutter_medical_ui/pages/detail_docter.dart';
import 'package:flutter_medical_ui/pages/products.dart';
import 'package:flutter_medical_ui/pages/started.dart';
import 'package:flutter_medical_ui/UI/datapost.dart';
import 'package:flutter_medical_ui/tampilan/maiin.dart';

import '../widgets/doctor_item.dart';
import '../widgets/specialist_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(76, 175, 80, 1),
        title: const Text('Hello, selamat datang'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text('Darma Adiyaksa'),
              accountEmail: Text('darma@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/saya.jpg'),
              ),
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.login_rounded),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            ListTile(
              title: Text('produk'),
              leading: Icon(Icons.search),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductPage()));
              },
            ),
            ListTile(
              title: Text('help'),
              leading: Icon(Icons.help),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => mainn()));
              },
            ),
            ListTile(
                title: Text('cht'),
                leading: Icon(Icons.chat),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                specialist: '',
                                title: '',
                              )));
                }),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black54,
            ),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 167, 230, 148),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/surgeon.png",
                      width: 92,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bagaimana Perasaanmu?",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const SizedBox(
                          width: 120,
                          child: Text(
                            "Isi Kendala Anda Sekarang",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 35,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPage()),
                                );
                              },
                              child: Text(
                                "Mulai",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 64,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(95, 179, 173, 173),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      size: 32,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Pencarian",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Tindakan ketika item "Ahli Gigi" ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  mainn()), // Ganti SpecialistPage dengan halaman tujuan yang diinginkan
                        );
                      },
                      child: SpecialistItem(
                        imagePath: "assets/clean.png",
                        imageName: "Ahli Gigi",
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Tindakan ketika item "Ahli Bedah" ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  mainn()), // Ganti SpecialistPage dengan halaman tujuan yang diinginkan
                        );
                      },
                      child: SpecialistItem(
                        imagePath: "assets/bedah.png",
                        imageName: "Ahli Bedah",
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Tindakan ketika item "Ahli Kandungan" ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  mainn()), // Ganti SpecialistPage dengan halaman tujuan yang diinginkan
                        );
                      },
                      child: SpecialistItem(
                        imagePath: "assets/kandungann.png",
                        imageName: "Ahli Kandungan",
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Tindakan ketika item "Ahli fisiologi" ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  mainn()), // Ganti SpecialistPage dengan halaman tujuan yang diinginkan
                        );
                      },
                      child: SpecialistItem(
                        imagePath: "assets/hormones.png",
                        imageName: "Ahli fisiologi",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Daftar Dokter",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorPage()));
                      },
                      child: const DoctorItem(
                        image: "assets/11.jpg",
                        name: "Nugraha",
                        specialist: "Ahli Gigi",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage()));
                      },
                      child: const DoctorItem(
                        image: "assets/22.jpg",
                        name: "Yana",
                        specialist: "Ahli Bedah",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetaillPage()));
                      },
                      child: const DoctorItem(
                        image: "assets/33.jpg",
                        name: "Risma",
                        specialist: "Ahli Kandungan",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DettailPage()));
                      },
                      child: const DoctorItem(
                        image: "assets/444.jpg",
                        name: "Kumara",
                        specialist: "Ahli Fisiologi",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
