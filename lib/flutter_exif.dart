import 'dart:async';

import 'dart:typed_data';
import 'package:flutter/services.dart';

class FlutterExif {
  static const channel = MethodChannel("flutter_exif_channel");
 

  /// Returns the value of the specified tag or null if there is no such tag in the image file.
  static Future<String> getAttribute(Uint8List imageData, String tag) => channel
      .invokeMethod<String>("getAttribute", {"tag": tag, "image": imageData});

  /// Returns the raw bytes for the value of the requested tag inside the image file, or null if the tag is not contained.
  static Future<Uint8List> getAttributeBytes(Uint8List imageData, String tag) =>
      channel.invokeMethod<Uint8List>(
          "getAttributeBytes", {"tag": tag, "image": imageData});

  /// Returns the double value of the tag that is specified as rational or contains a double-formatted value. If there is no such tag in the image file or the value cannot be parsed as double, return defaultValue.
  static Future<double> getAttributeDouble(
          Uint8List imageData, tag, double defaultValue) =>
      channel.invokeMethod<double>("getAttributeDouble",
          {"tag": tag, "image": imageData, "defaultValue": defaultValue});

  /// Returns the integer value of the specified tag. If there is no such tag in the image file or the value cannot be parsed as integer, return defaultValue.
  static Future<int> getAttributeInt(
          Uint8List imageData, tag, int defaultValue) =>
      channel.invokeMethod<int>("getAttributeInt",
          {"tag": tag, "image": imageData, "defaultValue": defaultValue});

  /// Returns the offset and length of the requested tag inside the image file, or null if the tag is not contained.
  static Future<Int64List> getAttributeRange(Uint8List imageData, String tag) =>
      channel.invokeMethod<Int64List>(
          "getAttributeRange", {"tag": tag, "image": imageData});

  static Future<Uint8List> setAttribute(
          Uint8List imageData, String tag, String tagValue) =>
      channel.invokeMethod<Uint8List>("setAttribute",
          {"tag": tag, "tagValue": tagValue, "image": imageData});

  /// Flips the image horizontally.
  static Future<Uint8List> flipHorizontally(Uint8List imageData) =>
      channel.invokeMethod<Uint8List>("flipHorizontally",imageData);

  /// Flips the image vertically.
  static Future<Uint8List> flipVertically(Uint8List imageData) =>
      channel.invokeMethod<Uint8List>("flipVertically", imageData);

  /// Return the altitude in meters. If the exif tag does not exist, return defaultValue.
  static Future<Uint8List> getAltitude(
          double defaultValue, Uint8List imageData) =>
      channel.invokeMethod<Uint8List>(
          "getAltitude", {"image": imageData, "defaultValue": defaultValue});

  /// Gets the latitude and longitude values.
  ///
  /// If there are valid latitude and longitude values in the image, this method returns a double array where the first element is
  /// the latitude and the second element is the longitude. Otherwise, it returns null.
  static Future<Float64List> getLatLong(Uint8List imageData) =>
      channel.invokeMethod<Float64List>("getLatLong", {"image": imageData});

  /// Returns the rotation degrees for the current image orientation. If the image is flipped, i.e., isFlipped() returns true,
  /// the rotation degrees will be base on the assumption that the image is first flipped horizontally (along Y-axis), and then do the rotation.
  /// For example, ORIENTATION_TRANSPOSE will be interpreted as flipped horizontally first, and then rotate 270 degrees clockwise.
  static Future<int> getRotationDegrees(Uint8List imageData) =>
      channel.invokeMethod<int>("getRotationDegrees", {"image": imageData});

  /// Returns the JPEG compressed thumbnail inside the image file, or null if there is no JPEG compressed thumbnail.
  /// The returned data can be decoded using BitmapFactory#decodeByteArray(byte[],int,int)
  static Future<Uint8List> getThumbnail(Uint8List imageData) =>
      channel.invokeMethod<Uint8List>("getThumbnail", {"image": imageData});

  /// Returns the thumbnail bytes inside the image file, regardless of the compression type of the thumbnail ima
  static Future<Uint8List> humbnailBytes(Uint8List imageData) => channel
      .invokeMethod<Uint8List>("getThumbnailBytes", {"image": imageData});

  /// Returns the offset and length of thumbnail inside the image file, or
  /// null if either there is no thumbnail or the thumbnail bytes are stored non-consecutively.
  static Future<Int64List> getThumbnailRange(Uint8List imageData) => channel
      .invokeMethod<Int64List>("getThumbnailRange", {"image": imageData});

  /// Returns true if the image file has the given attribute defined.
  static Future<bool> hasAttribute(Uint8List imageData, String tag) =>
      channel.invokeMethod<bool>(
          "hasAttribute", {"image": imageData, "tag": tag});

  /// Returns true if the image file has a thumbnail.
  static Future<bool> hasThumbnail(Uint8List imageData) =>
      channel.invokeMethod<bool>("hasThumbnail", {"image": imageData});

  /// Returns if the current image orientation is flipped.
  static Future<bool> isFlipped(Uint8List imageData) =>
      channel.invokeMethod<bool>("isFlipped", {"image": imageData});

  /// Returns whether ExifInterface currently supports reading data from the specified mime type or not.
  static Future<bool> isSupportedMimeType(String mimeType) =>
      channel.invokeMethod<bool>("isSupportedMimeType", {"mimeType": mimeType});

  /// Returns true if thumbnail image is JPEG Compressed, or false if either thumbnail image does not exist or thumbnail image is uncompressed.
  static Future<bool> isThumbnailCompressed(Uint8List imageData) =>
      channel.invokeMethod<bool>("isThumbnailCompressed", {"image": imageData});

  /// Resets the TAG_ORIENTATION of the image to be ORIENTATION_NORMAL
  static Future<Uint8List> resetOrientation(Uint8List imageData) =>
      channel.invokeMethod<Uint8List>("resetOrientation", {"image": imageData});

  /// Rotates the image by the given degree clockwise. The degree should be a multiple of 90 (e.g, 90, 180, -90, etc.).
  static Future<Uint8List> rotate(Uint8List imageData, int degree) =>
      channel.invokeMethod<Uint8List>(
          "rotate", {"image": imageData, "degree": degree});
setLatLongde(Uint8List imageData, double altitude) =>
      channel.invokeMethod<Uint8List>(
          "setAltitude", {"image": imageData, "altitude": altitude});

  /// Sets the latitude and longitude values.
  static Future<Uint8List> setLatLong(
          Uint8List imageData, double latitude, double longitude) =>
      channel.invokeMethod<Uint8List>("setLatLong",
          {"image": imageData, "latitude": latitude, "longitude": longitude});
}
