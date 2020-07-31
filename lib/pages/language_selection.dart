import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelection extends StatefulWidget {
  @override
  LanguageSelectionState createState() => LanguageSelectionState();
}

class LanguageSelectionState extends State<LanguageSelection> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Choose a language for the labels :"),
          ),
          FutureBuilder(
            future: initPrefs(),
            builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        prefs.setString("Language", "Português");
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Português"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        prefs.setString("Language", "English");
                        Navigator.pop(context);
                      });
                    },
                    child: Text("English"),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
