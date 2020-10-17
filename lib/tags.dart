// The following code and documentation is taken from https://developer.android.com/reference/androidx/exifinterface/media/ExifInterface

// The Exif tag names. See JEITA CP-3451C specifications (Exif 2.3) Section 3-8.

///  The number of columns of image data, equal to the number of pixels per row. In JPEG
///  compressed data, this tag shall not be used because a JPEG marker is used instead of it.
const String TAG_IMAGE_WIDTH = "ImageWidth";

///
///  The number of rows of image data. In JPEG compressed data, this tag shall not be used
///  because a JPEG marker is used instead of it.
const String TAG_IMAGE_LENGTH = "ImageLength";

///
///  The number of bits per image component. In this standard each component of the image is
///  8 bits, so the value for this tag is 8. See also [TAG_SAMPLES_PER_PIXEL]. In JPEG
///  compressed data, this tag shall not be used because a JPEG marker is used instead of it.
///
const String TAG_BITS_PER_SAMPLE = "BitsPerSample";

///
///  The compression scheme used for the image data. When a primary image is JPEG compressed,
///  this designation is not necessary. So, this tag shall not be recorded. When thumbnails use
///  JPEG compression, this tag value is set to 6.
///
///  See also [DATA_UNCOMPRESSED]
///  See also [DATA_JPEG]
///
const String TAG_COMPRESSION = "Compression";

///
///  The pixel composition. In JPEG compressed data, this tag shall not be used because a JPEG
///  marker is used instead of it.
///
const String TAG_PHOTOMETRIC_INTERPRETATION = "PhotometricInterpretation";

///
///  The image orientation viewed in terms of rows and columns.
///
const String TAG_ORIENTATION = "Orientation";

///
///  The number of components per pixel. Since this standard applies to RGB and YCbCr images,
///  the value set for this tag is 3. In JPEG compressed data, this tag shall not be used because
///  a JPEG marker is used instead of it.
///
const String TAG_SAMPLES_PER_PIXEL = "SamplesPerPixel";

///
///  Indicates whether pixel components are recorded in chunky or planar format. In JPEG
///  compressed data, this tag shall not be used because a JPEG marker is used instead of it.
///  If this field does not exist, the TIFF default, [FORMAT_CHUNKY], is assumed.
///
const String TAG_PLANAR_CONFIGURATION = "PlanarConfiguration";

///
///  The sampling ratio of chrominance components in relation to the luminance component.
///  In JPEG compressed data a JPEG marker is used instead of this tag. So, this tag shall not
///  be recorded.
///
const String TAG_Y_CB_CR_SUB_SAMPLING = "YCbCrSubSampling";

///
///  The position of chrominance components in relation to the luminance component. This field
///  is designated only for JPEG compressed data or uncompressed YCbCr data. The TIFF default is
///  [Y_CB_CR_POSITIONING_CENTERED]; but when Y:Cb:Cr = 4:2:2 it is recommended in this
///  standard that [Y_CB_CR_POSITIONING_CO_SITED] be used to record data, in order to
///  improve the image quality when viewed on TV systems. When this field does not exist,
///  the reader shall assume the TIFF default. In the case of Y:Cb:Cr = 4:2:0, the TIFF default
///  ([Y_CB_CR_POSITIONING_CENTERED]) is recommended. If the Exif/DCF reader does not
///  have the capability of supporting both kinds of positioning, it shall follow the TIFF
///  default regardless of the value in this field. It is preferable that readers can support
///  both centered and co-sited positioning.
///
const String TAG_Y_CB_CR_POSITIONING = "YCbCrPositioning";

///
///  The number of pixels per [TAG_RESOLUTION_UNIT] in the [TAG_IMAGE_WIDTH]
///  direction. When the image resolution is unknown, 72 [dpi] shall be designated.
///
const String TAG_X_RESOLUTION = "XResolution";

///
///  The number of pixels per [TAG_RESOLUTION_UNIT] in the [TAG_IMAGE_WIDTH]
///  direction. The same value as [TAG_X_RESOLUTION] shall be designated.
///
const String TAG_Y_RESOLUTION = "YResolution";

///
///  The unit for measuring [TAG_X_RESOLUTION] and [TAG_Y_RESOLUTION]. The same
///  unit is used for both [TAG_X_RESOLUTION] and [TAG_Y_RESOLUTION]. If the image
///  resolution is unknown, [RESOLUTION_UNIT_INCHES] shall be designated.
///
const String TAG_RESOLUTION_UNIT = "ResolutionUnit";
// B. Tags related to recording offset
///
///  For each strip, the byte offset of that strip. It is recommended that this be selected
///  so the number of strip bytes does not exceed 64 KBytes.In the case of JPEG compressed data,
///  this designation is not necessary. So, this tag shall not be recorded.
///
const String TAG_STRIP_OFFSETS = "StripOffsets";

///
///  The number of rows per strip. This is the number of rows in the image of one strip when
///  an image is divided into strips. In the case of JPEG compressed data, this designation is
///  not necessary. So, this tag shall not be recorded.
///
const String TAG_ROWS_PER_STRIP = "RowsPerStrip";

///
///  The total number of bytes in each strip. In the case of JPEG compressed data, this
///  designation is not necessary. So, this tag shall not be recorded.
///
const String TAG_STRIP_BYTE_COUNTS = "StripByteCounts";

///
///  The offset to the start byte (SOI) of JPEG compressed thumbnail data. This shall not be
///  used for primary image JPEG data.
///
const String TAG_JPEG_INTERCHANGE_FORMAT = "JPEGInterchangeFormat";

///
///  The number of bytes of JPEG compressed thumbnail data. This is not used for primary image
///  JPEG data. JPEG thumbnails are not divided but are recorded as a continuous JPEG bitstream
///  from SOI to EOI. APPn and COM markers should not be recorded. Compressed thumbnails shall be
///  recorded in no more than 64 KBytes, including all other data to be recorded in APP1.
///
const String TAG_JPEG_INTERCHANGE_FORMAT_LENGTH = "JPEGInterchangeFormatLength";
// C. Tags related to Image Data Characteristics
///
///  A transfer function for the image, described in tabular style. Normally this tag need not
///  be used, since color space is specified in [TAG_COLOR_SPACE].
///
const String TAG_TRANSFER_FUNCTION = "TransferFunction";

