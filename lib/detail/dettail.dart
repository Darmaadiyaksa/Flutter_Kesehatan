import 'package:flutter/material.dart';
import 'package:flutter_medical_ui/UI/datapost.dart';
import 'package:flutter_medical_ui/pages/products.dart';

class DettailPage extends StatelessWidget {
  const DettailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokter Fisiologi'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/444.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Dr. Komang Kumara',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Dokter Kumara adalah Dokter Fisiologi yang memiliki banyak pengalaman dan wawasan di bidang mental Helrt, bliau lulusan Universitas Indonesia/UI  S1 Ilmu Kedokteran.Sekarang beliau bekerja di Rumah Sakit Pratama,Bliau juga Membuka praktek di Jalan Banteng no 21 , Abian Kelod, Kota Gianyar, Bali. Apabila kalian ingin konsultasi bisa hubungi no :085321456097 ',
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataPosts(
                      title: '',
                    ),
                  ),
                );
              },
              child: Container(
                width: 300,
                height: 40,
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
