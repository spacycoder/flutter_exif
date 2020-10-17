// The following code and documentation is taken from https://developer.android.com/reference/androidx/exifinterface/media/ExifInterface

import 'dart:typed_data';

/// Constants used for the Orientation Exif tag.
const int ORIENTATION_UNDEFINED = 0;
const int ORIENTATION_NORMAL = 1;

///
/// Indicates the image is left right reversed mirror.
///
const int ORIENTATION_FLIP_HORIZONTAL = 2;

///
/// Indicates the image is rotated by 180 degree clockwise.
///
const int ORIENTATION_ROTATE_180 = 3;

///
/// Indicates the image is upside down mirror, it can also be represented by flip
/// horizontally firstly and rotate 180 degree clockwise.
///
const int ORIENTATION_FLIP_VERTICAL = 4;

///
/// Indicates the image is flipped about top-left <--> bottom-right axis, it can also be
/// represented by flip horizontally firstly and rotate 270 degree clockwise.
///
const int ORIENTATION_TRANSPOSE = 5;

///
/// Indicates the image is rotated by 90 degree clockwise.
///
const int ORIENTATION_ROTATE_90 = 6;

///
/// Indicates the image is flipped about top-right <--> bottom-left axis, it can also be
/// represented by flip horizontally firstly and rotate 90 degree clockwise.
///
const int ORIENTATION_TRANSVERSE = 7;

///
/// Indicates the image is rotated by 270 degree clockwise.
///
const int ORIENTATION_ROTATE_270 = 8;

///
/// The constant used by [TAG_PLANAR_CONFIGURATION] to denote Chunky format.
///
const int FORMAT_CHUNKY = 1;

///
/// The constant used by [TAG_PLANAR_CONFIGURATION] to denote Planar format.
///
const int FORMAT_PLANAR = 2;

///
/// The constant used by [TAG_Y_CB_CR_POSITIONING] to denote Centered positioning.
///
const int Y_CB_CR_POSITIONING_CENTERED = 1;

///
/// The constant used by [TAG_Y_CB_CR_POSITIONING] to denote Co-sited positioning.
///
const int Y_CB_CR_POSITIONING_CO_SITED = 2;

///
/// The constant used to denote resolution unit as inches.
///
const int RESOLUTION_UNIT_INCHES = 2;

///
/// The constant used to denote resolution unit as centimeters.
///
const int RESOLUTION_UNIT_CENTIMETERS = 3;

///
/// The constant used by [TAG_COLOR_SPACE] to denote sRGB color space.
///
const int COLOR_SPACE_S_RGB = 1;

///
/// The constant used by [TAG_COLOR_SPACE] to denote Uncalibrated.
///
const int COLOR_SPACE_UNCALIBRATED = 65535;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is not defined.
///
const int EXPOSURE_PROGRAM_NOT_DEFINED = 0;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is Manual.
///
const int EXPOSURE_PROGRAM_MANUAL = 1;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is Normal.
///
const int EXPOSURE_PROGRAM_NORMAL = 2;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is
/// Aperture priority.
///
const int EXPOSURE_PROGRAM_APERTURE_PRIORITY = 3;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is
/// Shutter priority.
///
const int EXPOSURE_PROGRAM_SHUTTER_PRIORITY = 4;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is Creative
/// program (biased toward depth of field).
///
const int EXPOSURE_PROGRAM_CREATIVE = 5;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is Action
/// program (biased toward fast shutter speed).
///
const int EXPOSURE_PROGRAM_ACTION = 6;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is Portrait
/// mode (for closeup photos with the background out of focus).
///
const int EXPOSURE_PROGRAM_PORTRAIT_MODE = 7;

