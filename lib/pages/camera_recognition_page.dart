import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_recognition/widgets/image_labeler_options.dart';
import 'package:image_recognition/widgets/image_recognition_response_list.dart';

class CameraRecognition extends StatefulWidget {
  @override
  CameraRecognitionState createState() => CameraRecognitionState();
}

class CameraRecognitionState extends State<CameraRecognition> {
  var picker = ImagePicker();
  var imageFile;
  File _image;
  var containsFile = false;
  List<String> labelOptions = [];

  final textLabeler = FirebaseVision.instance.textRecognizer();

  final GlobalKey<ScaffoldState> _scaffoldKey =
  new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    openCamera();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: containsFile
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageLabelerExhibition(
              _image,
              recognizeElementsOnImage,
              recognizeElementsOnImageGCLOUD,
            ),
            buildResponseOptionsList()
          ],
        )
            : Center(child: Text("Nenhuma imagem selecionada")),
      ),
    );
  }

  buildResponseOptionsList() {
    return ImageRecognitionResponseList(labelOptions);
  }

  Future openCamera() async {
    //Gets image from ImagePicker.camera
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    final File file = File(pickedFile.path);

    //Sets the image to a File variable.
    setState(() {
      _image = file;
      containsFile = true;
    });
  }

  Future recognizeElementsOnImage() async {
    ImageLabeler recognizeImage = FirebaseVision.instance
        .imageLabeler(ImageLabelerOptions(confidenceThreshold: 0.8));

    final List<ImageLabel> recognizedLabels = await recognizeImage
        .processImage(FirebaseVisionImage.fromFilePath(_image.path));

    if (recognizedLabels.isEmpty) {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: Text("SEM LABELS")));
    } else {
      labelOptions.clear();
    }
    for (ImageLabel label in recognizedLabels) {
      //Display the most related recognized word.
//        _scaffoldKey.currentState
//            .showSnackBar(new SnackBar(content: Text(label.text)));
      labelOptions.add(label.text);
    }
  }

  Future recognizeElementsOnImageGCLOUD() async {
    ImageLabeler recognizeImage = FirebaseVision.instance
        .cloudImageLabeler(CloudImageLabelerOptions(confidenceThreshold: 0.7));

    final List<ImageLabel> recognizedLabels = await recognizeImage
        .processImage(FirebaseVisionImage.fromFilePath(_image.path));

    if (recognizedLabels.isEmpty) {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: Text("SEM LABELS")));
    } else {
      labelOptions.clear();
      for (ImageLabel label in recognizedLabels) {
        //Display the most related recognized word.
//        _scaffoldKey.currentState
//            .showSnackBar(new SnackBar(content: Text(label.text)));
        labelOptions.add(label.text);
      }
    }
    setState(() {
      labelOptions = labelOptions;
    });
  }
}
