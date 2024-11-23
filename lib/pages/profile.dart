import 'dart:typed_data';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? _image;
  Uint8List? _imageBytes;

  Future<void> _showImageSourceDialog() async {
    final ImagePicker picker = ImagePicker();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecionar fonte de imagem'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 4,
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.camera);
                    if (photo != null) {
                      final bytes = await photo.readAsBytes();
                      setState(() {
                        _image = photo;
                        _imageBytes = bytes;
                      });
                    }
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, size: 50),
                        SizedBox(height: 8),
                        Text('Câmera'),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (photo != null) {
                      final bytes = await photo.readAsBytes();
                      setState(() {
                        _image = photo;
                        _imageBytes = bytes;
                      });
                    }
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_library, size: 50),
                        SizedBox(height: 8),
                        Text('Galeria'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Profile Page"))),
      body:  Center(child: ProfileScreen(
        avatar:IconButton(
          iconSize: 150,
          icon: _image != null && _imageBytes != null ? Image.memory(_imageBytes!, width: 150, height: 150,): const Icon(Icons.account_circle),
          onPressed: () async {
            await _showImageSourceDialog();
          },
          ),
        actions: [
        SignedOutAction((context) {
          Get.offNamed('/auth');
        })
      ],)),
      );
  }
}