///
/// The constant used by [TAG_EXPOSURE_PROGRAM] to denote exposure program is Landscape
/// mode (for landscape photos with the background in focus).
///
const int EXPOSURE_PROGRAM_LANDSCAPE_MODE = 8;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is unknown.
///
const int SENSITIVITY_TYPE_UNKNOWN = 0;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is Standard
/// output sensitivity (SOS).
///
const int SENSITIVITY_TYPE_SOS = 1;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is Recommended
/// exposure index (REI).
///
const int SENSITIVITY_TYPE_REI = 2;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is ISO speed.
///
const int SENSITIVITY_TYPE_ISO_SPEED = 3;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is Standard
/// output sensitivity (SOS) and recommended exposure index (REI).
///
const int SENSITIVITY_TYPE_SOS_AND_REI = 4;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is Standard
/// output sensitivity (SOS) and ISO speed.
///
const int SENSITIVITY_TYPE_SOS_AND_ISO = 5;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is Recommended
/// exposure index (REI) and ISO speed.
///
const int SENSITIVITY_TYPE_REI_AND_ISO = 6;

///
/// The constant used by [TAG_SENSITIVITY_TYPE] to denote sensitivity type is Standard
/// output sensitivity (SOS) and recommended exposure index (REI) and ISO speed.
///
const int SENSITIVITY_TYPE_SOS_AND_REI_AND_ISO = 7;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is unknown.
///
const int METERING_MODE_UNKNOWN = 0;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is Average.
///
const int METERING_MODE_AVERAGE = 1;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is
/// CenterWeightedAverage.
///
const int METERING_MODE_CENTER_WEIGHT_AVERAGE = 2;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is Spot.
///
const int METERING_MODE_SPOT = 3;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is MultiSpot.
///
const int METERING_MODE_MULTI_SPOT = 4;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is Pattern.
///
const int METERING_MODE_PATTERN = 5;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is Partial.
///
const int METERING_MODE_PARTIAL = 6;

///
/// The constant used by [TAG_METERING_MODE] to denote metering mode is other.
///
const int METERING_MODE_OTHER = 255;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is unknown.
///
const int LIGHT_SOURCE_UNKNOWN = 0;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Daylight.
///
const int LIGHT_SOURCE_DAYLIGHT = 1;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Fluorescent.
///
const int LIGHT_SOURCE_FLUORESCENT = 2;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Tungsten
/// (incandescent light).
///
const int LIGHT_SOURCE_TUNGSTEN = 3;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Flash.
///
const int LIGHT_SOURCE_FLASH = 4;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Fine weather.
///
const int LIGHT_SOURCE_FINE_WEATHER = 9;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Cloudy weather.
///
const int LIGHT_SOURCE_CLOUDY_WEATHER = 10;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Shade.
///
const int LIGHT_SOURCE_SHADE = 11;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Daylight fluorescent
/// (D 5700 - 7100K).
///
const int LIGHT_SOURCE_DAYLIGHT_FLUORESCENT = 12;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Day white
/// fluorescent (N 4600 - 5500K).
///
const int LIGHT_SOURCE_DAY_WHITE_FLUORESCENT = 13;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Cool white
/// fluorescent (W 3800 - 4500K).
///
const int LIGHT_SOURCE_COOL_WHITE_FLUORESCENT = 14;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is White fluorescent
/// (WW 3250 - 3800K).
///
const int LIGHT_SOURCE_WHITE_FLUORESCENT = 15;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Warm white
/// fluorescent (L 2600 - 3250K).
///
const int LIGHT_SOURCE_WARM_WHITE_FLUORESCENT = 16;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Standard light A.
///
const int LIGHT_SOURCE_STANDARD_LIGHT_A = 17;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Standard light B.
///
const int LIGHT_SOURCE_STANDARD_LIGHT_B = 18;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is Standard light C.
///
const int LIGHT_SOURCE_STANDARD_LIGHT_C = 19;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is D55.
///
const int LIGHT_SOURCE_D55 = 20;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is D65.
///
const int LIGHT_SOURCE_D65 = 21;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is D75.
///
const int LIGHT_SOURCE_D75 = 22;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is D50.
///
const int LIGHT_SOURCE_D50 = 23;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is ISO studio tungsten.
///
const int LIGHT_SOURCE_ISO_STUDIO_TUNGSTEN = 24;

///
/// The constant used by [TAG_LIGHT_SOURCE] to denote light source is other.
///
const int LIGHT_SOURCE_OTHER = 255;

///
/// The flag used by [TAG_FLASH] to indicate whether the flash is fired.
/// "00000001"
const int FLAG_FLASH_FIRED = 1;

