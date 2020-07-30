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

  final textLabeler = FirebaseVision.instance.textRecognizer();

  @override
  void initState() {
    super.initState();
    openGallery();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: containsFile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 300, height: 300, child: Image.file(_image)),
                  RaisedButton(
                    onPressed: () {
                      recognizeElementsOnImage(_scaffoldKey);
                    },
                    child: Text("Identificar"),
                  ),
                ],
              )
            : Center(child: Text("Nenhuma imagem selecionada")),
      ),
    );
  }

  Future<File> openGallery() async {
    //Gets image from ImagePicker.camera
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    final File file = File(pickedFile.path);

    //Sets the image to a File variable.
    setState(() {
      _image = file;
      containsFile = true;
    });
  }

  Future recognizeElementsOnImage(_scaffoldKey) async {
    ImageLabeler recognizeImage = FirebaseVision.instance.imageLabeler(
        //90% of accuracy
        ImageLabelerOptions(confidenceThreshold: 0.90));
    final recognizedLabels =
        await recognizeImage.processImage(FirebaseVisionImage.fromFile(_image));

    //Displays the most related recognized word.
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: Text(recognizedLabels[0].text)));
  }
}