///
///  The chromaticity of the white point of the image. Normally this tag need not be used,
///  since color space is specified in [TAG_COLOR_SPACE].
///
const String TAG_WHITE_POINT = "WhitePoint";

///
///  The chromaticity of the three primary colors of the image. Normally this tag need not
///  be used, since color space is specified in [TAG_COLOR_SPACE].
///
const String TAG_PRIMARY_CHROMATICITIES = "PrimaryChromaticities";

///
///  The matrix coefficients for transformation from RGB to YCbCr image data. About
///  the default value, please refer to JEITA CP-3451C Spec, Annex D.
///
const String TAG_Y_CB_CR_COEFFICIENTS = "YCbCrCoefficients";

///
///  The reference black point value and reference white point value. No defaults are given
///  in TIFF, but the values below are given as defaults here. The color space is declared in
///  a color space information tag, with the default being the value that gives the optimal image
///  characteristics Interoperability these conditions
///
const String TAG_REFERENCE_BLACK_WHITE = "ReferenceBlackWhite";
// D. Other tags
///
///  The date and time of image creation. In this standard it is the date and time the file
///  was changed. The format is "YYYY:MM:DD HH:MM:SS" with time shown in 24-hour format, and
///  the date and time separated by one blank character ({@code 0x20}). When the date and time
///  are unknown, all the character spaces except colons (":") should be filled with blank
///  characters, or else the Interoperability field should be filled with blank characters.
///  The character string length is 20 Bytes including NULL for termination. When the field is
///  left blank, it is treated as unknown.
///
const String TAG_DATETIME = "DateTime";

///
///  An ASCII string giving the title of the image. It is possible to be added a comment
///  such as "1988 company picnic" or the like. Two-byte character codes cannot be used. When
///  a 2-byte code is necessary, [TAG_USER_COMMENT] is to be used.
///
const String TAG_IMAGE_DESCRIPTION = "ImageDescription";

///
///  The manufacturer of the recording equipment. This is the manufacturer of the DSC,
///  scanner, video digitizer or other equipment that generated the image. When the field is left
///  blank, it is treated as unknown.
///
const String TAG_MAKE = "Make";

///
///  The model name or model number of the equipment. This is the model name of number of
///  the DSC, scanner, video digitizer or other equipment that generated the image. When
///  the field is left blank, it is treated as unknown.
///
const String TAG_MODEL = "Model";

///
///  This tag records the name and version of the software or firmware of the camera or image
///  input device used to generate the image. The detailed format is not specified, but it is
///  recommended that the example shown below be followed. When the field is left blank, it is
///  treated as unknown.
///
const String TAG_SOFTWARE = "Software";

///
///  This tag records the name of the camera owner, photographer or image creator.
///  The detailed format is not specified, but it is recommended that the information be written
///  as in the example below for ease of Interoperability. When the field is left blank, it is
///  treated as unknown.
///
const String TAG_ARTIST = "Artist";

///
///  Copyright information. In this standard the tag is used to indicate both the photographer
///  and editor copyrights. It is the copyright notice of the person or organization claiming
///  rights to the image. The Interoperability copyright statement including date and rights
///  should be written in this field; e.g., "Copyright, John Smith, 19xx. All rights reserved."
///  In this standard the field records both the photographer and editor copyrights, with each
///  recorded in a separate part of the statement. When there is a clear distinction between
///  the photographer and editor copyrights, these are to be written in the order of photographer
///  followed by editor copyright, separated by NULL (in this case, since the statement also ends
///  with a NULL, there are two NULL codes) (see example 1). When only the photographer copyright
///  is given, it is terminated by one NULL code (see example 2). When only the editor copyright
///  is given, the photographer copyright part consists of one space followed by a terminating
///  NULL code, then the editor copyright is given (see example 3). When the field is left blank,
///  it is treated as unknown.
///
///
const String TAG_COPYRIGHT = "Copyright";

///  Exif IFD Attribute Information
///  A. Tags related to version
///
///  The version of this standard supported. Nonexistence of this field is taken to mean
///  nonconformance to the standard. In according with conformance to this standard, this tag
///  shall be recorded like "0230” as 4-byte ASCII.
const String TAG_EXIF_VERSION = "ExifVersion";

///
///  The Flashpix format version supported by a FPXR file. If the FPXR function supports
///  Flashpix format Ver. 1.0, this is indicated similarly to [TAG_EXIF_VERSION] by
///  recording "0100" as 4-byte ASCII.
const String TAG_FLASHPIX_VERSION = "FlashpixVersion";

/// B. Tags related to image data characteristics
///
///  The color space information tag is always recorded as the color space specifier.
///  Normally [COLOR_SPACE_S_RGB] is used to define the color space based on the PC
///  monitor conditions and environment. If a color space other than [COLOR_SPACE_S_RGB]
///  is used, [COLOR_SPACE_UNCALIBRATED] is set. Image data recorded as
///  [COLOR_SPACE_UNCALIBRATED] may be treated as [COLOR_SPACE_S_RGB] when it is
///  converted to Flashpix.
const String TAG_COLOR_SPACE = "ColorSpace";

///
///  Indicates the value of coefficient gamma. The formula of transfer function used for image
///  reproduction is expressed as follows.
///
///  (Reproduced value) = (Input value) ^ gamma
///
///  Both reproduced value and input value indicate normalized value, whose minimum value is
///  0 and maximum value is 1.
///
const String TAG_GAMMA = "Gamma";
// C. Tags related to image configuration
///
///  Information specific to compressed data. When a compressed file is recorded, the valid
///  width of the meaningful image shall be recorded in this tag, whether or not there is padding
///  data or a restart marker. This tag shall not exist in an uncompressed file.
///
const String TAG_PIXEL_X_DIMENSION = "PixelXDimension";

///
///  Information specific to compressed data. When a compressed file is recorded, the valid
///  height of the meaningful image shall be recorded in this tag, whether or not there is
///  padding data or a restart marker. This tag shall not exist in an uncompressed file.
///  Since data padding is unnecessary in the vertical direction, the number of lines recorded
///  in this valid image height tag will in fact be the same as that recorded in the SOF.
///
const String TAG_PIXEL_Y_DIMENSION = "PixelYDimension";

