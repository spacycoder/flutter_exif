import 'dart:async';

import 'dart:typed_data';
import 'package:flutter/services.dart';

class FlutterExif {
  static const channel = MethodChannel("flutter_exif_plugin_channel");
  FlutterExif.fromPath(String pathToImage) {
    channel.invokeMethod("initPath", pathToImage);
  }

  FlutterExif.fromBytes(Uint8List imageData) {
    channel.invokeMethod("initBytes", imageData);
  }

  /// Save the tag data into the original image file. This is expensive because it involves copying all the data from one file to another and deleting the old file and renaming the other.
  /// It's best to set all attributes to write and make a single call rather than multiple calls for each attribute.
  ///
  /// Note: if the "fromBytes" constructor is used you will have to use the "imageData" method to retrive the modified image
  ///
  /// Note2: after calling this method, any attempts to obtain range information from the image will throw IllegalStateException, since the offsets may have changed in the newly written file.
  Future<void> saveAttributes() => channel.invokeMethod("saveAttributes");

  /// Returns the value of the specified tag or null if there is no such tag in the image file.
  Future<Uint8List?> get imageData =>
      channel.invokeMethod<Uint8List>("getImageData");

  /// Returns the value of the specified tag or null if there is no such tag in the image file.
  Future<String?> getAttribute(String tag) =>
      channel.invokeMethod<String>("getAttribute", tag);

  /// Returns the raw bytes for the value of the requested tag inside the image file, or null if the tag is not contained.
  Future<Uint8List?> getAttributeBytes(String tag) =>
      channel.invokeMethod<Uint8List>("getAttributeBytes", tag);

  /// Returns the double value of the tag that is specified as rational or contains a double-formatted value. If there is no such tag in the image file or the value cannot be parsed as double, return defaultValue.
  Future<double?> getAttributeDouble(String tag, double defaultValue) =>
      channel.invokeMethod<double>(
          "getAttributeDouble", {"tag": tag, "defaultValue": defaultValue});

  /// Returns the integer value of the specified tag. If there is no such tag in the image file or the value cannot be parsed as integer, return defaultValue.
  Future<int?> getAttributeInt(String tag, int defaultValue) =>
      channel.invokeMethod<int>(
          "getAttributeInt", {"tag": tag, "defaultValue": defaultValue});

  /// Returns the offset and length of the requested tag inside the image file, or null if the tag is not contained.
  Future<Int64List?> getAttributeRange(String tag) =>
      channel.invokeMethod<Int64List>("getAttributeRange", tag);

  Future<void> setAttribute(String tag, String tagValue) => channel
      .invokeMethod<void>("setAttribute", {"tag": tag, "tagValue": tagValue});

  /// Flips the image horizontally.
  Future<void> flipHorizontally() =>
      channel.invokeMethod<void>("flipHorizontally");

  /// Flips the image vertically.
  Future<void> flipVertically() => channel.invokeMethod<void>("flipVertically");

  /// Return the altitude in meters. If the exif tag does not exist, return defaultValue.
  Future<double?> getAltitude(double defaultValue) =>
      channel.invokeMethod<double>("getAltitude", defaultValue);

  /// Gets the latitude and longitude values.
  ///
  /// If there are valid latitude and longitude values in the image, this method returns a double array where the first element is
  /// the latitude and the second element is the longitude. Otherwise, it returns null.
  Future<Float64List?> getLatLong() =>
      channel.invokeMethod<Float64List>("getLatLong");

  /// Returns the rotation degrees for the current image orientation. If the image is flipped, i.e., isFlipped() returns true,
  /// the rotation degrees will be base on the assumption that the image is first flipped horizontally (along Y-axis), and then do the rotation.
  /// For example, ORIENTATION_TRANSPOSE will be interpreted as flipped horizontally first, and then rotate 270 degrees clockwise.
  Future<int?> getRotationDegrees() =>
      channel.invokeMethod<int>("getRotationDegrees");

  /// Returns the JPEG compressed thumbnail inside the image file, or null if there is no JPEG compressed thumbnail.
  /// The returned data can be decoded using BitmapFactory#decodeByteArray(byte[],int,int)
  Future<Uint8List?> getThumbnail() =>
      channel.invokeMethod<Uint8List>("getThumbnail");

  /// Returns the thumbnail bytes inside the image file, regardless of the compression type of the thumbnail ima
  Future<Uint8List?> get thumbnailBytes =>
      channel.invokeMethod<Uint8List>("getThumbnailBytes");

  /// Returns the offset and length of thumbnail inside the image file, or
  /// null if either there is no thumbnail or the thumbnail bytes are stored non-consecutively.
  Future<Int64List?> get thumbnailRange =>
      channel.invokeMethod<Int64List>("getThumbnailRange");

  /// Returns true if the image file has the given attribute defined.
  Future<bool?> hasAttribute(String tag) =>
      channel.invokeMethod<bool>("hasAttribute", tag);

  /// Returns true if the image file has a thumbnail.
  Future<bool?> get hasThumbnail => channel.invokeMethod<bool>("hasThumbnail");

  /// Returns if the current image orientation is flipped.
  Future<bool?> get isFlipped => channel.invokeMethod<bool>("isFlipped");

  /// Returns whether ExifInterface currently supports reading data from the specified mime type or not.
  Future<bool?> isSupportedMimeType(String mimeType) =>
      channel.invokeMethod<bool>("isSupportedMimeType", mimeType);

  /// Returns true if thumbnail image is JPEG Compressed, or false if either thumbnail image does not exist or thumbnail image is uncompressed.
  Future<bool?> get isThumbnailCompressed =>
      channel.invokeMethod<bool>("isThumbnailCompressed");

  /// Resets the TAG_ORIENTATION of the image to be ORIENTATION_NORMAL
  Future<void> resetOrientation() =>
      channel.invokeMethod<void>("resetOrientation");

  /// Rotates the image by the given degree clockwise. The degree should be a multiple of 90 (e.g, 90, 180, -90, etc.).
  Future<void> rotate(int degree) =>
      channel.invokeMethod<void>("rotate", degree);

  /// Sets the latitude and longitude values.
  Future<void> setLatLong(double latitude, double longitude) =>
      channel.invokeMethod<bool>(
          "setLatLong", {"latitude": latitude, "longitude": longitude});
}
