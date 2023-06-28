import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_medical_ui/UI/detailPost.dart';
import 'package:flutter_medical_ui/UI/inputPost.dart';
import 'package:flutter_medical_ui/main.dart';
import 'package:flutter_medical_ui/models/errMsg.dart';
import 'package:flutter_medical_ui/models/post.dart';
import 'package:flutter_medical_ui/serviceS/api.dart';
import 'package:flutter_medical_ui/pages/chat_page.dart';

class DataPosts extends StatefulWidget {
  const DataPosts({super.key, required String title});

  @override
  State<DataPosts> createState() => _DataPostsState();
}

class _DataPostsState extends State<DataPosts> {
  late ErrorMSG response;
  List<Post> _posts = [];
  bool _isLoading = false;
  void deletePost(id) async {
    response = await ApiStatic.deletePost(id);
    final snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (BuildContext context) => DataPosts(
                title: '',
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Post> posts = await ApiStatic.getPost();
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
      print('Failed to fetch posts: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshPosts() async {
    await fetchPosts();
  }

  void _showPostDetail(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPost(post: post),
      ),
    );
  }

  void _startChat() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyHomePage(
                title: '',
                specialist: '',
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Api'),
        backgroundColor: Color.fromRGBO(76, 175, 80, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: _startChat,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InputPost(
                        post: Post(
                            id: 0,
                            Nama: '',
                            Email: '',
                            image: '',
                            Alamat: '',
                            No_tlp: ''))));
          }),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _refreshPosts,
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == _posts.length) {
                    if (_isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                  Post post = _posts[index];
                  return ListTile(
                    title: Text(post.Nama),
                    subtitle: Text(post.Email),
                    leading: Image.network(
                        ApiStatic.host + "/storage/" + post.image),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            // Logika yang akan dijalankan ketika tombol info ditekan
                            _showPostDetail(post);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InputPost(post: post)));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Konfirmasi Hapus"),
                                  content: Text(
                                      "Apakah Anda yakin ingin menghapus post ini?"),
                                  actions: [
                                    TextButton(
                                      child: Text("Batal"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Tutup dialog
                                      },
                                    ),
                                    TextButton(
                                      child: Text("Hapus"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Tutup dialog
                                        deletePost(
                                            post.id); // Jalankan fungsi hapus
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
