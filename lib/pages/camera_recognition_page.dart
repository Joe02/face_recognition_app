import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraRecognition extends StatefulWidget {
  @override
  CameraRecognitionState createState() => CameraRecognitionState();
}

class CameraRecognitionState extends State<CameraRecognition> {
  var picker = ImagePicker();
  var imageFile;
  File _image;

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
        imageFile = await picker.getImage(source: ImageSource.camera);
        setState(() {
          _image = imageFile;
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
