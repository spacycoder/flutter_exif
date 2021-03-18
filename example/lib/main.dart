import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_exif_plugin/tags.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_exif_plugin/flutter_exif_plugin.dart';

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
    final latlon = await exif.getLatLong();
    print(result);
    print(latlon);

    setState(() {
      _response = result;
    });
  }

  void setFile() async {
    final pickerImage = await _picker.getImage(source: ImageSource.gallery);
    Uint8List bytes = await pickerImage.readAsBytes();
    exif = FlutterExif.fromBytes(bytes);
    await exif.setLatLong(20.0, 10.0);
    await exif.setAttribute(TAG_USER_COMMENT, 'my json structure');
    await exif.saveAttributes();
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
              TextButton(
                onPressed: () {
                  readFile();
                },
                child: Text("read user comment"),
              ),
              TextButton(
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
