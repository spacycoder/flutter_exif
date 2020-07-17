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
    private var exifInterface: ExifInterface? = null
    private var currentImage: File? = null

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
            "initPath" -> {
                try {
                    val path = call.arguments<String>()
                    if (path == null) {
                        result.error("ARGUMENT_ERROR", "image path is required", null)
                        return
                    }

                    currentImage = File(path)
                    if(!currentImage!!.exists()) {
                        return result.error("INVALID_PATH", "unable to find image at path", null)
                    }

                    exifInterface = ExifInterface(currentImage!!)
                    result.success(true)
                } catch (e: Exception) {
                    return result.error("ERROR", e.message, null)
                }
            }
            "initBytes" -> {
                try {
                    val bytes = call.arguments<ByteArray>()
                    if (bytes == null) {
                        result.error("ARGUMENT_ERROR", "tagValue is required", null)
                        return
                    }
                    val (exif, tmpFile) = getExifInterfaceAndFile(bytes)
                    exifInterface = exif
                    currentImage = tmpFile
                    result.success(true)
                } catch (e: Exception) {
                    return result.error("ERROR", e.message, null)
                }
            }
            "saveAttributes" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                try {
                    exifInterface?.saveAttributes()
                    result.success(true)
                } catch (e: Exception) {
                    return result.error("EXIF_ERROR", e.message, null)
                }
            }
            "getImageData" -> {
                if (currentImage == null) {
                    return result.error("EXIF_ERROR", "image not initialized", null)
                }
                    result.success(currentImage!!.readBytes())
            }
            "setAttribute" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val tag = call.argument<String>("tag")
                if (tag == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                val tagValue = call.argument<String>("tagValue")
                if (tagValue == null) {
                    result.error("ARGUMENT_ERROR", "tagValue is required", null)
                    return
                }


                exifInterface?.setAttribute(tag, tagValue)
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
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val tag = call.arguments<String>()
                if (tag == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                result.success(exifInterface?.getAttribute(tag))
            }
            "getAttributeDouble" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val tag = call.arguments<String>()
                if (tag == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                val defaultValue = call.argument<Double>("defaultValue")
                if (defaultValue == null) {
                    result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                    return
                }

                val tagValue = exifInterface?.getAttributeDouble(tag, defaultValue)
                result.success(tagValue)
            }
            "getAttributeInt" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val tag = call.arguments<String>()
                if (tag == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                val defaultValue = call.argument<Int>("defaultValue")
                if (defaultValue == null) {
                    result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                    return
                }

                val tagValue = exifInterface?.getAttributeInt(tag, defaultValue)
                result.success(tagValue)
            }
            "getAttributeRange" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val tag = call.arguments<String>()
                if (tag == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                result.success(exifInterface?.getAttributeRange(tag))
            }
            "flipHorizontally" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }
                exifInterface?.flipHorizontally()
            }
            "flipVertically" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }
                exifInterface?.flipVertically()
            }
            "getAltitude" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val defaultValue = call.arguments<Double>()
                if (defaultValue == null) {
                    result.error("ARGUMENT_ERROR", "defaultValue is required", null)
                    return
                }

                val tagValue = exifInterface?.getAltitude(defaultValue)
                result.success(tagValue)
            }
            "getLatLong" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                result.success(exifInterface?.latLong)
            }
            "getRotationDegrees" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                result.success(exifInterface?.rotationDegrees)
            }
            "getThumbnail" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                result.success(exifInterface?.thumbnail)
            }
            "getThumbnailBytes" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                result.success(exifInterface?.thumbnailBytes)
            }
            "getThumbnailRange" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                result.success(exifInterface?.thumbnailRange)
            }
            "hasAttribute" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val tag = call.arguments<String>()
                if (tag == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                result.success(exifInterface?.hasAttribute(tag))
            }
            "hasThumbnail" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                result.success(exifInterface?.hasThumbnail())
            }
            "isThumbnailCompressed" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }
                result.success(exifInterface?.isThumbnailCompressed)
            }
            "isFlipped" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }
                result.success(exifInterface?.isFlipped)
            }
            "isSupportedMimeType" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val mimeType = call.arguments<String>()
                if (mimeType == null) {
                    result.error("ARGUMENT_ERROR", "tag is required", null)
                    return
                }

                result.success(ExifInterface.isSupportedMimeType(mimeType))
            }
            "resetOrientation" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                exifInterface?.resetOrientation()
            }
            "rotate" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }
                val degree = call.arguments<Int>()
                if (degree == null) {
                    return result.error("ARGUMENT_ERROR", "degree is required", null)
                }
                exifInterface?.rotate(degree)
            }
            "setLatLong" -> {
                if (exifInterface == null) {
                    return result.error("EXIF_ERROR", "exif not initialized", null)
                }

                val latitude = call.argument<Double>("latitude")
                if (latitude == null) {
                    return result.error("ARGUMENT_ERROR", "latitude is required", null)
                }

                val longitude = call.argument<Double>("longitude")
                if (longitude == null) {
                    return result.error("ARGUMENT_ERROR", "longitude is required", null)
                }

                try {
                    exifInterface?.setLatLong(latitude, longitude)
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