///
///  Information specific to compressed data. The channels of each component are arranged
///  in order from the 1st component to the 4th. For uncompressed data the data arrangement is
///  given in the [TAG_PHOTOMETRIC_INTERPRETATION]. However, since
///  [TAG_PHOTOMETRIC_INTERPRETATION] can only express the order of Y, Cb and Cr, this tag
///  is provided for cases when compressed data uses components other than Y, Cb, and Cr and to
///  enable support of other sequences.
///
///      Length = 4
///      Default = 4 5 6 0 (if RGB uncompressed) or 1 2 3 0 (other cases)
///          2 = Cb
///          3 = Cr
///          4 = R
///          5 = G
///          6 = B
///          other = reserved
///
const String TAG_COMPONENTS_CONFIGURATION = "ComponentsConfiguration";

///
///  Information specific to compressed data. The compression mode used for a compressed image
///  is indicated in unit bits per pixel.
///
const String TAG_COMPRESSED_BITS_PER_PIXEL = "CompressedBitsPerPixel";

/// D. Tags related to user information
///
///  A tag for manufacturers of Exif/DCF writers to record any desired information.
///  The contents are up to the manufacturer, but this tag shall not be used for any other than
///  its intended purpose.
///
const String TAG_MAKER_NOTE = "MakerNote";

///
///  A tag for Exif users to write keywords or comments on the image besides those in
///  [TAG_IMAGE_DESCRIPTION], and without the character code limitations of it.
///
const String TAG_USER_COMMENT = "UserComment";

///  E. Tags related to related file information
///
///  This tag is used to record the name of an audio file related to the image data. The only
///  relational information recorded here is the Exif audio file name and extension (an ASCII
///  string consisting of 8 characters + '.' + 3 characters). The path is not recorded.
///
///  When using this tag, audio files shall be recorded in conformance to the Exif audio
///  format. Writers can also store the data such as Audio within APP2 as Flashpix extension
///  stream data. Audio files shall be recorded in conformance to the Exif audio format.
///
const String TAG_RELATED_SOUND_FILE = "RelatedSoundFile";

///  F. Tags related to date and time
///
///  The date and time when the original image data was generated. For a DSC the date and time
///  the picture was taken are recorded. The format is "YYYY:MM:DD HH:MM:SS" with time shown in
///  24-hour format, and the date and time separated by one blank character ({@code 0x20}).
///  When the date and time are unknown, all the character spaces except colons (":") should be
///  filled with blank characters, or else the Interoperability field should be filled with blank
///  characters. When the field is left blank, it is treated as unknown.
///
const String TAG_DATETIME_ORIGINAL = "DateTimeOriginal";

///
///  The date and time when the image was stored as digital data. If, for example, an image
///  was captured by DSC and at the same time the file was recorded, then
///  [TAG_DATETIME_ORIGINAL] and this tag will have the same contents. The format is
///  "YYYY:MM:DD HH:MM:SS" with time shown in 24-hour format, and the date and time separated by
///  one blank character ({@code 0x20}). When the date and time are unknown, all the character
///  spaces except colons (":")should be filled with blank characters, or else
///  the Interoperability field should be filled with blank characters. When the field is left
///  blank, it is treated as unknown.
///
const String TAG_DATETIME_DIGITIZED = "DateTimeDigitized";

///
///  A tag used to record the offset from UTC (the time difference from Universal Time
///  Coordinated including daylight saving time) of the time of DateTime tag. The format when
///  recording the offset is "±HH:MM". The part of "±" shall be recorded as "+" or "-". When
///  the offsets are unknown, all the character spaces except colons (":") should be filled
///  with blank characters, or else the Interoperability field should be filled with blank
///  characters. The character string length is 7 Bytes including NULL for termination. When
///  the field is left blank, it is treated as unknown.
///
const String TAG_OFFSET_TIME = "OffsetTime";

///
///  A tag used to record the offset from UTC (the time difference from Universal Time
///  Coordinated including daylight saving time) of the time of DateTimeOriginal tag. The format
///  when recording the offset is "±HH:MM". The part of "±" shall be recorded as "+" or "-". When
///  the offsets are unknown, all the character spaces except colons (":") should be filled
///  with blank characters, or else the Interoperability field should be filled with blank
///  characters. The character string length is 7 Bytes including NULL for termination. When
///  the field is left blank, it is treated as unknown.
///
const String TAG_OFFSET_TIME_ORIGINAL = "OffsetTimeOriginal";

///
///  A tag used to record the offset from UTC (the time difference from Universal Time
///  Coordinated including daylight saving time) of the time of DateTimeDigitized tag. The format
///  when recording the offset is "±HH:MM". The part of "±" shall be recorded as "+" or "-". When
///  the offsets are unknown, all the character spaces except colons (":") should be filled
///  with blank characters, or else the Interoperability field should be filled with blank
///  characters. The character string length is 7 Bytes including NULL for termination. When
///  the field is left blank, it is treated as unknown.
///
const String TAG_OFFSET_TIME_DIGITIZED = "OffsetTimeDigitized";

///
///  A tag used to record fractions of seconds for [TAG_DATETIME].
///
const String TAG_SUBSEC_TIME = "SubSecTime";

///
///  A tag used to record fractions of seconds for [TAG_DATETIME_ORIGINAL].
///
const String TAG_SUBSEC_TIME_ORIGINAL = "SubSecTimeOriginal";

///
///  A tag used to record fractions of seconds for [TAG_DATETIME_DIGITIZED].
///
const String TAG_SUBSEC_TIME_DIGITIZED = "SubSecTimeDigitized";

/// G. Tags related to picture-taking condition
///
///  Exposure time, given in seconds.
///
const String TAG_EXPOSURE_TIME = "ExposureTime";

///
///  The F number.
///
const String TAG_F_NUMBER = "FNumber";

///
///  TThe class of the program used by the camera to set exposure when the picture is taken.
///  The tag values are as follows.
///
///  See also [EXPOSURE_PROGRAM_NOT_DEFINED]
///  See also [EXPOSURE_PROGRAM_MANUAL]
///  See also [EXPOSURE_PROGRAM_NORMAL]
///  See also [EXPOSURE_PROGRAM_APERTURE_PRIORITY]
///  See also [EXPOSURE_PROGRAM_SHUTTER_PRIORITY]
///  See also [EXPOSURE_PROGRAM_CREATIVE]
///  See also [EXPOSURE_PROGRAM_ACTION]
///  See also [EXPOSURE_PROGRAM_PORTRAIT_MODE]
///  See also [EXPOSURE_PROGRAM_LANDSCAPE_MODE]
///
const String TAG_EXPOSURE_PROGRAM = "ExposureProgram";