///
/// The flag used by [TAG_FLASH] to indicate strobe return light is not detected.
/// "00000100"
const int FLAG_FLASH_RETURN_LIGHT_NOT_DETECTED = 4;

///
/// The flag used by [TAG_FLASH] to indicate strobe return light is detected.
/// "00000110"
const int FLAG_FLASH_RETURN_LIGHT_DETECTED = 6;

///
/// The flag used by [TAG_FLASH] to indicate the camera's flash mode is Compulsory flash
/// firing.
///
/// See also [FLAG_FLASH_MODE_COMPULSORY_SUPPRESSION]
/// See also [FLAG_FLASH_MODE_AUTO]
/// "00001000"
const int FLAG_FLASH_MODE_COMPULSORY_FIRING = 8;

///
/// The flag used by [TAG_FLASH] to indicate the camera's flash mode is Compulsory flash
/// suppression.
///
/// See also [FLAG_FLASH_MODE_COMPULSORY_FIRING]
/// See also [FLAG_FLASH_MODE_AUTO]
/// "00010000"
const int FLAG_FLASH_MODE_COMPULSORY_SUPPRESSION = 16;

///
/// The flag used by [TAG_FLASH] to indicate the camera's flash mode is Auto.
///
/// See also [FLAG_FLASH_MODE_COMPULSORY_FIRING]
/// See also [FLAG_FLASH_MODE_COMPULSORY_SUPPRESSION]
/// "00011000"
const int FLAG_FLASH_MODE_AUTO = 24;

///
/// The flag used by [TAG_FLASH] to indicate no flash function is present.
/// "00100000"
const int FLAG_FLASH_NO_FLASH_FUNCTION = 32;

///
/// The flag used by [TAG_FLASH] to indicate red-eye reduction is supported.
/// "01000000"
const int FLAG_FLASH_RED_EYE_SUPPORTED = 64;

///
/// The constant used by [TAG_SENSING_METHOD] to denote the image sensor type is not
/// defined.
///
const int SENSOR_TYPE_NOT_DEFINED = 1;

///
/// The constant used by [TAG_SENSING_METHOD] to denote the image sensor type is One-chip
/// color area sensor.
///
const int SENSOR_TYPE_ONE_CHIP = 2;

///
/// The constant used by [TAG_SENSING_METHOD] to denote the image sensor type is Two-chip
/// color area sensor.
///
const int SENSOR_TYPE_TWO_CHIP = 3;

///
/// The constant used by [TAG_SENSING_METHOD] to denote the image sensor type is
/// Three-chip color area sensor.
///
const int SENSOR_TYPE_THREE_CHIP = 4;

///
/// The constant used by [TAG_SENSING_METHOD] to denote the image sensor type is Color
/// sequential area sensor.
///
const int SENSOR_TYPE_COLOR_SEQUENTIAL = 5;

///
/// The constant used by [TAG_SENSING_METHOD] to denote the image sensor type is Trilinear
/// sensor.
///
const int SENSOR_TYPE_TRILINEAR = 7;

///
/// The constant used by [TAG_SENSING_METHOD] to denote the image sensor type is Color
/// sequential linear sensor.
///
const int SENSOR_TYPE_COLOR_SEQUENTIAL_LINEAR = 8;

///
/// The constant used by [TAG_FILE_SOURCE] to denote the source is other.
///
const int FILE_SOURCE_OTHER = 0;

///
/// The constant used by [TAG_FILE_SOURCE] to denote the source is scanner of transparent
/// type.
///
const int FILE_SOURCE_TRANSPARENT_SCANNER = 1;

///
/// The constant used by [TAG_FILE_SOURCE] to denote the source is scanner of reflex type.
///
const int FILE_SOURCE_REFLEX_SCANNER = 2;

///
/// The constant used by [TAG_FILE_SOURCE] to denote the source is DSC.
///
const int FILE_SOURCE_DSC = 3;

///
/// The constant used by [TAG_SCENE_TYPE] to denote the scene is directly photographed.
///
const int SCENE_TYPE_DIRECTLY_PHOTOGRAPHED = 1;

///
/// The constant used by [TAG_CUSTOM_RENDERED] to denote no special processing is used.
///
const int RENDERED_PROCESS_NORMAL = 0;

