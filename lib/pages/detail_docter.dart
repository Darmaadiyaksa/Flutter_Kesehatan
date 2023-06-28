import 'package:flutter/material.dart';
import 'package:flutter_medical_ui/UI/datapost.dart';
import 'package:flutter_medical_ui/pages/products.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokter Gigi'),
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
                'assets/11.jpg',
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
              'Dr. Sanjiwana Nugraha',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Dokter Nugraha adalah Dokter Gigi yang memiliki banyak pengalaman dan wawasan di bidang gigi, bliau lulusan Universitas Pendidikan Ganesha S1 Ilmu Kedokteran Gigi.Sekarang beliau bekerja di Rumah Sakit Balimandara,Bliau juga Membuka praktek di Jalan Gatot Subroto Barat, Pemecutan Kaja, Kota Denpasar, Bali. Apabila kalian ingin konsultasi bisa hubungi no :089337426125 ',
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
