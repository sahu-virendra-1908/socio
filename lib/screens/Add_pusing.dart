import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPusing extends StatefulWidget {
  const AddPusing({super.key});

  @override
  State<AddPusing> createState() => _AddPusingState();
}

class _AddPusingState extends State<AddPusing> {
  File? _imageFile; // For storing the picked image
  final TextEditingController _descriptionController =
      TextEditingController(); // For description

  // Method to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsiveness
    var screenSize = MediaQuery.of(context).size;
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Add Pusing", style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display image if selected, otherwise show a placeholder
              GestureDetector(
                onTap: _pickImage, // Trigger image picker on tap
                child: Container(
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Center(
                          child: Text(
                            'Tap to select an image',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Enter Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              // Pay Button
              Container(
                
                width:  screenwidth*0.8,
                height: screenheight*0.05,
              
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text("Pay Token",style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