///
/// The constant used by [TAG_CUSTOM_RENDERED] to denote special processing is used.
///
const int RENDERED_PROCESS_CUSTOM = 1;

///
/// The constant used by [TAG_EXPOSURE_MODE] to denote the exposure mode is Auto.
///
const int EXPOSURE_MODE_AUTO = 0;

///
/// The constant used by [TAG_EXPOSURE_MODE] to denote the exposure mode is Manual.
///
const int EXPOSURE_MODE_MANUAL = 1;

///
/// The constant used by [TAG_EXPOSURE_MODE] to denote the exposure mode is Auto bracket.
///
const int EXPOSURE_MODE_AUTO_BRACKET = 2;

///
/// The constant used by [TAG_WHITE_BALANCE] to denote the white balance is Auto.
///
const int WHITE_BALANCE_AUTO = 0;

///
/// The constant used by [TAG_WHITE_BALANCE] to denote the white balance is Manual.
///
const int WHITE_BALANCE_MANUAL = 1;

///
/// The constant used by [TAG_SCENE_CAPTURE_TYPE] to denote the scene capture type is
/// Standard.
///
const int SCENE_CAPTURE_TYPE_STANDARD = 0;

///
/// The constant used by [TAG_SCENE_CAPTURE_TYPE] to denote the scene capture type is
/// Landscape.
///
const int SCENE_CAPTURE_TYPE_LANDSCAPE = 1;

///
/// The constant used by [TAG_SCENE_CAPTURE_TYPE] to denote the scene capture type is
/// Portrait.
///
const int SCENE_CAPTURE_TYPE_PORTRAIT = 2;

///
/// The constant used by [TAG_SCENE_CAPTURE_TYPE] to denote the scene capture type is
/// Night scene.
///
const int SCENE_CAPTURE_TYPE_NIGHT = 3;

///
/// The constant used by [TAG_GAIN_CONTROL] to denote none gain adjustment.
///
const int GAIN_CONTROL_NONE = 0;

///
/// The constant used by [TAG_GAIN_CONTROL] to denote low gain up.
///
const int GAIN_CONTROL_LOW_GAIN_UP = 1;

///
/// The constant used by [TAG_GAIN_CONTROL] to denote high gain up.
///
const int GAIN_CONTROL_HIGH_GAIN_UP = 2;

///
/// The constant used by [TAG_GAIN_CONTROL] to denote low gain down.
///
const int GAIN_CONTROL_LOW_GAIN_DOWN = 3;

///
/// The constant used by [TAG_GAIN_CONTROL] to denote high gain down.
///
const int GAIN_CONTROL_HIGH_GAIN_DOWN = 4;

///
/// The constant used by [TAG_CONTRAST] to denote normal contrast.
///
const int CONTRAST_NORMAL = 0;

///
/// The constant used by [TAG_CONTRAST] to denote soft contrast.
///
const int CONTRAST_SOFT = 1;

///
/// The constant used by [TAG_CONTRAST] to denote hard contrast.
///
const int CONTRAST_HARD = 2;

///
/// The constant used by [TAG_SATURATION] to denote normal saturation.
///
const int SATURATION_NORMAL = 0;

///
/// The constant used by [TAG_SATURATION] to denote low saturation.
///
const int SATURATION_LOW = 0;

///
/// The constant used by [TAG_SHARPNESS] to denote high saturation.
///
const int SATURATION_HIGH = 0;

///
/// The constant used by [TAG_SHARPNESS] to denote normal sharpness.
///
const int SHARPNESS_NORMAL = 0;

///
/// The constant used by [TAG_SHARPNESS] to denote soft sharpness.
///
const int SHARPNESS_SOFT = 1;

///
/// The constant used by [TAG_SHARPNESS] to denote hard sharpness.
///
const int SHARPNESS_HARD = 2;

///
/// The constant used by [TAG_SUBJECT_DISTANCE_RANGE] to denote the subject distance range
/// is unknown.
///
const int SUBJECT_DISTANCE_RANGE_UNKNOWN = 0;

///
/// The constant used by [TAG_SUBJECT_DISTANCE_RANGE] to denote the subject distance range
/// is Macro.
///
const int SUBJECT_DISTANCE_RANGE_MACRO = 1;

