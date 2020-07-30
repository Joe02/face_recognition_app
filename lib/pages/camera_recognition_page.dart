import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
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
  var containsFile = false;
  List<ImageLabel> labels = [];
  String _firstLabel = "";

  final labeler = FirebaseVision.instance
      .imageLabeler(ImageLabelerOptions(confidenceThreshold: 0.90));
  final textLabeler = FirebaseVision.instance.textRecognizer();

  @override
  void initState() {
    super.initState();
    openCamera();
  }

  @override
  Widget build(BuildContext context) {
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

  Future<File> openCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
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
