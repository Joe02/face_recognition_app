import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLabelerExhibition extends StatefulWidget {
  final File _image;
  final recognizeElementsOnImage;
  final recognizeElementsOnImageGCLOUD;

  ImageLabelerExhibition(this._image, this.recognizeElementsOnImage, this.recognizeElementsOnImageGCLOUD);

  @override
  ImageLabelerExhibitionState createState() => ImageLabelerExhibitionState();
}

class ImageLabelerExhibitionState extends State<ImageLabelerExhibition> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(width: 300, height: 300, child: Image.file(widget._image)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      widget.recognizeElementsOnImage();
                    },
                    child: Text(
                      "Identificar sem GCLOUD",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      widget.recognizeElementsOnImageGCLOUD();
                    },
                    child: Text(
                      "Identificar com GCLOUD",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
