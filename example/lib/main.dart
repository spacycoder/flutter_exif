import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_exif/tags.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_exif/flutter_exif.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePicker _picker = ImagePicker();
  String _response = '(please, wait)';
  FlutterExif exif;
  Uint8List imageToRead;

  @override
  void initState() {
    super.initState();
  }

  void readFile() async {
    if (exif == null) {
      setFile();
    }
    exif = FlutterExif.fromBytes(imageToRead);
    final result = await exif.getAttribute(TAG_USER_COMMENT);
    print(result);

    setState(() {
      _response = result;
    });
  }

  void setFile() async {
    final pickerImage = await _picker.getImage(source: ImageSource.gallery);
    Uint8List bytes = await pickerImage.readAsBytes();
    exif = FlutterExif.fromBytes(bytes);
    exif.setAttribute(TAG_USER_COMMENT, "my json structure");
    exif.saveAttributes();
    imageToRead = await exif.imageData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'User comment :\n$_response\n',
                textAlign: TextAlign.center,
              ),
              FlatButton(
                onPressed: () {
                  readFile();
                },
                child: Text("read user comment"),
              ),
              FlatButton(
                onPressed: () {
                  setFile();
                },
                child: Text("write"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
