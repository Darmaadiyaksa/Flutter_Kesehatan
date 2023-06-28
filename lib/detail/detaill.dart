import 'package:flutter/material.dart';
import 'package:flutter_medical_ui/UI/datapost.dart';
import 'package:flutter_medical_ui/pages/products.dart';

class DetaillPage extends StatelessWidget {
  const DetaillPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokter Kandungan'),
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
                'assets/33.jpg',
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
              'Dr. Risma Kusuma Dewi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Dokter Risma adalah Dokter Gigi yang memiliki banyak pengalaman dan wawasan di bidang Kandungan, bliau lulusan Universitas Pendidikan Ganesha S1 Ilmu Kebidanan, dan S2 Ilmu Kandungan di Malang .Sekarang beliau bekerja di Rumah Sakit Sanglah,Bliau juga Membuka praktek di Jalan Pakesaji no 52, Kota Denpasar, Bali. Apabila kalian ingin konsultasi bisa hubungi no :087762441231 ',
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
