import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryRecognition extends StatefulWidget {
  @override
  GalleryRecognitionState createState() => GalleryRecognitionState();
}

class GalleryRecognitionState extends State<GalleryRecognition> {
  var picker = ImagePicker();
  var imageFile;
  var _image;

  @override
  void initState() {
    super.initState();
    openCamera();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _image != null
            ? Image.file(_image)
            : Text("Nenhuma imagem selecionada"),
      ),
    );
  }

  Future openCamera() async {
    try {
      setState(() async {
        imageFile = await picker.getImage(source: ImageSource.gallery);
        setState(() {
          _image = imageFile;
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
