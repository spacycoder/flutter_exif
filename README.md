# Flutter Exif
A flutter plugin for reading and writing Exif tags in various file formats.

    Note: Only android is currently supported

## Getting started

### Edit image from bytes

```dart
final Uint8List imageData = image.toBytes();
final exif = ExifFlutter.fromBytes(imageData);
await exif.setAttribute(UserComment, "my comment");
await exif.rotate(20);
// apply attributes
await exif.saveAttributes();
// get modified image
final modifiedImage = await exif.imageData;
```

### Edit image from path

note: To use the path based constructor you will have to apply the following permissions to your manifest file.
* WRITE_EXTERNAL_STORAGE
* READ_EXTERNAL_STORAGE 

```dart
final pathToImage = "/path/to/image";
final exif = ExifFlutter.fromPath(pathToImage);
exif.setAttribute(UserComment, "my comment");
exif.rotate(20);
// apply attributes
exif.saveAttributes()
```
