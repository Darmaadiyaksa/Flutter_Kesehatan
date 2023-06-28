import 'package:flutter/material.dart';
import 'package:flutter_medical_ui/services/api.dart';
import 'package:flutter_medical_ui/models/post.dart';
import 'package:flutter_medical_ui/serviceS/api.dart';

class DetailPost extends StatelessWidget {
  final Post post;

  const DetailPost({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(
            //   ApiStatic.host + "/storage/" + post.image,
            //   height: 300,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(height: 16),
            Text(
              post.Nama,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email: ${post.Email}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Alamat : \n' + post.Alamat,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
