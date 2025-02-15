import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Add_on_button.dart';
import 'package:flutter_application_1/screens/Add_pusing.dart';
import 'package:flutter_application_1/screens/metamsk.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> posts = [];

  final ImagePicker _picker = ImagePicker();

  void addPost(String imagePath, String description) {
    setState(() {
      posts.add({'image': imagePath, 'description': description});
    });
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      addPost(image.path, 'New Post Description');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Post',
            style: TextStyle(fontSize: 22, color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //  actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white,))],

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ), // Menu icon
            onSelected: (String value) {
              // Handle menu item selection
              if (value == 'Add Pushing') {
                // Do something when Add Pushing is selected
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPusing()));
              } else if (value == 'Add-on Button') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ToggleChatForm()));
              } else if (value == 'Contact') {
                // Do something when Contact is selected
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MetaMaskLauncher()));
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Add Pushing',
                  child: Text('Add Pushing'),
                ),
                const PopupMenuItem<String>(
                  value: 'Add-on Button',
                  child: Text('Add-on Button'),
                ),
                const PopupMenuItem<String>(
                  value: 'Contact',
                  child: Text('Contact'),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: posts
            .map((post) => postItem(post['image']!, post['description']!))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: pickImage,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget postItem(String imagePath, String description) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: imagePath.contains('assets/')
                ? Image.asset(imagePath,
                    fit: BoxFit.cover, width: double.infinity, height: 180)
                : Image.file(File(imagePath),
                    fit: BoxFit.cover, width: double.infinity, height: 180),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description,
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconText(Icons.thumb_up_alt_outlined, '1.3k'),
                    iconText(Icons.remove_red_eye_outlined, '1.3M'),
                    iconText(Icons.share, '1.3k'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}
