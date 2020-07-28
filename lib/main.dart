import 'package:flutter/material.dart';

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
      home: Scaffold(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {},
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
                                  onPressed: () {},
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
    );
  }
}
