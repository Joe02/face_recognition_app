import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
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
  File _image;
  var containsFile = false;

  final labeler = FirebaseVision.instance.imageLabeler(ImageLabelerOptions(confidenceThreshold: 0.90));
  final textLabeler = FirebaseVision.instance.textRecognizer();

  @override
  void initState() {
    super.initState();
    openGallery();
  }

  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      openGallery();
    });

    return MaterialApp(
      home: Scaffold(
        body: containsFile
            ? Container(width: 200, height: 200, child: Image.file(_image))
            : Center(child: Text("Nenhuma imagem selecionada")),
      ),
    );
  }

  Future<File> openGallery() async {
    imageFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = imageFile;
      containsFile = true;

      // List<ImageLabel> labels = labeler.processImage(/*TODO Add Vision image here */);
      // print( labels[0].text )

      // final textLabel = textLabeler.processImage(/*TODO Add Vision image here *);

      //TODO Do action considering labels[0].text as a parameter.
    });
  }
}