///
/// The constant used by [TAG_SUBJECT_DISTANCE_RANGE] to denote the subject distance range
/// is Close view.
///
const int SUBJECT_DISTANCE_RANGE_CLOSE_VIEW = 2;

///
/// The constant used by [TAG_SUBJECT_DISTANCE_RANGE] to denote the subject distance range
/// is Distant view.
///
const int SUBJECT_DISTANCE_RANGE_DISTANT_VIEW = 3;

///
/// The constant used by GPS latitude-related tags to denote the latitude is North latitude.
///
/// See also [TAG_GPS_LATITUDE_REF]
/// See also [TAG_GPS_DEST_LATITUDE_REF]
///
const String LATITUDE_NORTH = "N";

///
/// The constant used by GPS latitude-related tags to denote the latitude is South latitude.
///
/// See also [TAG_GPS_LATITUDE_REF]
/// See also [TAG_GPS_DEST_LATITUDE_REF]
///
const String LATITUDE_SOUTH = "S";

///
/// The constant used by GPS longitude-related tags to denote the longitude is East longitude.
///
/// See also [TAG_GPS_LONGITUDE_REF]
/// See also [TAG_GPS_DEST_LONGITUDE_REF]
///
const String LONGITUDE_EAST = "E";

///
/// The constant used by GPS longitude-related tags to denote the longitude is West longitude.
///
/// See also [TAG_GPS_LONGITUDE_REF]
/// See also [TAG_GPS_DEST_LONGITUDE_REF]
///
const String LONGITUDE_WEST = "W";

///
/// The constant used by [TAG_GPS_ALTITUDE_REF] to denote the altitude is above sea level.
///
const int ALTITUDE_ABOVE_SEA_LEVEL = 0;

///
/// The constant used by [TAG_GPS_ALTITUDE_REF] to denote the altitude is below sea level.
///
const int ALTITUDE_BELOW_SEA_LEVEL = 1;

///
/// The constant used by [TAG_GPS_STATUS] to denote GPS measurement is in progress.
///
const String GPS_MEASUREMENT_IN_PROGRESS = "A";

///
/// The constant used by [TAG_GPS_STATUS] to denote GPS measurement is interrupted.
///
const String GPS_MEASUREMENT_INTERRUPTED = "V";

///
/// The constant used by [TAG_GPS_MEASURE_MODE] to denote GPS measurement is
/// 2-dimensional.
///
const String GPS_MEASUREMENT_2D = "2";

///
/// The constant used by [TAG_GPS_MEASURE_MODE] to denote GPS measurement is
/// 3-dimensional.
///
const String GPS_MEASUREMENT_3D = "3";

///
/// The constant used by [TAG_GPS_SPEED_REF] to denote the speed unit is kilometers per
/// hour.
///
const String GPS_SPEED_KILOMETERS_PER_HOUR = "K";

///
/// The constant used by [TAG_GPS_SPEED_REF] to denote the speed unit is miles per hour.
///
const String GPS_SPEED_MILES_PER_HOUR = "M";

///
/// The constant used by [TAG_GPS_SPEED_REF] to denote the speed unit is knots.
///
const String GPS_SPEED_KNOTS = "N";

///
/// The constant used by GPS attributes to denote the direction is true direction.
///
const String GPS_DIRECTION_TRUE = "T";

///
/// The constant used by GPS attributes to denote the direction is magnetic direction.
///
const String GPS_DIRECTION_MAGNETIC = "M";

///
/// The constant used by [TAG_GPS_DEST_DISTANCE_REF] to denote the distance unit is
/// kilometers.
///
const String GPS_DISTANCE_KILOMETERS = "K";

///
/// The constant used by [TAG_GPS_DEST_DISTANCE_REF] to denote the distance unit is miles.
///
const String GPS_DISTANCE_MILES = "M";

///
/// The constant used by [TAG_GPS_DEST_DISTANCE_REF] to denote the distance unit is
/// nautical miles.
///
const String GPS_DISTANCE_NAUTICAL_MILES = "N";

