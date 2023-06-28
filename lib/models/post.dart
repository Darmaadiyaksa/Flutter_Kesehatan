// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int id;
  String Nama;
  String Email;
  String image;
  String Alamat;
  String No_tlp;
  // DateTime createdAt;
  // DateTime updatedAt;

  Post({
    required this.id,
    required this.Nama,
    required this.Email,
    required this.image,
    required this.Alamat,
    required this.No_tlp,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        Nama: json["Nama"],
        Email: json["Email"],
        No_tlp: json["No_tlp"],
        Alamat: json["Alamat"],
        image: json["image"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Nama": Nama,
        "Email": Email,
        "No_tpl": No_tlp,
        "Alamat": Alamat,
        "image": image,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
