import 'dart:convert';
import 'package:flutter_medical_ui/models/post.dart';
import 'package:http/http.dart' as http;

import '../models/errMsg.dart';

class ApiStatic {
  // static const host = 'http://192.168.0.135';
  static const host = 'http://192.168.0.111:80';
  static const _token = "Bearer 2|9ZFbM6GoyKMU29P2W9uINrpwOm2zSrFwpSTriFVi";
  static Future<List<Post>> getPost() async {
    try {
      final response = await http.get(Uri.parse("$host/api/posts"), headers: {
        'Authorization': _token,
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Post>((json) => Post.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // create & update
  static Future<ErrorMSG> savePost(id, post, filepath) async {
    try {
      var url = Uri.parse('$host/api/posts');
      if (id != 0) {
        url = Uri.parse('$host/api/posts/' + id.toString());
      }
      var request = http.MultipartRequest('POST', url);
      request.fields['Nama'] = post['Nama'];
      request.fields['Alamat'] = post['Alamat'];
      request.fields['Email'] = post['Email'];
      request.fields['No_tlp'] = post['No_tlp'];
      if (filepath != '') {
        request.files.add(await http.MultipartFile.fromPath('image', filepath));
      }
      request.headers.addAll({
        'Authorization': _token,
      });
      var response = await request.send();
      //final response = await http.post(Uri.parse('$_host/panen'), body:_panen);
      if (response.statusCode == 200) {
        //return ErrorMSG.fromJson(jsonDecode(response.body));
        final respStr = await response.stream.bytesToString();
        //print(jsonDecode(respStr));
        return ErrorMSG.fromJson(jsonDecode(respStr));
      } else {
        //return ErrorMSG.fromJson(jsonDecode(response.body));
        return ErrorMSG(success: false, message: 'err Request');
      }
    } catch (e) {
      ErrorMSG responseRequest =
          ErrorMSG(success: false, message: 'error caught: $e');
      return responseRequest;
    }
  }

  // delete
  static Future<ErrorMSG> deletePost(id) async {
    try {
      final response = await http
          .delete(Uri.parse('$host/api/posts/' + id.toString()), headers: {
        'Authorization': _token,
      });
      if (response.statusCode == 200) {
        return ErrorMSG.fromJson(jsonDecode(response.body));
      } else {
        return ErrorMSG(
            success: false, message: 'Err, periksan kembali inputan anda');
      }
    } catch (e) {
      ErrorMSG responseRequest =
          ErrorMSG(success: false, message: 'error caught: $e');
      return responseRequest;
    }
  }
}
