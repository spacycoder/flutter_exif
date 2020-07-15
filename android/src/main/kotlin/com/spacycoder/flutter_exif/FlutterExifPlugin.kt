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
            channel.setMethodCallHandler(FlutterExifPlugin())

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
                    val tagValue = exif.latLong
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getRotationDegrees" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.rotationDegrees
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnail" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.thumbnail
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnailBytes" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.thumbnailBytes
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnailBytes" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.thumbnailBytes
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnailRange" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.thumbnailRange
                    result.success(tagValue)
                } catch (e: IllegalArgumentException) {
                    return result.error("ARGUMENT_ERROR", e.message, null)
                }
            }
            "getThumbnailRange" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                            ?: throw IllegalArgumentException("Image argument is required")
                    val exif = ExifInterface(bytes.inputStream())
                    val tagValue = exif.thumbnailRange
                    result.success(tagValue)
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
