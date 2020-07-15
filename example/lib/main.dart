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
  Uint8List imageToRead;
  String _response = '(please, wait)';

  @override
  void initState() {
    super.initState();
  }

  void readFile() async {
    if (imageToRead == null) {
      final pickerImage = await _picker.getImage(source: ImageSource.gallery);
      Uint8List bytes = await pickerImage.readAsBytes();
      imageToRead = await FlutterExif.setAttribute(
          bytes, TAG_USER_COMMENT, "my json structure");
    }
    final result =
        await FlutterExif.getAttribute(imageToRead, TAG_USER_COMMENT);
    print(result);

    setState(() {
      _response = result;
    });
  }

  void setFile() async {
    final pickerImage = await _picker.getImage(source: ImageSource.gallery);
    Uint8List bytes = await pickerImage.readAsBytes();
    imageToRead = await FlutterExif.setAttribute(
        bytes, TAG_USER_COMMENT, "my json structure");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Rust FFI'),
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
