import 'package:flutter/material.dart';
import 'package:image_recognition/pages/image_recognition.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(FaceRecognition());
}

class FaceRecognition extends StatefulWidget {
  @override
  FaceRecognitionState createState() => FaceRecognitionState();
}

class FaceRecognitionState extends State<FaceRecognition> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;
  String appBarTitle = "Image recognition";
  String selectableOption = "Choose from";
  String cameraOption = "Camera";
  String galleryOption = "Gallery";

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async {
    prefs = await _prefs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
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
                                selectableOption,
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
                                              ImageRecognition("Camera"),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(cameraOption,
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
                                              ImageRecognition("Gallery"),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            galleryOption,
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
