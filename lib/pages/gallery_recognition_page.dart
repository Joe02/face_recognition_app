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
  List<ImageLabel> labels = [];
  String _firstLabel = "";

  final labeler = FirebaseVision.instance
      .imageLabeler(ImageLabelerOptions(confidenceThreshold: 0.90));
  final textLabeler = FirebaseVision.instance.textRecognizer();

  @override
  void initState() {
    super.initState();
    openGallery();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return MaterialApp(
      home: Scaffold(
        body: containsFile
            ? Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: 300, height: 300, child: Image.file(_image)),
              RaisedButton(
                onPressed: () {
                  recognizeElementsOnImage();
                },
                child: Text("Identificar"),
              ),
              Text(_firstLabel == "" ? "Texto aqui" : _firstLabel)
            ],
          ),
        )
            : Center(child: Text("Nenhuma imagem selecionada")),
      ),
    );
  }

  Future<File> openGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final File file = File(pickedFile.path);
    setState(() {
      _image = file;
      containsFile = true;
    });
  }

  Future recognizeElementsOnImage() async {
    FirebaseVisionImage imageForRecognition = FirebaseVisionImage.fromFile(_image);
    ImageLabeler recognizeImage = FirebaseVision.instance.imageLabeler();
    final recognizedLabels = await recognizeImage.processImage(imageForRecognition);

//    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text(recognizedLabels[0].text)));
  }
}
