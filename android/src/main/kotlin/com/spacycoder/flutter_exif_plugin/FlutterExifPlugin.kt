package com.spacycoder.flutter_exif_plugin

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


const val flutter_exif_plugin_CHANNEL = "flutter_exif_plugin_channel"

/** FlutterExifPlugin */
public class FlutterExifPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private var exifInterface: ExifInterface? = null
    private var currentImage: File? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, flutter_exif_plugin_CHANNEL)
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), flutter_exif_plugin_CHANNEL)
            val instance = FlutterExifPlugin()
            channel.setMethodCallHandler(instance)
            instance.context = registrar.context()
        }
    }

    private fun getExifInterfaceAndFile(bytes: ByteArray): Pair<ExifInterface, File> {
        val tmpFile = File.createTempFile("flutter_exif_plugin_image", null, context.cacheDir)
        tmpFile.writeBytes(bytes)

        return Pair(ExifInterface(tmpFile), tmpFile)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "initPath" -> {
                try {
                    val path = call.arguments<String>()
                    if (path == null) {
                        return result.error("ARGUMENT_ERROR", "image path is required", null)
                    }

                    currentImage = File(path)
                    if (!currentImage!!.exists()) {
                        return result.error("INVALID_PATH", "unable to find image at path", null)
                    }

                    exifInterface = ExifInterface(currentImage!!)
                    return result.success(true)
                } catch (e: Exception) {
                    return result.error("ERROR", e.message, null)
                }
            }
            "initBytes" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                    if (bytes == null) {
                        return result.error("ARGUMENT_ERROR", "tagValue is required", null)
                    }
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exifInterface = exif
                    currentImage = tmpFile
                    return result.success(true)
                } catch (e: Exception) {
                    return result.error("ERROR", e.message, null)
                }
            }
            "isSupportedMimeType" -> {
                val mimeType = call.arguments<String>()
                if (mimeType == null) {
                    return result.error("ARGUMENT_ERROR", "tag is required", null)
                }

                return result.success(ExifInterface.isSupportedMimeType(mimeType))
            }
        }


        if (exifInterface == null) {
            return result.error("EXIF_ERROR", "exif not initialized", null)
        }
        val exif = exifInterface!!

        when (call.method) {
            "saveAttributes" -> {
                try {
                    exif.saveAttributes()
                    result.success(true)
                } catch (e: Exception) {
                    return result.error("EXIF_ERROR", e.message, null)
                }
            }
            "getImageData" -> {
                if (currentImage == null) {
                    return result.error("EXIF_ERROR", "image not initialized", null)
                }
                result.success(currentImage?.readBytes())
            }
            "setAttribute" -> {
                val tag = call.argument<String>("tag")
                if (tag == null) {
                    return result.error("ARGUMENT_ERROR", "tag is required", null)
                }

                val tagValue = call.argument<String>("tagValue")
                if (tagValue == null) {
                    return result.error("ARGUMENT_ERROR", "tagValue is required", null)
                }

                exif.setAttribute(tag, tagValue)
                result.success(true)
            }
            "getAttribute" -> {
                val tag = call.arguments<String>()
                if (tag == null) {
                    return result.error("ARGUMENT_ERROR", "tag is required", null)
                }

                result.success(exif.getAttribute(tag))
            }
            "getAttributeDouble" -> {
                val tag = call.arguments<String>()
                if (tag == null) {
                    return result.error("ARGUMENT_ERROR", "tag is required", null)

                }

                val defaultValue = call.argument<Double>("defaultValue")
                if (defaultValue == null) {
                    return result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                }

                val tagValue = exif.getAttributeDouble(tag, defaultValue)
                result.success(tagValue)
            }
            "getAttributeInt" -> {
                val tag = call.arguments<String>()
                if (tag == null) {
                    return result.error("ARGUMENT_ERROR", "tag is required", null)
                }

                val defaultValue = call.argument<Int>("defaultValue")
                if (defaultValue == null) {
                    return result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                }

                val tagValue = exif.getAttributeInt(tag, defaultValue)
                result.success(tagValue)
            }
            "getAttributeRange" -> {
                val tag = call.arguments<String>()
                if (tag == null) {
                    return result.error("ARGUMENT_ERROR", "tag is required", null)
                }

                result.success(exif.getAttributeRange(tag))
            }
            "flipHorizontally" -> {
                exif.flipHorizontally()
                result.success(true)
            }
            "flipVertically" -> {
                exif.flipVertically()
                result.success(true)
            }
            "getAltitude" -> {
                val defaultValue = call.arguments<Double>()
                if (defaultValue == null) {
                    return result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                }

                val tagValue = exif.getAltitude(defaultValue)
                result.success(tagValue)
            }
            "getLatLong" -> {
                result.success(exif.latLong)
            }
            "getRotationDegrees" -> {
                result.success(exif.rotationDegrees)
            }
            "getThumbnail" -> {
                result.success(exif.thumbnail)
            }
            "getThumbnailBytes" -> {
                result.success(exif.thumbnailBytes)
            }
            "getThumbnailRange" -> {
                result.success(exif.thumbnailRange)
            }
            "hasAttribute" -> {
                val tag = call.arguments<String>()
                if (tag == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                result.success(exif.hasAttribute(tag))
            }
            "hasThumbnail" -> {
                result.success(exif.hasThumbnail())
            }
            "isThumbnailCompressed" -> {
                result.success(exif.isThumbnailCompressed)
            }
            "isFlipped" -> {
                result.success(exif.isFlipped)
            }

            "resetOrientation" -> {
                exif.resetOrientation()
                result.success(true)
            }
            "rotate" -> {
                val degree = call.arguments<Int>()
                if (degree == null) {
                    return result.error("ARGUMENT_ERROR", "degree is required", null)
                }
                exif.rotate(degree)
                result.success(true)
            }
            "setLatLong" -> {
                val latitude = call.argument<Double>("latitude")
                if (latitude == null) {
                    return result.error("ARGUMENT_ERROR", "latitude is required", null)
                }

                val longitude = call.argument<Double>("longitude")
                if (longitude == null) {
                    return result.error("ARGUMENT_ERROR", "longitude is required", null)
                }

                try {
                    exif.setLatLong(latitude, longitude)
                    result.success(true)
                } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