///
///  Indicates the spectral sensitivity of each channel of the camera used. The tag value is
///  an ASCII string compatible with the standard developed by the ASTM Technical committee.
///
const String TAG_SPECTRAL_SENSITIVITY = "SpectralSensitivity";

///
///  This tag indicates the sensitivity of the camera or input device when the image was shot.
///  More specifically, it indicates one of the following values that are parameters defined in
///  ISO 12232: standard output sensitivity (SOS), recommended exposure index (REI), or ISO
///  speed. Accordingly, if a tag corresponding to a parameter that is designated by
///  [TAG_SENSITIVITY_TYPE] is recorded, the values of the tag and of this tag are
///  the same. However, if the value is 65535 or higher, the value of this tag shall be 65535.
///  When recording this tag, [TAG_SENSITIVITY_TYPE] should also be recorded. In addition,
///  while “Count = Any”, only 1 count should be used when recording this tag.
///
const String TAG_PHOTOGRAPHIC_SENSITIVITY = "PhotographicSensitivity";

///
///  Indicates the Opto-Electric Conversion Function (OECF) specified in ISO 14524. OECF is
///  the relationship between the camera optical input and the image values.
///
const String TAG_OECF = "OECF";

///
///  This tag indicates which one of the parameters of ISO12232 is
///  [TAG_PHOTOGRAPHIC_SENSITIVITY]} Although it is an optional tag, it should be recorded
///  when [TAG_PHOTOGRAPHIC_SENSITIVITY] is recorded.
///
///  See also [SENSITIVITY_TYPE_UNKNOWN]
///  See also [SENSITIVITY_TYPE_SOS]
///  See also [SENSITIVITY_TYPE_REI]
///  See also [SENSITIVITY_TYPE_ISO_SPEED]
///  See also [SENSITIVITY_TYPE_SOS_AND_REI]
///  See also [SENSITIVITY_TYPE_SOS_AND_ISO]
///  See also [SENSITIVITY_TYPE_REI_AND_ISO]
///  See also [SENSITIVITY_TYPE_SOS_AND_REI_AND_ISO]
///
const String TAG_SENSITIVITY_TYPE = "SensitivityType";

///
///  This tag indicates the standard output sensitivity value of a camera or input device
///  defined in ISO 12232. When recording this tag, [TAG_PHOTOGRAPHIC_SENSITIVITY] and
///  [TAG_SENSITIVITY_TYPE] shall also be recorded.
///
const String TAG_STANDARD_OUTPUT_SENSITIVITY = "StandardOutputSensitivity";

///
///  This tag indicates the recommended exposure index value of a camera or input device
///  defined in ISO 12232. When recording this tag, [TAG_PHOTOGRAPHIC_SENSITIVITY] and
///  [TAG_SENSITIVITY_TYPE] shall also be recorded.
///
const String TAG_RECOMMENDED_EXPOSURE_INDEX = "RecommendedExposureIndex";

///
///  This tag indicates the ISO speed value of a camera or input device that is defined in
///  ISO 12232. When recording this tag, [TAG_PHOTOGRAPHIC_SENSITIVITY] and
///  [TAG_SENSITIVITY_TYPE] shall also be recorded.
///
const String TAG_ISO_SPEED = "ISOSpeed";

///
///  This tag indicates the ISO speed latitude yyy value of a camera or input device that is
///  defined in ISO 12232. However, this tag shall not be recorded without [TAG_ISO_SPEED]
///  and [TAG_ISO_SPEED_LATITUDE_ZZZ].
///
const String TAG_ISO_SPEED_LATITUDE_YYY = "ISOSpeedLatitudeyyy";

///
///  This tag indicates the ISO speed latitude zzz value of a camera or input device that is
///  defined in ISO 12232. However, this tag shall not be recorded without [TAG_ISO_SPEED]
///  and [TAG_ISO_SPEED_LATITUDE_YYY].
///
const String TAG_ISO_SPEED_LATITUDE_ZZZ = "ISOSpeedLatitudezzz";

///
///  Shutter speed. The unit is the APEX setting.
///
const String TAG_SHUTTER_SPEED_VALUE = "ShutterSpeedValue";

///
///  The lens aperture. The unit is the APEX value.
///
const String TAG_APERTURE_VALUE = "ApertureValue";

///
///  The value of brightness. The unit is the APEX value. Ordinarily it is given in the range
///  of -99.99 to 99.99. Note that if the numerator of the recorded value is 0xFFFFFFFF,
///  Unknown shall be indicated.
///
const String TAG_BRIGHTNESS_VALUE = "BrightnessValue";

///
///  The exposure bias. The unit is the APEX value. Ordinarily it is given in the range of
///  -99.99 to 99.99.
///
const String TAG_EXPOSURE_BIAS_VALUE = "ExposureBiasValue";

///
///  The smallest F number of the lens. The unit is the APEX value. Ordinarily it is given
///  in the range of 00.00 to 99.99, but it is not limited to this range.
///
const String TAG_MAX_APERTURE_VALUE = "MaxApertureValue";

///
///  The distance to the subject, given in meters. Note that if the numerator of the recorded
///  value is 0xFFFFFFFF, Infinity shall be indicated; and if the numerator is 0, Distance
///  unknown shall be indicated.
///
const String TAG_SUBJECT_DISTANCE = "SubjectDistance";

///
///  The metering mode.
///
///  See also [METERING_MODE_UNKNOWN]
///  See also [METERING_MODE_AVERAGE]
///  See also [METERING_MODE_CENTER_WEIGHT_AVERAGE]
///  See also [METERING_MODE_SPOT]
///  See also [METERING_MODE_MULTI_SPOT]
///  See also [METERING_MODE_PATTERN]
///  See also [METERING_MODE_PARTIAL]
///  See also [METERING_MODE_OTHER]
///
const String TAG_METERING_MODE = "MeteringMode";

