import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageRecognitionResponseList extends StatelessWidget {
  final labelOptions;
  ImageRecognitionResponseList(this.labelOptions);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: List.generate(
          labelOptions.length,
              (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text(labelOptions[index]),
            ),
          ),
        ),
      ),
    );
  }
}