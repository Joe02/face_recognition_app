import 'package:flutter/material.dart';
import 'package:image_recognition/pages/camera_recognition_page.dart';
import 'package:image_recognition/pages/gallery_recognition_page.dart';

void main() {
  runApp(FaceRecognition());
}

class FaceRecognition extends StatefulWidget {
  @override
  FaceRecognitionState createState() => FaceRecognitionState();
}

class FaceRecognitionState extends State<FaceRecognition> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Reconhecimento de Imagem"),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                        elevation: 5,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                "Escolher uma foto apartir da",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CameraRecognition(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("CÂMERA",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GalleryRecognition(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "GALERIA",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Icon(
                                          Icons.photo,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