///
///  The kind of light source.
///
///  See also [LIGHT_SOURCE_UNKNOWN]
///  See also [LIGHT_SOURCE_DAYLIGHT]
///  See also [LIGHT_SOURCE_FLUORESCENT]
///  See also [LIGHT_SOURCE_TUNGSTEN]
///  See also [LIGHT_SOURCE_FLASH]
///  See also [LIGHT_SOURCE_FINE_WEATHER]
///  See also [LIGHT_SOURCE_CLOUDY_WEATHER]
///  See also [LIGHT_SOURCE_SHADE]
///  See also [LIGHT_SOURCE_DAYLIGHT_FLUORESCENT]
///  See also [LIGHT_SOURCE_DAY_WHITE_FLUORESCENT]
///  See also [LIGHT_SOURCE_COOL_WHITE_FLUORESCENT]
///  See also [LIGHT_SOURCE_WHITE_FLUORESCENT]
///  See also [LIGHT_SOURCE_WARM_WHITE_FLUORESCENT]
///  See also [LIGHT_SOURCE_STANDARD_LIGHT_A]
///  See also [LIGHT_SOURCE_STANDARD_LIGHT_B]
///  See also [LIGHT_SOURCE_STANDARD_LIGHT_C]
///  See also [LIGHT_SOURCE_D55]
///  See also [LIGHT_SOURCE_D65]
///  See also [LIGHT_SOURCE_D75]
///  See also [LIGHT_SOURCE_D50]
///  See also [LIGHT_SOURCE_ISO_STUDIO_TUNGSTEN]
///  See also [LIGHT_SOURCE_OTHER]
///
const String TAG_LIGHT_SOURCE = "LightSource";

///
///  This tag indicates the status of flash when the image was shot. Bit 0 indicates the flash
///  firing status, bits 1 and 2 indicate the flash return status, bits 3 and 4 indicate
///  the flash mode, bit 5 indicates whether the flash function is present, and bit 6 indicates
///  "red eye" mode.
///
///  See also [FLAG_FLASH_FIRED]
///  See also [FLAG_FLASH_RETURN_LIGHT_NOT_DETECTED]
///  See also [FLAG_FLASH_RETURN_LIGHT_DETECTED]
///  See also [FLAG_FLASH_MODE_COMPULSORY_FIRING]
///  See also [FLAG_FLASH_MODE_COMPULSORY_SUPPRESSION]
///  See also [FLAG_FLASH_MODE_AUTO]
///  See also [FLAG_FLASH_NO_FLASH_FUNCTION]
///  See also [FLAG_FLASH_RED_EYE_SUPPORTED]
///
const String TAG_FLASH = "Flash";

///
///  This tag indicates the location and area of the main subject in the overall scene.
///
///  The subject location and area are defined by Count values as follows.
///
///      Count = 3 The area of the main subject is given as a circle. The circular area is
///                    expressed as center coordinates and diameter. The first value is
///                    the center X coordinate, the second is the center Y coordinate, and
///                    the third is the diameter.
///      Count = 4 The area of the main subject is given as a rectangle. The rectangular
///                    area is expressed as center coordinates and area dimensions. The first
///                    value is the center X coordinate, the second is the center Y coordinate,
///                    the third is the width of the area, and the fourth is the height of
///                    the area.
///
///  Note that the coordinate values, width, and height are expressed in relation to the upper
///  left as origin, prior to rotation processing as per [TAG_ORIENTATION].
///
const String TAG_SUBJECT_AREA = "SubjectArea";

///
///  The actual focal length of the lens, in mm. Conversion is not made to the focal length
///  of a 35mm film camera.
///
const String TAG_FOCAL_LENGTH = "FocalLength";

///
///  Indicates the strobe energy at the time the image is captured, as measured in Beam Candle
///  Power Seconds (BCPS).
///
const String TAG_FLASH_ENERGY = "FlashEnergy";

///
///  This tag records the camera or input device spatial frequency table and SFR values in
///  the direction of image width, image height, and diagonal direction, as specified in
///  ISO 12233.
///
const String TAG_SPATIAL_FREQUENCY_RESPONSE = "SpatialFrequencyResponse";

///
///  Indicates the number of pixels in the image width (X) direction per
///  [TAG_FOCAL_PLANE_RESOLUTION_UNIT] on the camera focal plane.
///
const String TAG_FOCAL_PLANE_X_RESOLUTION = "FocalPlaneXResolution";

///
///  Indicates the number of pixels in the image height (Y) direction per
///  [TAG_FOCAL_PLANE_RESOLUTION_UNIT] on the camera focal plane.
///
const String TAG_FOCAL_PLANE_Y_RESOLUTION = "FocalPlaneYResolution";

///
///  Indicates the unit for measuring [TAG_FOCAL_PLANE_X_RESOLUTION] and
///  [TAG_FOCAL_PLANE_Y_RESOLUTION]. This value is the same as
///  [TAG_RESOLUTION_UNIT].
///
///  See also [TAG_RESOLUTION_UNIT]
///  See also [RESOLUTION_UNIT_INCHES]
///  See also [RESOLUTION_UNIT_CENTIMETERS]
///
const String TAG_FOCAL_PLANE_RESOLUTION_UNIT = "FocalPlaneResolutionUnit";

///
///  Indicates the location of the main subject in the scene. The value of this tag represents
///  the pixel at the center of the main subject relative to the left edge, prior to rotation
///  processing as per [TAG_ORIENTATION]. The first value indicates the X column number
///  and second indicates the Y row number. When a camera records the main subject location,
///  it is recommended that [TAG_SUBJECT_AREA] be used instead of this tag.
///
const String TAG_SUBJECT_LOCATION = "SubjectLocation";

///
///  Indicates the exposure index selected on the camera or input device at the time the image
///  is captured.
///
const String TAG_EXPOSURE_INDEX = "ExposureIndex";

///
///  Indicates the image sensor type on the camera or input device.
///
///  See also [SENSOR_TYPE_NOT_DEFINED]
///  See also [SENSOR_TYPE_ONE_CHIP]
///  See also [SENSOR_TYPE_TWO_CHIP]
///  See also [SENSOR_TYPE_THREE_CHIP]
///  See also [SENSOR_TYPE_COLOR_SEQUENTIAL]
///  See also [SENSOR_TYPE_TRILINEAR]
///  See also [SENSOR_TYPE_COLOR_SEQUENTIAL_LINEAR]
///
const String TAG_SENSING_METHOD = "SensingMethod";

///
///  Indicates the image source. If a DSC recorded the image, this tag value always shall
///  be set to [FILE_SOURCE_DSC].
///
///  [FILE_SOURCE_OTHER]
///  [FILE_SOURCE_TRANSPARENT_SCANNER]
///  [FILE_SOURCE_REFLEX_SCANNER]
///  [FILE_SOURCE_DSC]
///
const String TAG_FILE_SOURCE = "FileSource";

