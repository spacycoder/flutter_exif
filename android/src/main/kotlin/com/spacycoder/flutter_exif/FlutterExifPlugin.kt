package com.spacycoder.flutter_exif

import android.content.Context
import androidx.annotation.NonNull;
import androidx.exifinterface.media.ExifInterface

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.io.File


const val FLUTTER_EXIF_CHANNEL = "flutter_exif_channel"

/** FlutterExifPlugin */
public class FlutterExifPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, FLUTTER_EXIF_CHANNEL)
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), FLUTTER_EXIF_CHANNEL)
            val instance = FlutterExifPlugin()
            channel.setMethodCallHandler(instance)
            instance.context = registrar.context()
        }
    }

    private fun getImageAndTag(call: MethodCall): Pair<ByteArray, String> {
        val bytes = call.argument<ByteArray>("image")
                ?: throw IllegalArgumentException("Image argument is required")
        val tag = call.argument<String>("tag")
                ?: throw IllegalArgumentException("Tag argument is required")
        return Pair(bytes, tag)
    }

    private fun getExifInterfaceAndFile(bytes: ByteArray): Pair<ExifInterface, File> {
        val tmpFile = File.createTempFile("flutter_exif_image", null, context.cacheDir)
        tmpFile.writeBytes(bytes)

        return Pair(ExifInterface(tmpFile), tmpFile)
    }

    private fun getExifInterfaceFromPath(imagePath: String): ExifInterface {
        return ExifInterface(imagePath)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "setAttribute" -> {
                val tagValue = call.argument<String>("tagValue")
                if (tagValue == null) {
                    result.error("ARGUMENT_ERROR", "tagValue is required", null)
                    return
                }
                try {
                    val (bytes, tag) = getImageAndTag(call)
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exif.setAttribute(tag, tagValue)
                    exif.saveAttributes()
                    result.success(tmpFile.readBytes())
                    tmpFile.delete()
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "setAttributeFromPath" -> {
                val tagValue = call.argument<String>("tagValue")
                if (tagValue == null) {
                    result.error("ARGUMENT_ERROR", "tagValue is required", null)
                    return
                }
                try {
                    val tag = call.argument<String>("tag")
                              ?: throw IllegalArgumentException("Tag argument is required")
                    val path = call.argument<String>("imagePath")
                              ?: throw IllegalArgumentException("ImagePath argument is required")
                    val exif = getExifInterfaceFromPath(path)
                    exif.setAttribute(tag, tagValue)
                    exif.saveAttributes()
                    val file = File(path)
                    result.success(file.readBytes())
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getAttribute" -> {
                try {
                    val (bytes, tag) = getImageAndTag(call)
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.getAttribute(tag)
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getAttributeDouble" -> {
                val defaultValue = call.argument<Double>("defaultValue")
                if (defaultValue == null) {
                    result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                    return
                }

                try {
                    val (bytes, tag) = getImageAndTag(call)
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.getAttributeDouble(tag, defaultValue)
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getAttributeInt" -> {
                val defaultValue = call.argument<Int>("defaultValue")
                if (defaultValue == null) {
                    result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                    return
                }

                try {
                    val (bytes, tag) = getImageAndTag(call)
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.getAttributeInt(tag, defaultValue)
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getAttributeRange" -> {
                val defaultValue = call.argument<Int>("defaultValue")
                if (defaultValue == null) {
                    result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                    return
                }

                try {
                    val (bytes, tag) = getImageAndTag(call)
                    val exif = ExifInterface(bytes.inputStream())
                    val range = exif.getAttributeRange(tag)
                    result.success(range)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "flipHorizontally" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exif.flipHorizontally()
                    exif.saveAttributes()
                    result.success(tmpFile.readBytes())
                    tmpFile.delete()
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "flipHorizontally" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exif.flipVertically()
                    exif.saveAttributes()
                    result.success(tmpFile.readBytes())
                    tmpFile.delete()
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getAltitude" -> {
                val defaultValue = call.argument<Double>("defaultValue")
                if (defaultValue == null) {
                    result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                    return
                }

                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.getAltitude(defaultValue)
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getLatLong" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.latLong)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getRotationDegrees" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.rotationDegrees)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnail" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.thumbnail)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnailBytes" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.thumbnailBytes)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnailBytes" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.thumbnailBytes)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnailRange" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.thumbnailRange)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "hasAttribute" -> {
                try {
                    val (bytes, tag) = getImageAndTag(call)
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.hasAttribute(tag))
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "hasThumbnail" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.hasThumbnail())
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "isFlipped" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.isFlipped)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "isSupportedMimeType" -> {
                try {
                    val mimeType = call.arguments<String>()
                    result.success(ExifInterface.isSupportedMimeType(mimeType))
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "isThumbnailCompressed" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    result.success(exif.isThumbnailCompressed)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "resetOrientation" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exif.resetOrientation()
                    exif.saveAttributes()
                    result.success(tmpFile.readBytes())
                    tmpFile.delete()
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "rotate" -> {
                val degree = call.argument<Int>("degree")
                if (degree == null) {
                    result.error("ARGUMENT_ERROR", "degree is required", null)
                    return
                }
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exif.rotate(degree)
                    exif.saveAttributes()
                    result.success(tmpFile.readBytes())
                    tmpFile.delete()
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "setLatLong" -> {
                val latitude = call.argument<Double>("latitude")
                if (latitude == null) {
                    result.error("ARGUMENT_ERROR", "latitude is required", null)
                    return
                }

                val longitude = call.argument<Double>("longitude")
                if (longitude == null) {
                    result.error("ARGUMENT_ERROR", "longitude is required", null)
                    return
                }

                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exif.setLatLong(latitude, longitude)
                    exif.saveAttributes()
                    result.success(tmpFile.readBytes())
                    tmpFile.delete()
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