///
/// The constant used by [TAG_GPS_DIFFERENTIAL] to denote no differential correction is
/// applied.
///
const int GPS_MEASUREMENT_NO_DIFFERENTIAL = 0;

///
/// The constant used by [TAG_GPS_DIFFERENTIAL] to denote differential correction is
/// applied.
///
const int GPS_MEASUREMENT_DIFFERENTIAL_CORRECTED = 1;

///
/// The constant used by [TAG_COMPRESSION] to denote the image is not compressed.
///
const int DATA_UNCOMPRESSED = 1;

///
/// The constant used by [TAG_COMPRESSION] to denote the image is huffman compressed.
///
const int DATA_HUFFMAN_COMPRESSED = 2;

///
/// The constant used by [TAG_COMPRESSION] to denote the image is JPEG.
///
const int DATA_JPEG = 6;

///
/// The constant used by [TAG_COMPRESSION], see DNG Specification 1.4.0.0.
/// Section 3, Compression
///
const int DATA_JPEG_COMPRESSED = 7;

///
/// The constant used by [TAG_COMPRESSION], see DNG Specification 1.4.0.0.
/// Section 3, Compression
///
const int DATA_DEFLATE_ZIP = 8;

///
/// The constant used by [TAG_COMPRESSION] to denote the image is pack-bits compressed.
///
const int DATA_PACK_BITS_COMPRESSED = 32773;

///
/// The constant used by [TAG_COMPRESSION], see DNG Specification 1.4.0.0.
/// Section 3, Compression
///
const int DATA_LOSSY_JPEG = 34892;

///
/// The constant used by [TAG_BITS_PER_SAMPLE].
/// See JEITA CP-3451C Spec Section 6, Differences from Palette Color Images
///
// ignore: non_constant_identifier_names
final Int32List BITS_PER_SAMPLE_RGB = Int32List.fromList([8, 8, 8]);

///
/// The constant used by [TAG_BITS_PER_SAMPLE].
/// See JEITA CP-3451C Spec Section 4, Differences from Bilevel Images
///
// ignore: non_constant_identifier_names
final Int32List BITS_PER_SAMPLE_GREYSCALE_1 = Int32List.fromList([4]);

///
/// The constant used by [TAG_BITS_PER_SAMPLE].
/// See JEITA CP-3451C Spec Section 4, Differences from Bilevel Images
///
// ignore: non_constant_identifier_names
final Int32List BITS_PER_SAMPLE_GREYSCALE_2 = Int32List.fromList([8]);

///
/// The constant used by [TAG_PHOTOMETRIC_INTERPRETATION].
///
const int PHOTOMETRIC_INTERPRETATION_WHITE_IS_ZERO = 0;

///
/// The constant used by [TAG_PHOTOMETRIC_INTERPRETATION].
///
const int PHOTOMETRIC_INTERPRETATION_BLACK_IS_ZERO = 1;

///
/// The constant used by [TAG_PHOTOMETRIC_INTERPRETATION].
///
const int PHOTOMETRIC_INTERPRETATION_RGB = 2;

///
/// The constant used by [TAG_PHOTOMETRIC_INTERPRETATION].
///
const int PHOTOMETRIC_INTERPRETATION_YCBCR = 6;

///
/// The constant used by [TAG_NEW_SUBFILE_TYPE]. See JEITA CP-3451C Spec Section 8.
///
const int ORIGINAL_RESOLUTION_IMAGE = 0;

///
/// The constant used by [TAG_NEW_SUBFILE_TYPE]. See JEITA CP-3451C Spec Section 8.
///
const int REDUCED_RESOLUTION_IMAGE = 1;

///
/// Constant used to indicate that the input stream contains the full image data.
/// <p>
/// The format of the image data should follow one of the image formats supported by this class.
///
const int STREAM_TYPE_FULL_IMAGE_DATA = 0;

///
/// Constant used to indicate that the input stream contains only Exif data.
///
/// The format of the Exif-only data must follow the below structure:
///     Exif Identifier Code ("Exif\0\0") + TIFF header + IFD data
/// See JEITA CP-3451C Section 4.5.2 and 4.5.4 specifications for more details.
///
const int STREAM_TYPE_EXIF_DATA_ONLY = 1;