///
///  Indicates the type of scene. If a DSC recorded the image, this tag value shall always
///  be set to [SCENE_TYPE_DIRECTLY_PHOTOGRAPHED].
///
///  See also [SCENE_TYPE_DIRECTLY_PHOTOGRAPHED]
///
const String TAG_SCENE_TYPE = "SceneType";

///
///  Indicates the color filter array (CFA) geometric pattern of the image sensor when
///  a one-chip color area sensor is used. It does not apply to all sensing methods.
///
///  See also [TAG_SENSING_METHOD]
///  See also [SENSOR_TYPE_ONE_CHIP]
///
const String TAG_CFA_PATTERN = "CFAPattern";

///
///  This tag indicates the use of special processing on image data, such as rendering geared
///  to output. When special processing is performed, the Exif/DCF reader is expected to disable
///  or minimize any further processing.
///
///  See also [RENDERED_PROCESS_NORMAL]
///  See also [RENDERED_PROCESS_CUSTOM]
///
const String TAG_CUSTOM_RENDERED = "CustomRendered";

///
///  This tag indicates the exposure mode set when the image was shot.
///  In [EXPOSURE_MODE_AUTO_BRACKET], the camera shoots a series of frames of the same
///  scene at different exposure settings.
///
///  See also [EXPOSURE_MODE_AUTO]
///  See also [EXPOSURE_MODE_MANUAL]
///  See also [EXPOSURE_MODE_AUTO_BRACKET]
///
const String TAG_EXPOSURE_MODE = "ExposureMode";

///
///  This tag indicates the white balance mode set when the image was shot.
///
///  See also [WHITEBALANCE_AUTO]
///  See also [WHITEBALANCE_MANUAL]
///
const String TAG_WHITE_BALANCE = "WhiteBalance";

///
///  This tag indicates the digital zoom ratio when the image was shot. If the numerator of
///  the recorded value is 0, this indicates that digital zoom was not used.
///
const String TAG_DIGITAL_ZOOM_RATIO = "DigitalZoomRatio";

///
///  This tag indicates the equivalent focal length assuming a 35mm film camera, in mm.
///  A value of 0 means the focal length is unknown. Note that this tag differs from
///  See also [TAG_FOCAL_LENGTH].
///
const String TAG_FOCAL_LENGTH_IN_35MM_FILM = "FocalLengthIn35mmFilm";

///
///  This tag indicates the type of scene that was shot. It may also be used to record
///  the mode in which the image was shot. Note that this differs from
///
///  See also [SCENE_CAPTURE_TYPE_STANDARD]
///  See also [SCENE_CAPTURE_TYPE_LANDSCAPE]
///  See also [SCENE_CAPTURE_TYPE_PORTRAIT]
///  See also [SCENE_CAPTURE_TYPE_NIGHT]
///
const String TAG_SCENE_CAPTURE_TYPE = "SceneCaptureType";

///
///  This tag indicates the degree of overall image gain adjustment.
///
///  See also [GAIN_CONTROL_NONE]
///  See also [GAIN_CONTROL_LOW_GAIN_UP]
///  See also [GAIN_CONTROL_HIGH_GAIN_UP]
///  See also [GAIN_CONTROL_LOW_GAIN_DOWN]
///  See also [GAIN_CONTROL_HIGH_GAIN_DOWN]
///
const String TAG_GAIN_CONTROL = "GainControl";

///
///  This tag indicates the direction of contrast processing applied by the camera when
///  the image was shot.
///
///  See also [CONTRAST_NORMAL]
///  See also [CONTRAST_SOFT]
///  See also [CONTRAST_HARD]
///
const String TAG_CONTRAST = "Contrast";

///
///  This tag indicates the direction of saturation processing applied by the camera when
///  the image was shot.
///
///  See also [SATURATION_NORMAL]
///  See also [SATURATION_LOW]
///  See also [SATURATION_HIGH]
///
const String TAG_SATURATION = "Saturation";

///
///  This tag indicates the direction of sharpness processing applied by the camera when
///  the image was shot.
///
///  See also [SHARPNESS_NORMAL]
///  See also [SHARPNESS_SOFT]
///  See also [SHARPNESS_HARD]
///
const String TAG_SHARPNESS = "Sharpness";

///
///  This tag indicates information on the picture-taking conditions of a particular camera
///  model. The tag is used only to indicate the picture-taking conditions in the Exif/DCF
///  reader.
///
const String TAG_DEVICE_SETTING_DESCRIPTION = "DeviceSettingDescription";

///
///  This tag indicates the distance to the subject.
///
///  See also [SUBJECT_DISTANCE_RANGE_UNKNOWN]
///  See also [SUBJECT_DISTANCE_RANGE_MACRO]
///  See also [SUBJECT_DISTANCE_RANGE_CLOSE_VIEW]
///  See also [SUBJECT_DISTANCE_RANGE_DISTANT_VIEW]
///
const String TAG_SUBJECT_DISTANCE_RANGE = "SubjectDistanceRange";

/// H. Other tags
///
///  This tag indicates an identifier assigned uniquely to each image. It is recorded as
///  an ASCII string equivalent to hexadecimal notation and 128-bit fixed length.
///
const String TAG_IMAGE_UNIQUE_ID = "ImageUniqueID";

///
///  This tag records the owner of a camera used in photography as an ASCII string.
///
const String TAG_CAMERA_OWNER_NAME = "CameraOwnerName";

///
///  This tag records the serial number of the body of the camera that was used in photography
///  as an ASCII string.
///
const String TAG_BODY_SERIAL_NUMBER = "BodySerialNumber";

///
///  This tag notes minimum focal length, maximum focal length, minimum F number in the
///  minimum focal length, and minimum F number in the maximum focal length, which are
///  specification information for the lens that was used in photography. When the minimum
///  F number is unknown, the notation is 0/0.
///
const String TAG_LENS_SPECIFICATION = "LensSpecification";

///
///  This tag records the lens manufacturer as an ASCII string.
///
const String TAG_LENS_MAKE = "LensMake";

///
///  This tag records the lens’s model name and model number as an ASCII string.
///
const String TAG_LENS_MODEL = "LensModel";

///
///  This tag records the serial number of the interchangeable lens that was used in
///  photography as an ASCII string.
///
const String TAG_LENS_SERIAL_NUMBER = "LensSerialNumber";
// GPS Attribute Information
///
///  Indicates the version of GPS Info IFD. The version is given as 2.3.0.0. This tag is
///  mandatory when GPS-related tags are present. Note that this tag is written as a different
///  byte than [TAG_EXIF_VERSION].
///
const String TAG_GPS_VERSION_ID = "GPSVersionID";

///
///  Indicates whether the latitude is north or south latitude.
///
///  See also [LATITUDE_NORTH]
///  See also [LATITUDE_SOUTH]
///
const String TAG_GPS_LATITUDE_REF = "GPSLatitudeRef";

///
///  Indicates the latitude. The latitude is expressed as three RATIONAL values giving
///  the degrees, minutes, and seconds, respectively. If latitude is expressed as degrees,
///  minutes and seconds, a typical format would be dd/1,mm/1,ss/1. When degrees and minutes are
///  used and, for example, fractions of minutes are given up to two decimal places, the format
///  would be dd/1,mmmm/100,0/1.
///
const String TAG_GPS_LATITUDE = "GPSLatitude";

///
///  Indicates whether the longitude is east or west longitude.
///
///  See also [LONGITUDE_EAST]
///  See also [LONGITUDE_WEST]
///
const String TAG_GPS_LONGITUDE_REF = "GPSLongitudeRef";

///
///  Indicates the longitude. The longitude is expressed as three RATIONAL values giving
///  the degrees, minutes, and seconds, respectively. If longitude is expressed as degrees,
///  minutes and seconds, a typical format would be ddd/1,mm/1,ss/1. When degrees and minutes
///  are used and, for example, fractions of minutes are given up to two decimal places,
///  the format would be ddd/1,mmmm/100,0/1.
///
const String TAG_GPS_LONGITUDE = "GPSLongitude";

///
///  Indicates the altitude used as the reference altitude. If the reference is sea level
///  and the altitude is above sea level, 0 is given. If the altitude is below sea level,
///  a value of 1 is given and the altitude is indicated as an absolute value in
///  [TAG_GPS_ALTITUDE].
///
///  See also [ALTITUDE_ABOVE_SEA_LEVEL]
///  See also [ALTITUDE_BELOW_SEA_LEVEL]
///
const String TAG_GPS_ALTITUDE_REF = "GPSAltitudeRef";

///
///  Indicates the altitude based on the reference in [TAG_GPS_ALTITUDE_REF].
///  The reference unit is meters.
///
const String TAG_GPS_ALTITUDE = "GPSAltitude";

///
///  Indicates the time as UTC (Coordinated Universal Time). TimeStamp is expressed as three
///  unsigned rational values giving the hour, minute, and second.
///
const String TAG_GPS_TIMESTAMP = "GPSTimeStamp";

///
///  Indicates the GPS satellites used for measurements. This tag may be used to describe
///  the number of satellites, their ID number, angle of elevation, azimuth, SNR and other
///  information in ASCII notation. The format is not specified. If the GPS receiver is incapable
///  of taking measurements, value of the tag shall be set to null.
///
const String TAG_GPS_SATELLITES = "GPSSatellites";

///
///  Indicates the status of the GPS receiver when the image is recorded. 'A' means
///  measurement is in progress, and 'V' means the measurement is interrupted.
///
///  See also [GPS_MEASUREMENT_IN_PROGRESS]
///  See also [GPS_MEASUREMENT_INTERRUPTED]
///
const String TAG_GPS_STATUS = "GPSStatus";

///
///  Indicates the GPS measurement mode. Originally it was defined for GPS, but it may
///  be used for recording a measure mode to record the position information provided from
///  a mobile base station or wireless LAN as well as GPS.
///
///  See also [GPS_MEASUREMENT_2D]
///  See also [GPS_MEASUREMENT_3D]
///
const String TAG_GPS_MEASURE_MODE = "GPSMeasureMode";

///
///  Indicates the GPS DOP (data degree of precision). An HDOP value is written during
///  two-dimensional measurement, and PDOP during three-dimensional measurement.
///
const String TAG_GPS_DOP = "GPSDOP";

///
///  Indicates the unit used to express the GPS receiver speed of movement.
///
///  See also [GPS_SPEED_KILOMETERS_PER_HOUR]
///  See also [GPS_SPEED_MILES_PER_HOUR]
///  See also [GPS_SPEED_KNOTS]
///
const String TAG_GPS_SPEED_REF = "GPSSpeedRef";

///
///  Indicates the speed of GPS receiver movement.
///
const String TAG_GPS_SPEED = "GPSSpeed";

///
///  Indicates the reference for giving the direction of GPS receiver movement.
///
///  See also [GPS_DIRECTION_TRUE]
///  See also [GPS_DIRECTION_MAGNETIC]
///
const String TAG_GPS_TRACK_REF = "GPSTrackRef";

///
///  Indicates the direction of GPS receiver movement.
///  The range of values is from 0.00 to 359.99.
///
const String TAG_GPS_TRACK = "GPSTrack";

///
///  Indicates the reference for giving the direction of the image when it is captured.
///
///  See also [GPS_DIRECTION_TRUE]
///  See also [GPS_DIRECTION_MAGNETIC]
///
const String TAG_GPS_IMG_DIRECTION_REF = "GPSImgDirectionRef";

///
///  Indicates the direction of the image when it was captured.
///  The range of values is from 0.00 to 359.99.
///
const String TAG_GPS_IMG_DIRECTION = "GPSImgDirection";

///
///  Indicates the geodetic survey data used by the GPS receiver. If the survey data is
///  restricted to Japan,the value of this tag is 'TOKYO' or 'WGS-84'. If a GPS Info tag is
///  recorded, it is strongly recommended that this tag be recorded.
///
const String TAG_GPS_MAP_DATUM = "GPSMapDatum";

///
///  Indicates whether the latitude of the destination point is north or south latitude.
///
///  See also [LATITUDE_NORTH]
///  See also [LATITUDE_SOUTH]
///
const String TAG_GPS_DEST_LATITUDE_REF = "GPSDestLatitudeRef";

///
///  Indicates the latitude of the destination point. The latitude is expressed as three
///  unsigned rational values giving the degrees, minutes, and seconds, respectively.
///  If latitude is expressed as degrees, minutes and seconds, a typical format would be
///  dd/1,mm/1,ss/1. When degrees and minutes are used and, for example, fractions of minutes
///  are given up to two decimal places, the format would be dd/1, mmmm/100, 0/1.
///
const String TAG_GPS_DEST_LATITUDE = "GPSDestLatitude";

///
///  Indicates whether the longitude of the destination point is east or west longitude.
///
///  See also [LONGITUDE_EAST]
///  See also [LONGITUDE_WEST]
///
const String TAG_GPS_DEST_LONGITUDE_REF = "GPSDestLongitudeRef";

///
///  Indicates the longitude of the destination point. The longitude is expressed as three
///  unsigned rational values giving the degrees, minutes, and seconds, respectively.
///  If longitude is expressed as degrees, minutes and seconds, a typical format would be ddd/1,
///  mm/1, ss/1. When degrees and minutes are used and, for example, fractions of minutes are
///  given up to two decimal places, the format would be ddd/1, mmmm/100, 0/1.
///
const String TAG_GPS_DEST_LONGITUDE = "GPSDestLongitude";

///
///  Indicates the reference used for giving the bearing to the destination point.
///
///  See also [GPS_DIRECTION_TRUE]
///  See also [GPS_DIRECTION_MAGNETIC]
///
const String TAG_GPS_DEST_BEARING_REF = "GPSDestBearingRef";

///
///  Indicates the bearing to the destination point.
///  The range of values is from 0.00 to 359.99.
///
const String TAG_GPS_DEST_BEARING = "GPSDestBearing";

///
///  Indicates the unit used to express the distance to the destination point.
///
///  See also [GPS_DISTANCE_KILOMETERS]
///  See also [GPS_DISTANCE_MILES]
///  See also [GPS_DISTANCE_NAUTICAL_MILES]
///
const String TAG_GPS_DEST_DISTANCE_REF = "GPSDestDistanceRef";

///
///  Indicates the distance to the destination point.
///
const String TAG_GPS_DEST_DISTANCE = "GPSDestDistance";

///
///  A character string recording the name of the method used for location finding.
///  The first byte indicates the character code used, and this is followed by the name of
///  the method.
///
const String TAG_GPS_PROCESSING_METHOD = "GPSProcessingMethod";

///
///  A character string recording the name of the GPS area. The first byte indicates
///  the character code used, and this is followed by the name of the GPS area.
///
const String TAG_GPS_AREA_INFORMATION = "GPSAreaInformation";

///
///  A character string recording date and time information relative to UTC (Coordinated
///  Universal Time). The format is "YYYY:MM:DD".
///
const String TAG_GPS_DATESTAMP = "GPSDateStamp";

///
///  Indicates whether differential correction is applied to the GPS receiver.
///
///  See also [GPS_MEASUREMENT_NO_DIFFERENTIAL]
///  See also [GPS_MEASUREMENT_DIFFERENTIAL_CORRECTED]
///
const String TAG_GPS_DIFFERENTIAL = "GPSDifferential";

///
///  This tag indicates horizontal positioning errors in meters.
///
const String TAG_GPS_H_POSITIONING_ERROR = "GPSHPositioningError";
// Interoperability IFD Attribute Information
///
///  Indicates the identification of the Interoperability rule.
///
const String TAG_INTEROPERABILITY_INDEX = "InteroperabilityIndex";

///
/// See also [TAG_IMAGE_LENGTH]
///
const String TAG_THUMBNAIL_IMAGE_LENGTH = "ThumbnailImageLength";

///
/// See also [TAG_IMAGE_WIDTH]
///
const String TAG_THUMBNAIL_IMAGE_WIDTH = "ThumbnailImageWidth";

const String TAG_THUMBNAIL_ORIENTATION = "ThumbnailOrientation";

/// Type is int. DNG Specification 1.4.0.0. Section 4
const String TAG_DNG_VERSION = "DNGVersion";

/// Type is int. DNG Specification 1.4.0.0. Section 4
const String TAG_DEFAULT_CROP_SIZE = "DefaultCropSize";

/// Type is undefined. See Olympus MakerNote tags in http://www.exiv2.org/tags-olympus.html.
const String TAG_ORF_THUMBNAIL_IMAGE = "ThumbnailImage";

/// Type is int. See Olympus Camera Settings tags in http://www.exiv2.org/tags-olympus.html.
const String TAG_ORF_PREVIEW_IMAGE_START = "PreviewImageStart";

/// Type is int. See Olympus Camera Settings tags in http://www.exiv2.org/tags-olympus.html.
const String TAG_ORF_PREVIEW_IMAGE_LENGTH = "PreviewImageLength";

/// Type is int. See Olympus Image Processing tags in http://www.exiv2.org/tags-olympus.html.
const String TAG_ORF_ASPECT_FRAME = "AspectFrame";

///
/// Type is int. See PanasonicRaw tags in
/// http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/PanasonicRaw.html
///
const String TAG_RW2_SENSOR_BOTTOM_BORDER = "SensorBottomBorder";

///
/// Type is int. See PanasonicRaw tags in
/// http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/PanasonicRaw.html
///
const String TAG_RW2_SENSOR_LEFT_BORDER = "SensorLeftBorder";

///
/// Type is int. See PanasonicRaw tags in
/// http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/PanasonicRaw.html
///
const String TAG_RW2_SENSOR_RIGHT_BORDER = "SensorRightBorder";

///
/// Type is int. See PanasonicRaw tags in
/// http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/PanasonicRaw.html
///
const String TAG_RW2_SENSOR_TOP_BORDER = "SensorTopBorder";

///
/// Type is int. See PanasonicRaw tags in
/// http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/PanasonicRaw.html
///
const String TAG_RW2_ISO = "ISO";

///
/// Type is undefined. See PanasonicRaw tags in
/// http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/PanasonicRaw.html
///
const String TAG_RW2_JPG_FROM_RAW = "JpgFromRaw";

///
/// Type is byte[]. See <a href=
/// "https://en.wikipedia.org/wiki/Extensible_Metadata_Platform">Extensible
/// Metadata Platform (XMP)</a> for details on contents.
///
const String TAG_XMP = "Xmp";

/// Type is int. See JEITA CP-3451C Spec Section 3: Bilevel Images.
const String TAG_NEW_SUBFILE_TYPE = "NewSubfileType";

/// Type is int. See JEITA CP-3451C Spec Section 3: Bilevel Images.
const String TAG_SUBFILE_TYPE = "SubfileType";
