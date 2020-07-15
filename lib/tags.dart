// The Exif tag names. See JEITA CP-3451C specifications (Exif 2.3) Section 3-8.
// A. Tags related to image data structure


///
///  <p>The number of columns of image data, equal to the number of pixels per row. In JPEG
///  compressed data, this tag shall not be used because a JPEG marker is used instead of it.</p>
///
///  <ul>
///      <li>Tag = 256</li>
///      <li>Type = Unsigned short or Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///
const String TAG_IMAGE_WIDTH = "ImageWidth";

///
///  <p>The number of rows of image data. In JPEG compressed data, this tag shall not be used
///  because a JPEG marker is used instead of it.</p>
///
///  <ul>
///      <li>Tag = 257</li>
///      <li>Type = Unsigned short or Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_IMAGE_LENGTH = "ImageLength";

///
///  <p>The number of bits per image component. In this standard each component of the image is
///  8 bits, so the value for this tag is 8. See also {@link #TAG_SAMPLES_PER_PIXEL}. In JPEG
///  compressed data, this tag shall not be used because a JPEG marker is used instead of it.</p>
///
///  <ul>
///      <li>Tag = 258</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 3</li>
///      <li>Default = {@link #BITS_PER_SAMPLE_RGB}</li>
///  </ul>
///
const String TAG_BITS_PER_SAMPLE = "BitsPerSample";

///
///  <p>The compression scheme used for the image data. When a primary image is JPEG compressed,
///  this designation is not necessary. So, this tag shall not be recorded. When thumbnails use
///  JPEG compression, this tag value is set to 6.</p>
///
///  <ul>
///      <li>Tag = 259</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #DATA_UNCOMPRESSED
///  @see #DATA_JPEG
///
const String TAG_COMPRESSION = "Compression";

///
///  <p>The pixel composition. In JPEG compressed data, this tag shall not be used because a JPEG
///  marker is used instead of it.</p>
///
///  <ul>
///      <li>Tag = 262</li>
///      <li>Type = SHORT</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #PHOTOMETRIC_INTERPRETATION_RGB
///  @see #PHOTOMETRIC_INTERPRETATION_YCBCR
///
const String TAG_PHOTOMETRIC_INTERPRETATION = "PhotometricInterpretation";

///
///  <p>The image orientation viewed in terms of rows and columns.</p>
///
///  <ul>
///      <li>Tag = 274</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #ORIENTATION_NORMAL}</li>
///  </ul>
///
///  @see #ORIENTATION_UNDEFINED
///  @see #ORIENTATION_NORMAL
///  @see #ORIENTATION_FLIP_HORIZONTAL
///  @see #ORIENTATION_ROTATE_180
///  @see #ORIENTATION_FLIP_VERTICAL
///  @see #ORIENTATION_TRANSPOSE
///  @see #ORIENTATION_ROTATE_90
///  @see #ORIENTATION_TRANSVERSE
///  @see #ORIENTATION_ROTATE_270
///
const String TAG_ORIENTATION = "Orientation";

///
///  <p>The number of components per pixel. Since this standard applies to RGB and YCbCr images,
///  the value set for this tag is 3. In JPEG compressed data, this tag shall not be used because
///  a JPEG marker is used instead of it.</p>
///
///  <ul>
///      <li>Tag = 277</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = 3</li>
///  </ul>
///
const String TAG_SAMPLES_PER_PIXEL = "SamplesPerPixel";

///
///  <p>Indicates whether pixel components are recorded in chunky or planar format. In JPEG
///  compressed data, this tag shall not be used because a JPEG marker is used instead of it.
///  If this field does not exist, the TIFF default, {@link #FORMAT_CHUNKY}, is assumed.</p>
///
///  <ul>
///      <li>Tag = 284</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///  </ul>
///
///  @see #FORMAT_CHUNKY
///  @see #FORMAT_PLANAR
///
const String TAG_PLANAR_CONFIGURATION = "PlanarConfiguration";

///
///  <p>The sampling ratio of chrominance components in relation to the luminance component.
///  In JPEG compressed data a JPEG marker is used instead of this tag. So, this tag shall not
///  be recorded.</p>
///
///  <ul>
///      <li>Tag = 530</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 2</li>
///      <ul>
///          <li>[2, 1] = YCbCr4:2:2</li>
///          <li>[2, 2] = YCbCr4:2:0</li>
///          <li>Other = reserved</li>
///      </ul>
///  </ul>
///
const String TAG_Y_CB_CR_SUB_SAMPLING = "YCbCrSubSampling";

///
///  <p>The position of chrominance components in relation to the luminance component. This field
///  is designated only for JPEG compressed data or uncompressed YCbCr data. The TIFF default is
///  {@link #Y_CB_CR_POSITIONING_CENTERED}; but when Y:Cb:Cr = 4:2:2 it is recommended in this
///  standard that {@link #Y_CB_CR_POSITIONING_CO_SITED} be used to record data, in order to
///  improve the image quality when viewed on TV systems. When this field does not exist,
///  the reader shall assume the TIFF default. In the case of Y:Cb:Cr = 4:2:0, the TIFF default
///  ({@link #Y_CB_CR_POSITIONING_CENTERED}) is recommended. If the Exif/DCF reader does not
///  have the capability of supporting both kinds of positioning, it shall follow the TIFF
///  default regardless of the value in this field. It is preferable that readers can support
///  both centered and co-sited positioning.</p>
///
///  <ul>
///      <li>Tag = 531</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #Y_CB_CR_POSITIONING_CENTERED}</li>
///  </ul>
///
///  @see #Y_CB_CR_POSITIONING_CENTERED
///  @see #Y_CB_CR_POSITIONING_CO_SITED
///
const String TAG_Y_CB_CR_POSITIONING = "YCbCrPositioning";

///
///  <p>The number of pixels per {@link #TAG_RESOLUTION_UNIT} in the {@link #TAG_IMAGE_WIDTH}
///  direction. When the image resolution is unknown, 72 [dpi] shall be designated.</p>
///
///  <ul>
///      <li>Tag = 282</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = 72</li>
///  </ul>
///
///  @see #TAG_Y_RESOLUTION
///  @see #TAG_RESOLUTION_UNIT
///
const String TAG_X_RESOLUTION = "XResolution";

///
///  <p>The number of pixels per {@link #TAG_RESOLUTION_UNIT} in the {@link #TAG_IMAGE_WIDTH}
///  direction. The same value as {@link #TAG_X_RESOLUTION} shall be designated.</p>
///
///  <ul>
///      <li>Tag = 283</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = 72</li>
///  </ul>
///
///  @see #TAG_X_RESOLUTION
///  @see #TAG_RESOLUTION_UNIT
///
const String TAG_Y_RESOLUTION = "YResolution";

///
///  <p>The unit for measuring {@link #TAG_X_RESOLUTION} and {@link #TAG_Y_RESOLUTION}. The same
///  unit is used for both {@link #TAG_X_RESOLUTION} and {@link #TAG_Y_RESOLUTION}. If the image
///  resolution is unknown, {@link #RESOLUTION_UNIT_INCHES} shall be designated.</p>
///
///  <ul>
///      <li>Tag = 296</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #RESOLUTION_UNIT_INCHES}</li>
///  </ul>
///
///  @see #RESOLUTION_UNIT_INCHES
///  @see #RESOLUTION_UNIT_CENTIMETERS
///  @see #TAG_X_RESOLUTION
///  @see #TAG_Y_RESOLUTION
///
const String TAG_RESOLUTION_UNIT = "ResolutionUnit";
// B. Tags related to recording offset
///
///  <p>For each strip, the byte offset of that strip. It is recommended that this be selected
///  so the number of strip bytes does not exceed 64 KBytes.In the case of JPEG compressed data,
///  this designation is not necessary. So, this tag shall not be recorded.</p>
///
///  <ul>
///      <li>Tag = 273</li>
///      <li>Type = Unsigned short or Unsigned long</li>
///      <li>Count = StripsPerImage (for {@link #FORMAT_CHUNKY})
///               or {@link #TAG_SAMPLES_PER_PIXEL} /// StripsPerImage
///               (for {@link #FORMAT_PLANAR})</li>
///      <li>Default = None</li>
///  </ul>
///
///  <p>StripsPerImage = floor(({@link #TAG_IMAGE_LENGTH} + {@link #TAG_ROWS_PER_STRIP} - 1)
///  / {@link #TAG_ROWS_PER_STRIP})</p>
///
///  @see #TAG_ROWS_PER_STRIP
///  @see #TAG_STRIP_BYTE_COUNTS
///
const String TAG_STRIP_OFFSETS = "StripOffsets";

///
///  <p>The number of rows per strip. This is the number of rows in the image of one strip when
///  an image is divided into strips. In the case of JPEG compressed data, this designation is
///  not necessary. So, this tag shall not be recorded.</p>
///
///  <ul>
///      <li>Tag = 278</li>
///      <li>Type = Unsigned short or Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #TAG_STRIP_OFFSETS
///  @see #TAG_STRIP_BYTE_COUNTS
///
const String TAG_ROWS_PER_STRIP = "RowsPerStrip";

///
///  <p>The total number of bytes in each strip. In the case of JPEG compressed data, this
///  designation is not necessary. So, this tag shall not be recorded.</p>
///
///  <ul>
///      <li>Tag = 279</li>
///      <li>Type = Unsigned short or Unsigned long</li>
///      <li>Count = StripsPerImage (when using {@link #FORMAT_CHUNKY})
///               or {@link #TAG_SAMPLES_PER_PIXEL} /// StripsPerImage
///               (when using {@link #FORMAT_PLANAR})</li>
///      <li>Default = None</li>
///  </ul>
///
///  <p>StripsPerImage = floor(({@link #TAG_IMAGE_LENGTH} + {@link #TAG_ROWS_PER_STRIP} - 1)
///  / {@link #TAG_ROWS_PER_STRIP})</p>
///
const String TAG_STRIP_BYTE_COUNTS = "StripByteCounts";

///
///  <p>The offset to the start byte (SOI) of JPEG compressed thumbnail data. This shall not be
///  used for primary image JPEG data.</p>
///
///  <ul>
///      <li>Tag = 513</li>
///      <li>Type = Unsigned long</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_JPEG_INTERCHANGE_FORMAT = "JPEGInterchangeFormat";

///
///  <p>The number of bytes of JPEG compressed thumbnail data. This is not used for primary image
///  JPEG data. JPEG thumbnails are not divided but are recorded as a continuous JPEG bitstream
///  from SOI to EOI. APPn and COM markers should not be recorded. Compressed thumbnails shall be
///  recorded in no more than 64 KBytes, including all other data to be recorded in APP1.</p>
///
///  <ul>
///      <li>Tag = 514</li>
///      <li>Type = Unsigned long</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_JPEG_INTERCHANGE_FORMAT_LENGTH = "JPEGInterchangeFormatLength";
// C. Tags related to Image Data Characteristics
///
///  <p>A transfer function for the image, described in tabular style. Normally this tag need not
///  be used, since color space is specified in {@link #TAG_COLOR_SPACE}.</p>
///
///  <ul>
///      <li>Tag = 301</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 3 /// 256</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_TRANSFER_FUNCTION = "TransferFunction";

///
///  <p>The chromaticity of the white point of the image. Normally this tag need not be used,
///  since color space is specified in {@link #TAG_COLOR_SPACE}.</p>
///
///  <ul>
///      <li>Tag = 318</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 2</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_WHITE_POINT = "WhitePoint";

///
///  <p>The chromaticity of the three primary colors of the image. Normally this tag need not
///  be used, since color space is specified in {@link #TAG_COLOR_SPACE}.</p>
///
///  <ul>
///      <li>Tag = 319</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 6</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_PRIMARY_CHROMATICITIES = "PrimaryChromaticities";

///
///  <p>The matrix coefficients for transformation from RGB to YCbCr image data. About
///  the default value, please refer to JEITA CP-3451C Spec, Annex D.</p>
///
///  <ul>
///      <li>Tag = 529</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 3</li>
///  </ul>
///
const String TAG_Y_CB_CR_COEFFICIENTS = "YCbCrCoefficients";

///
///  <p>The reference black point value and reference white point value. No defaults are given
///  in TIFF, but the values below are given as defaults here. The color space is declared in
///  a color space information tag, with the default being the value that gives the optimal image
///  characteristics Interoperability these conditions</p>
///
///  <ul>
///      <li>Tag = 532</li>
///      <li>Type = RATIONAL</li>
///      <li>Count = 6</li>
///      <li>Default = [0, 255, 0, 255, 0, 255] (when {@link #TAG_PHOTOMETRIC_INTERPRETATION}
///                 is {@link #PHOTOMETRIC_INTERPRETATION_RGB})
///                 or [0, 255, 0, 128, 0, 128] (when {@link #TAG_PHOTOMETRIC_INTERPRETATION}
///                 is {@link #PHOTOMETRIC_INTERPRETATION_YCBCR})</li>
///  </ul>
///
const String TAG_REFERENCE_BLACK_WHITE = "ReferenceBlackWhite";
// D. Other tags
///
///  <p>The date and time of image creation. In this standard it is the date and time the file
///  was changed. The format is "YYYY:MM:DD HH:MM:SS" with time shown in 24-hour format, and
///  the date and time separated by one blank character ({@code 0x20}). When the date and time
///  are unknown, all the character spaces except colons (":") should be filled with blank
///  characters, or else the Interoperability field should be filled with blank characters.
///  The character string length is 20 Bytes including NULL for termination. When the field is
///  left blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 306</li>
///      <li>Type = String</li>
///      <li>Length = 19</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_DATETIME = "DateTime";

///
///  <p>An ASCII string giving the title of the image. It is possible to be added a comment
///  such as "1988 company picnic" or the like. Two-byte character codes cannot be used. When
///  a 2-byte code is necessary, {@link #TAG_USER_COMMENT} is to be used.</p>
///
///  <ul>
///      <li>Tag = 270</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_IMAGE_DESCRIPTION = "ImageDescription";

///
///  <p>The manufacturer of the recording equipment. This is the manufacturer of the DSC,
///  scanner, video digitizer or other equipment that generated the image. When the field is left
///  blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 271</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_MAKE = "Make";

///
///  <p>The model name or model number of the equipment. This is the model name of number of
///  the DSC, scanner, video digitizer or other equipment that generated the image. When
///  the field is left blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 272</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_MODEL = "Model";

///
///  <p>This tag records the name and version of the software or firmware of the camera or image
///  input device used to generate the image. The detailed format is not specified, but it is
///  recommended that the example shown below be followed. When the field is left blank, it is
///  treated as unknown.</p>
///
///  <p>Ex.) "Exif Software Version 1.00a".</p>
///
///  <ul>
///      <li>Tag = 305</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SOFTWARE = "Software";

///
///  <p>This tag records the name of the camera owner, photographer or image creator.
///  The detailed format is not specified, but it is recommended that the information be written
///  as in the example below for ease of Interoperability. When the field is left blank, it is
///  treated as unknown.</p>
///
///  <p>Ex.) "Camera owner, John Smith; Photographer, Michael Brown; Image creator,
///  Ken James"</p>
///
///  <ul>
///      <li>Tag = 315</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_ARTIST = "Artist";

///
///  <p>Copyright information. In this standard the tag is used to indicate both the photographer
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
///  it is treated as unknown.</p>
///
///  <p>Ex. 1) When both the photographer copyright and editor copyright are given.
///  <ul><li>Photographer copyright + NULL + editor copyright + NULL</li></ul></p>
///  <p>Ex. 2) When only the photographer copyright is given.
///  <ul><li>Photographer copyright + NULL</li></ul></p>
///  <p>Ex. 3) When only the editor copyright is given.
///  <ul><li>Space ({@code 0x20}) + NULL + editor copyright + NULL</li></ul></p>
///
///  <ul>
///      <li>Tag = 315</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_COPYRIGHT = "Copyright";
// Exif IFD Attribute Information
// A. Tags related to version
///
///  <p>The version of this standard supported. Nonexistence of this field is taken to mean
///  nonconformance to the standard. In according with conformance to this standard, this tag
///  shall be recorded like "0230” as 4-byte ASCII.</p>
///
///  <ul>
///      <li>Tag = 36864</li>
///      <li>Type = Undefined</li>
///      <li>Length = 4</li>
///      <li>Default = "0230"</li>
///  </ul>
///
const String TAG_EXIF_VERSION = "ExifVersion";

///
///  <p>The Flashpix format version supported by a FPXR file. If the FPXR function supports
///  Flashpix format Ver. 1.0, this is indicated similarly to {@link #TAG_EXIF_VERSION} by
///  recording "0100" as 4-byte ASCII.</p>
///
///  <ul>
///      <li>Tag = 40960</li>
///      <li>Type = Undefined</li>
///      <li>Length = 4</li>
///      <li>Default = "0100"</li>
///  </ul>
///
const String TAG_FLASHPIX_VERSION = "FlashpixVersion";
// B. Tags related to image data characteristics
///
///  <p>The color space information tag is always recorded as the color space specifier.
///  Normally {@link #COLOR_SPACE_S_RGB} is used to define the color space based on the PC
///  monitor conditions and environment. If a color space other than {@link #COLOR_SPACE_S_RGB}
///  is used, {@link #COLOR_SPACE_UNCALIBRATED} is set. Image data recorded as
///  {@link #COLOR_SPACE_UNCALIBRATED} may be treated as {@link #COLOR_SPACE_S_RGB} when it is
///  converted to Flashpix.</p>
///
///  <ul>
///      <li>Tag = 40961</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///  </ul>
///
///  @see #COLOR_SPACE_S_RGB
///  @see #COLOR_SPACE_UNCALIBRATED
///
const String TAG_COLOR_SPACE = "ColorSpace";

///
///  <p>Indicates the value of coefficient gamma. The formula of transfer function used for image
///  reproduction is expressed as follows.</p>
///
///  <p>(Reproduced value) = (Input value) ^ gamma</p>
///
///  <p>Both reproduced value and input value indicate normalized value, whose minimum value is
///  0 and maximum value is 1.</p>
///
///  <ul>
///      <li>Tag = 42240</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GAMMA = "Gamma";
// C. Tags related to image configuration
///
///  <p>Information specific to compressed data. When a compressed file is recorded, the valid
///  width of the meaningful image shall be recorded in this tag, whether or not there is padding
///  data or a restart marker. This tag shall not exist in an uncompressed file.</p>
///
///  <ul>
///      <li>Tag = 40962</li>
///      <li>Type = Unsigned short or Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_PIXEL_X_DIMENSION = "PixelXDimension";

///
///  <p>Information specific to compressed data. When a compressed file is recorded, the valid
///  height of the meaningful image shall be recorded in this tag, whether or not there is
///  padding data or a restart marker. This tag shall not exist in an uncompressed file.
///  Since data padding is unnecessary in the vertical direction, the number of lines recorded
///  in this valid image height tag will in fact be the same as that recorded in the SOF.</p>
///
///  <ul>
///      <li>Tag = 40963</li>
///      <li>Type = Unsigned short or Unsigned long</li>
///      <li>Count = 1</li>
///  </ul>
///
const String TAG_PIXEL_Y_DIMENSION = "PixelYDimension";

///
///  <p>Information specific to compressed data. The channels of each component are arranged
///  in order from the 1st component to the 4th. For uncompressed data the data arrangement is
///  given in the {@link #TAG_PHOTOMETRIC_INTERPRETATION}. However, since
///  {@link #TAG_PHOTOMETRIC_INTERPRETATION} can only express the order of Y, Cb and Cr, this tag
///  is provided for cases when compressed data uses components other than Y, Cb, and Cr and to
///  enable support of other sequences.</p>
///
///  <ul>
///      <li>Tag = 37121</li>
///      <li>Type = Undefined</li>
///      <li>Length = 4</li>
///      <li>Default = 4 5 6 0 (if RGB uncompressed) or 1 2 3 0 (other cases)</li>
///      <ul>
///          <li>0 = does not exist</li>
///          <li>1 = Y</li>
///          <li>2 = Cb</li>
///          <li>3 = Cr</li>
///          <li>4 = R</li>
///          <li>5 = G</li>
///          <li>6 = B</li>
///          <li>other = reserved</li>
///      </ul>
///  </ul>
///
const String TAG_COMPONENTS_CONFIGURATION = "ComponentsConfiguration";

///
///  <p>Information specific to compressed data. The compression mode used for a compressed image
///  is indicated in unit bits per pixel.</p>
///
///  <ul>
///      <li>Tag = 37122</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_COMPRESSED_BITS_PER_PIXEL = "CompressedBitsPerPixel";
// D. Tags related to user information
///
///  <p>A tag for manufacturers of Exif/DCF writers to record any desired information.
///  The contents are up to the manufacturer, but this tag shall not be used for any other than
///  its intended purpose.</p>
///
///  <ul>
///      <li>Tag = 37500</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_MAKER_NOTE = "MakerNote";

///
///  <p>A tag for Exif users to write keywords or comments on the image besides those in
///  {@link #TAG_IMAGE_DESCRIPTION}, and without the character code limitations of it.</p>
///
///  <ul>
///      <li>Tag = 37510</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_USER_COMMENT = "UserComment";
// E. Tags related to related file information
///
///  <p>This tag is used to record the name of an audio file related to the image data. The only
///  relational information recorded here is the Exif audio file name and extension (an ASCII
///  string consisting of 8 characters + '.' + 3 characters). The path is not recorded.</p>
///
///  <p>When using this tag, audio files shall be recorded in conformance to the Exif audio
///  format. Writers can also store the data such as Audio within APP2 as Flashpix extension
///  stream data. Audio files shall be recorded in conformance to the Exif audio format.</p>
///
///  <ul>
///      <li>Tag = 40964</li>
///      <li>Type = String</li>
///      <li>Length = 12</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_RELATED_SOUND_FILE = "RelatedSoundFile";
// F. Tags related to date and time
///
///  <p>The date and time when the original image data was generated. For a DSC the date and time
///  the picture was taken are recorded. The format is "YYYY:MM:DD HH:MM:SS" with time shown in
///  24-hour format, and the date and time separated by one blank character ({@code 0x20}).
///  When the date and time are unknown, all the character spaces except colons (":") should be
///  filled with blank characters, or else the Interoperability field should be filled with blank
///  characters. When the field is left blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 36867</li>
///      <li>Type = String</li>
///      <li>Length = 19</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_DATETIME_ORIGINAL = "DateTimeOriginal";

///
///  <p>The date and time when the image was stored as digital data. If, for example, an image
///  was captured by DSC and at the same time the file was recorded, then
///  {@link #TAG_DATETIME_ORIGINAL} and this tag will have the same contents. The format is
///  "YYYY:MM:DD HH:MM:SS" with time shown in 24-hour format, and the date and time separated by
///  one blank character ({@code 0x20}). When the date and time are unknown, all the character
///  spaces except colons (":")should be filled with blank characters, or else
///  the Interoperability field should be filled with blank characters. When the field is left
///  blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 36868</li>
///      <li>Type = String</li>
///      <li>Length = 19</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_DATETIME_DIGITIZED = "DateTimeDigitized";

///
///  <p>A tag used to record the offset from UTC (the time difference from Universal Time
///  Coordinated including daylight saving time) of the time of DateTime tag. The format when
///  recording the offset is "±HH:MM". The part of "±" shall be recorded as "+" or "-". When
///  the offsets are unknown, all the character spaces except colons (":") should be filled
///  with blank characters, or else the Interoperability field should be filled with blank
///  characters. The character string length is 7 Bytes including NULL for termination. When
///  the field is left blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 36880</li>
///      <li>Type = String</li>
///      <li>Length = 7</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_OFFSET_TIME = "OffsetTime";

///
///  <p>A tag used to record the offset from UTC (the time difference from Universal Time
///  Coordinated including daylight saving time) of the time of DateTimeOriginal tag. The format
///  when recording the offset is "±HH:MM". The part of "±" shall be recorded as "+" or "-". When
///  the offsets are unknown, all the character spaces except colons (":") should be filled
///  with blank characters, or else the Interoperability field should be filled with blank
///  characters. The character string length is 7 Bytes including NULL for termination. When
///  the field is left blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 36881</li>
///      <li>Type = String</li>
///      <li>Length = 7</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_OFFSET_TIME_ORIGINAL = "OffsetTimeOriginal";

///
///  <p>A tag used to record the offset from UTC (the time difference from Universal Time
///  Coordinated including daylight saving time) of the time of DateTimeDigitized tag. The format
///  when recording the offset is "±HH:MM". The part of "±" shall be recorded as "+" or "-". When
///  the offsets are unknown, all the character spaces except colons (":") should be filled
///  with blank characters, or else the Interoperability field should be filled with blank
///  characters. The character string length is 7 Bytes including NULL for termination. When
///  the field is left blank, it is treated as unknown.</p>
///
///  <ul>
///      <li>Tag = 36882</li>
///      <li>Type = String</li>
///      <li>Length = 7</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_OFFSET_TIME_DIGITIZED = "OffsetTimeDigitized";

///
///  <p>A tag used to record fractions of seconds for {@link #TAG_DATETIME}.</p>
///
///  <ul>
///      <li>Tag = 37520</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SUBSEC_TIME = "SubSecTime";

///
///  <p>A tag used to record fractions of seconds for {@link #TAG_DATETIME_ORIGINAL}.</p>
///
///  <ul>
///      <li>Tag = 37521</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SUBSEC_TIME_ORIGINAL = "SubSecTimeOriginal";

///
///  <p>A tag used to record fractions of seconds for {@link #TAG_DATETIME_DIGITIZED}.</p>
///
///  <ul>
///      <li>Tag = 37522</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SUBSEC_TIME_DIGITIZED = "SubSecTimeDigitized";
// G. Tags related to picture-taking condition
///
///  <p>Exposure time, given in seconds.</p>
///
///  <ul>
///      <li>Tag = 33434</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_EXPOSURE_TIME = "ExposureTime";

///
///  <p>The F number.</p>
///
///  <ul>
///      <li>Tag = 33437</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_F_NUMBER = "FNumber";

///
///  <p>TThe class of the program used by the camera to set exposure when the picture is taken.
///  The tag values are as follows.</p>
///
///  <ul>
///      <li>Tag = 34850</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #EXPOSURE_PROGRAM_NOT_DEFINED}</li>
///  </ul>
///
///  @see #EXPOSURE_PROGRAM_NOT_DEFINED
///  @see #EXPOSURE_PROGRAM_MANUAL
///  @see #EXPOSURE_PROGRAM_NORMAL
///  @see #EXPOSURE_PROGRAM_APERTURE_PRIORITY
///  @see #EXPOSURE_PROGRAM_SHUTTER_PRIORITY
///  @see #EXPOSURE_PROGRAM_CREATIVE
///  @see #EXPOSURE_PROGRAM_ACTION
///  @see #EXPOSURE_PROGRAM_PORTRAIT_MODE
///  @see #EXPOSURE_PROGRAM_LANDSCAPE_MODE
///
const String TAG_EXPOSURE_PROGRAM = "ExposureProgram";

///
///  <p>Indicates the spectral sensitivity of each channel of the camera used. The tag value is
///  an ASCII string compatible with the standard developed by the ASTM Technical committee.</p>
///
///  <ul>
///      <li>Tag = 34852</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SPECTRAL_SENSITIVITY = "SpectralSensitivity";

///
///  @deprecated Use {@link #TAG_PHOTOGRAPHIC_SENSITIVITY} instead.
///  @see #TAG_PHOTOGRAPHIC_SENSITIVITY
///
@Deprecated('use TAG_PHOTOGRAPHIC_SENSITIVITY')
const String TAG_ISO_SPEED_RATINGS = "ISOSpeedRatings";

///
///  <p>This tag indicates the sensitivity of the camera or input device when the image was shot.
///  More specifically, it indicates one of the following values that are parameters defined in
///  ISO 12232: standard output sensitivity (SOS), recommended exposure index (REI), or ISO
///  speed. Accordingly, if a tag corresponding to a parameter that is designated by
///  {@link #TAG_SENSITIVITY_TYPE} is recorded, the values of the tag and of this tag are
///  the same. However, if the value is 65535 or higher, the value of this tag shall be 65535.
///  When recording this tag, {@link #TAG_SENSITIVITY_TYPE} should also be recorded. In addition,
///  while “Count = Any”, only 1 count should be used when recording this tag.</p>
///
///  <ul>
///      <li>Tag = 34855</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = Any</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_PHOTOGRAPHIC_SENSITIVITY = "PhotographicSensitivity";

///
///  <p>Indicates the Opto-Electric Conversion Function (OECF) specified in ISO 14524. OECF is
///  the relationship between the camera optical input and the image values.</p>
///
///  <ul>
///      <li>Tag = 34856</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_OECF = "OECF";

///
///  <p>This tag indicates which one of the parameters of ISO12232 is
///  {@link #TAG_PHOTOGRAPHIC_SENSITIVITY}. Although it is an optional tag, it should be recorded
///  when {@link #TAG_PHOTOGRAPHIC_SENSITIVITY} is recorded.</p>
///
///  <ul>
///      <li>Tag = 34864</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #SENSITIVITY_TYPE_UNKNOWN
///  @see #SENSITIVITY_TYPE_SOS
///  @see #SENSITIVITY_TYPE_REI
///  @see #SENSITIVITY_TYPE_ISO_SPEED
///  @see #SENSITIVITY_TYPE_SOS_AND_REI
///  @see #SENSITIVITY_TYPE_SOS_AND_ISO
///  @see #SENSITIVITY_TYPE_REI_AND_ISO
///  @see #SENSITIVITY_TYPE_SOS_AND_REI_AND_ISO
///
const String TAG_SENSITIVITY_TYPE = "SensitivityType";

///
///  <p>This tag indicates the standard output sensitivity value of a camera or input device
///  defined in ISO 12232. When recording this tag, {@link #TAG_PHOTOGRAPHIC_SENSITIVITY} and
///  {@link #TAG_SENSITIVITY_TYPE} shall also be recorded.</p>
///
///  <ul>
///      <li>Tag = 34865</li>
///      <li>Type = Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_STANDARD_OUTPUT_SENSITIVITY = "StandardOutputSensitivity";

///
///  <p>This tag indicates the recommended exposure index value of a camera or input device
///  defined in ISO 12232. When recording this tag, {@link #TAG_PHOTOGRAPHIC_SENSITIVITY} and
///  {@link #TAG_SENSITIVITY_TYPE} shall also be recorded.</p>
///
///  <ul>
///      <li>Tag = 34866</li>
///      <li>Type = Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_RECOMMENDED_EXPOSURE_INDEX = "RecommendedExposureIndex";

///
///  <p>This tag indicates the ISO speed value of a camera or input device that is defined in
///  ISO 12232. When recording this tag, {@link #TAG_PHOTOGRAPHIC_SENSITIVITY} and
///  {@link #TAG_SENSITIVITY_TYPE} shall also be recorded.</p>
///
///  <ul>
///      <li>Tag = 34867</li>
///      <li>Type = Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_ISO_SPEED = "ISOSpeed";

///
///  <p>This tag indicates the ISO speed latitude yyy value of a camera or input device that is
///  defined in ISO 12232. However, this tag shall not be recorded without {@link #TAG_ISO_SPEED}
///  and {@link #TAG_ISO_SPEED_LATITUDE_ZZZ}.</p>
///
///  <ul>
///      <li>Tag = 34868</li>
///      <li>Type = Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_ISO_SPEED_LATITUDE_YYY = "ISOSpeedLatitudeyyy";

///
///  <p>This tag indicates the ISO speed latitude zzz value of a camera or input device that is
///  defined in ISO 12232. However, this tag shall not be recorded without {@link #TAG_ISO_SPEED}
///  and {@link #TAG_ISO_SPEED_LATITUDE_YYY}.</p>
///
///  <ul>
///      <li>Tag = 34869</li>
///      <li>Type = Unsigned long</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_ISO_SPEED_LATITUDE_ZZZ = "ISOSpeedLatitudezzz";

///
///  <p>Shutter speed. The unit is the APEX setting.</p>
///
///  <ul>
///      <li>Tag = 37377</li>
///      <li>Type = Signed rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SHUTTER_SPEED_VALUE = "ShutterSpeedValue";

///
///  <p>The lens aperture. The unit is the APEX value.</p>
///
///  <ul>
///      <li>Tag = 37378</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_APERTURE_VALUE = "ApertureValue";

///
///  <p>The value of brightness. The unit is the APEX value. Ordinarily it is given in the range
///  of -99.99 to 99.99. Note that if the numerator of the recorded value is 0xFFFFFFFF,
///  Unknown shall be indicated.</p>
///
///  <ul>
///      <li>Tag = 37379</li>
///      <li>Type = Signed rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_BRIGHTNESS_VALUE = "BrightnessValue";

///
///  <p>The exposure bias. The unit is the APEX value. Ordinarily it is given in the range of
///  -99.99 to 99.99.</p>
///
///  <ul>
///      <li>Tag = 37380</li>
///      <li>Type = Signed rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_EXPOSURE_BIAS_VALUE = "ExposureBiasValue";

///
///  <p>The smallest F number of the lens. The unit is the APEX value. Ordinarily it is given
///  in the range of 00.00 to 99.99, but it is not limited to this range.</p>
///
///  <ul>
///      <li>Tag = 37381</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_MAX_APERTURE_VALUE = "MaxApertureValue";

///
///  <p>The distance to the subject, given in meters. Note that if the numerator of the recorded
///  value is 0xFFFFFFFF, Infinity shall be indicated; and if the numerator is 0, Distance
///  unknown shall be indicated.</p>
///
///  <ul>
///      <li>Tag = 37382</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SUBJECT_DISTANCE = "SubjectDistance";

///
///  <p>The metering mode.</p>
///
///  <ul>
///      <li>Tag = 37383</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #METERING_MODE_UNKNOWN}</li>
///  </ul>
///
///  @see #METERING_MODE_UNKNOWN
///  @see #METERING_MODE_AVERAGE
///  @see #METERING_MODE_CENTER_WEIGHT_AVERAGE
///  @see #METERING_MODE_SPOT
///  @see #METERING_MODE_MULTI_SPOT
///  @see #METERING_MODE_PATTERN
///  @see #METERING_MODE_PARTIAL
///  @see #METERING_MODE_OTHER
///
const String TAG_METERING_MODE = "MeteringMode";

///
///  <p>The kind of light source.</p>
///
///  <ul>
///      <li>Tag = 37384</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #LIGHT_SOURCE_UNKNOWN}</li>
///  </ul>
///
///  @see #LIGHT_SOURCE_UNKNOWN
///  @see #LIGHT_SOURCE_DAYLIGHT
///  @see #LIGHT_SOURCE_FLUORESCENT
///  @see #LIGHT_SOURCE_TUNGSTEN
///  @see #LIGHT_SOURCE_FLASH
///  @see #LIGHT_SOURCE_FINE_WEATHER
///  @see #LIGHT_SOURCE_CLOUDY_WEATHER
///  @see #LIGHT_SOURCE_SHADE
///  @see #LIGHT_SOURCE_DAYLIGHT_FLUORESCENT
///  @see #LIGHT_SOURCE_DAY_WHITE_FLUORESCENT
///  @see #LIGHT_SOURCE_COOL_WHITE_FLUORESCENT
///  @see #LIGHT_SOURCE_WHITE_FLUORESCENT
///  @see #LIGHT_SOURCE_WARM_WHITE_FLUORESCENT
///  @see #LIGHT_SOURCE_STANDARD_LIGHT_A
///  @see #LIGHT_SOURCE_STANDARD_LIGHT_B
///  @see #LIGHT_SOURCE_STANDARD_LIGHT_C
///  @see #LIGHT_SOURCE_D55
///  @see #LIGHT_SOURCE_D65
///  @see #LIGHT_SOURCE_D75
///  @see #LIGHT_SOURCE_D50
///  @see #LIGHT_SOURCE_ISO_STUDIO_TUNGSTEN
///  @see #LIGHT_SOURCE_OTHER
///
const String TAG_LIGHT_SOURCE = "LightSource";

///
///  <p>This tag indicates the status of flash when the image was shot. Bit 0 indicates the flash
///  firing status, bits 1 and 2 indicate the flash return status, bits 3 and 4 indicate
///  the flash mode, bit 5 indicates whether the flash function is present, and bit 6 indicates
///  "red eye" mode.</p>
///
///  <ul>
///      <li>Tag = 37385</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///  </ul>
///
///  @see #FLAG_FLASH_FIRED
///  @see #FLAG_FLASH_RETURN_LIGHT_NOT_DETECTED
///  @see #FLAG_FLASH_RETURN_LIGHT_DETECTED
///  @see #FLAG_FLASH_MODE_COMPULSORY_FIRING
///  @see #FLAG_FLASH_MODE_COMPULSORY_SUPPRESSION
///  @see #FLAG_FLASH_MODE_AUTO
///  @see #FLAG_FLASH_NO_FLASH_FUNCTION
///  @see #FLAG_FLASH_RED_EYE_SUPPORTED
///
const String TAG_FLASH = "Flash";

///
///  <p>This tag indicates the location and area of the main subject in the overall scene.</p>
///
///  <ul>
///      <li>Tag = 37396</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 2 or 3 or 4</li>
///      <li>Default = None</li>
///  </ul>
///
///  <p>The subject location and area are defined by Count values as follows.</p>
///
///  <ul>
///      <li>Count = 2 Indicates the location of the main subject as coordinates. The first value
///                    is the X coordinate and the second is the Y coordinate.</li>
///      <li>Count = 3 The area of the main subject is given as a circle. The circular area is
///                    expressed as center coordinates and diameter. The first value is
///                    the center X coordinate, the second is the center Y coordinate, and
///                    the third is the diameter.</li>
///      <li>Count = 4 The area of the main subject is given as a rectangle. The rectangular
///                    area is expressed as center coordinates and area dimensions. The first
///                    value is the center X coordinate, the second is the center Y coordinate,
///                    the third is the width of the area, and the fourth is the height of
///                    the area.</li>
///  </ul>
///
///  <p>Note that the coordinate values, width, and height are expressed in relation to the upper
///  left as origin, prior to rotation processing as per {@link #TAG_ORIENTATION}.</p>
///
const String TAG_SUBJECT_AREA = "SubjectArea";

///
///  <p>The actual focal length of the lens, in mm. Conversion is not made to the focal length
///  of a 35mm film camera.</p>
///
///  <ul>
///      <li>Tag = 37386</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_FOCAL_LENGTH = "FocalLength";

///
///  <p>Indicates the strobe energy at the time the image is captured, as measured in Beam Candle
///  Power Seconds (BCPS).</p>
///
///  <ul>
///      <li>Tag = 41483</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_FLASH_ENERGY = "FlashEnergy";

///
///  <p>This tag records the camera or input device spatial frequency table and SFR values in
///  the direction of image width, image height, and diagonal direction, as specified in
///  ISO 12233.</p>
///
///  <ul>
///      <li>Tag = 41484</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SPATIAL_FREQUENCY_RESPONSE = "SpatialFrequencyResponse";

///
///  <p>Indicates the number of pixels in the image width (X) direction per
///  {@link #TAG_FOCAL_PLANE_RESOLUTION_UNIT} on the camera focal plane.</p>
///
///  <ul>
///      <li>Tag = 41486</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_FOCAL_PLANE_X_RESOLUTION = "FocalPlaneXResolution";

///
///  <p>Indicates the number of pixels in the image height (Y) direction per
///  {@link #TAG_FOCAL_PLANE_RESOLUTION_UNIT} on the camera focal plane.</p>
///
///  <ul>
///      <li>Tag = 41487</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_FOCAL_PLANE_Y_RESOLUTION = "FocalPlaneYResolution";

///
///  <p>Indicates the unit for measuring {@link #TAG_FOCAL_PLANE_X_RESOLUTION} and
///  {@link #TAG_FOCAL_PLANE_Y_RESOLUTION}. This value is the same as
///  {@link #TAG_RESOLUTION_UNIT}.</p>
///
///  <ul>
///      <li>Tag = 41488</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #RESOLUTION_UNIT_INCHES}</li>
///  </ul>
///
///  @see #TAG_RESOLUTION_UNIT
///  @see #RESOLUTION_UNIT_INCHES
///  @see #RESOLUTION_UNIT_CENTIMETERS
///
const String TAG_FOCAL_PLANE_RESOLUTION_UNIT = "FocalPlaneResolutionUnit";

///
///  <p>Indicates the location of the main subject in the scene. The value of this tag represents
///  the pixel at the center of the main subject relative to the left edge, prior to rotation
///  processing as per {@link #TAG_ORIENTATION}. The first value indicates the X column number
///  and second indicates the Y row number. When a camera records the main subject location,
///  it is recommended that {@link #TAG_SUBJECT_AREA} be used instead of this tag.</p>
///
///  <ul>
///      <li>Tag = 41492</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 2</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_SUBJECT_LOCATION = "SubjectLocation";

///
///  <p>Indicates the exposure index selected on the camera or input device at the time the image
///  is captured.</p>
///
///  <ul>
///      <li>Tag = 41493</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_EXPOSURE_INDEX = "ExposureIndex";

///
///  <p>Indicates the image sensor type on the camera or input device.</p>
///
///  <ul>
///      <li>Tag = 41495</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #SENSOR_TYPE_NOT_DEFINED
///  @see #SENSOR_TYPE_ONE_CHIP
///  @see #SENSOR_TYPE_TWO_CHIP
///  @see #SENSOR_TYPE_THREE_CHIP
///  @see #SENSOR_TYPE_COLOR_SEQUENTIAL
///  @see #SENSOR_TYPE_TRILINEAR
///  @see #SENSOR_TYPE_COLOR_SEQUENTIAL_LINEAR
///
const String TAG_SENSING_METHOD = "SensingMethod";

///
///  <p>Indicates the image source. If a DSC recorded the image, this tag value always shall
///  be set to {@link #FILE_SOURCE_DSC}.</p>
///
///  <ul>
///      <li>Tag = 41728</li>
///      <li>Type = Undefined</li>
///      <li>Length = 1</li>
///      <li>Default = {@link #FILE_SOURCE_DSC}</li>
///  </ul>
///
///  @see #FILE_SOURCE_OTHER
///  @see #FILE_SOURCE_TRANSPARENT_SCANNER
///  @see #FILE_SOURCE_REFLEX_SCANNER
///  @see #FILE_SOURCE_DSC
///
const String TAG_FILE_SOURCE = "FileSource";

///
///  <p>Indicates the type of scene. If a DSC recorded the image, this tag value shall always
///  be set to {@link #SCENE_TYPE_DIRECTLY_PHOTOGRAPHED}.</p>
///
///  <ul>
///      <li>Tag = 41729</li>
///      <li>Type = Undefined</li>
///      <li>Length = 1</li>
///      <li>Default = 1</li>
///  </ul>
///
///  @see #SCENE_TYPE_DIRECTLY_PHOTOGRAPHED
///
const String TAG_SCENE_TYPE = "SceneType";

///
///  <p>Indicates the color filter array (CFA) geometric pattern of the image sensor when
///  a one-chip color area sensor is used. It does not apply to all sensing methods.</p>
///
///  <ul>
///      <li>Tag = 41730</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #TAG_SENSING_METHOD
///  @see #SENSOR_TYPE_ONE_CHIP
///
const String TAG_CFA_PATTERN = "CFAPattern";

///
///  <p>This tag indicates the use of special processing on image data, such as rendering geared
///  to output. When special processing is performed, the Exif/DCF reader is expected to disable
///  or minimize any further processing.</p>
///
///  <ul>
///      <li>Tag = 41985</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #RENDERED_PROCESS_NORMAL}</li>
///  </ul>
///
///  @see #RENDERED_PROCESS_NORMAL
///  @see #RENDERED_PROCESS_CUSTOM
///
const String TAG_CUSTOM_RENDERED = "CustomRendered";

///
///  <p>This tag indicates the exposure mode set when the image was shot.
///  In {@link #EXPOSURE_MODE_AUTO_BRACKET}, the camera shoots a series of frames of the same
///  scene at different exposure settings.</p>
///
///  <ul>
///      <li>Tag = 41986</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #EXPOSURE_MODE_AUTO
///  @see #EXPOSURE_MODE_MANUAL
///  @see #EXPOSURE_MODE_AUTO_BRACKET
///
const String TAG_EXPOSURE_MODE = "ExposureMode";

///
///  <p>This tag indicates the white balance mode set when the image was shot.</p>
///
///  <ul>
///      <li>Tag = 41987</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #WHITEBALANCE_AUTO
///  @see #WHITEBALANCE_MANUAL
///
const String TAG_WHITE_BALANCE = "WhiteBalance";

///
///  <p>This tag indicates the digital zoom ratio when the image was shot. If the numerator of
///  the recorded value is 0, this indicates that digital zoom was not used.</p>
///
///  <ul>
///      <li>Tag = 41988</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_DIGITAL_ZOOM_RATIO = "DigitalZoomRatio";

///
///  <p>This tag indicates the equivalent focal length assuming a 35mm film camera, in mm.
///  A value of 0 means the focal length is unknown. Note that this tag differs from
///  {@link #TAG_FOCAL_LENGTH}.</p>
///
///  <ul>
///      <li>Tag = 41989</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_FOCAL_LENGTH_IN_35MM_FILM = "FocalLengthIn35mmFilm";

///
///  <p>This tag indicates the type of scene that was shot. It may also be used to record
///  the mode in which the image was shot. Note that this differs from
///  {@link #TAG_SCENE_TYPE}.</p>
///
///  <ul>
///      <li>Tag = 41990</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = 0</li>
///  </ul>
///
///  @see #SCENE_CAPTURE_TYPE_STANDARD
///  @see #SCENE_CAPTURE_TYPE_LANDSCAPE
///  @see #SCENE_CAPTURE_TYPE_PORTRAIT
///  @see #SCENE_CAPTURE_TYPE_NIGHT
///
const String TAG_SCENE_CAPTURE_TYPE = "SceneCaptureType";

///
///  <p>This tag indicates the degree of overall image gain adjustment.</p>
///
///  <ul>
///      <li>Tag = 41991</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #GAIN_CONTROL_NONE
///  @see #GAIN_CONTROL_LOW_GAIN_UP
///  @see #GAIN_CONTROL_HIGH_GAIN_UP
///  @see #GAIN_CONTROL_LOW_GAIN_DOWN
///  @see #GAIN_CONTROL_HIGH_GAIN_DOWN
///
const String TAG_GAIN_CONTROL = "GainControl";

///
///  <p>This tag indicates the direction of contrast processing applied by the camera when
///  the image was shot.</p>
///
///  <ul>
///      <li>Tag = 41992</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #CONTRAST_NORMAL}</li>
///  </ul>
///
///  @see #CONTRAST_NORMAL
///  @see #CONTRAST_SOFT
///  @see #CONTRAST_HARD
///
const String TAG_CONTRAST = "Contrast";

///
///  <p>This tag indicates the direction of saturation processing applied by the camera when
///  the image was shot.</p>
///
///  <ul>
///      <li>Tag = 41993</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #SATURATION_NORMAL}</li>
///  </ul>
///
///  @see #SATURATION_NORMAL
///  @see #SATURATION_LOW
///  @see #SATURATION_HIGH
///
const String TAG_SATURATION = "Saturation";

///
///  <p>This tag indicates the direction of sharpness processing applied by the camera when
///  the image was shot.</p>
///
///  <ul>
///      <li>Tag = 41994</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = {@link #SHARPNESS_NORMAL}</li>
///  </ul>
///
///  @see #SHARPNESS_NORMAL
///  @see #SHARPNESS_SOFT
///  @see #SHARPNESS_HARD
///
const String TAG_SHARPNESS = "Sharpness";

///
///  <p>This tag indicates information on the picture-taking conditions of a particular camera
///  model. The tag is used only to indicate the picture-taking conditions in the Exif/DCF
///  reader.</p>
///
///  <ul>
///      <li>Tag = 41995</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_DEVICE_SETTING_DESCRIPTION = "DeviceSettingDescription";

///
///  <p>This tag indicates the distance to the subject.</p>
///
///  <ul>
///      <li>Tag = 41996</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #SUBJECT_DISTANCE_RANGE_UNKNOWN
///  @see #SUBJECT_DISTANCE_RANGE_MACRO
///  @see #SUBJECT_DISTANCE_RANGE_CLOSE_VIEW
///  @see #SUBJECT_DISTANCE_RANGE_DISTANT_VIEW
///
const String TAG_SUBJECT_DISTANCE_RANGE = "SubjectDistanceRange";
// H. Other tags
///
///  <p>This tag indicates an identifier assigned uniquely to each image. It is recorded as
///  an ASCII string equivalent to hexadecimal notation and 128-bit fixed length.</p>
///
///  <ul>
///      <li>Tag = 42016</li>
///      <li>Type = String</li>
///      <li>Length = 32</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_IMAGE_UNIQUE_ID = "ImageUniqueID";

///
///  <p>This tag records the owner of a camera used in photography as an ASCII string.</p>
///
///  <ul>
///      <li>Tag = 42032</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
///  @deprecated Use {@link #TAG_CAMERA_OWNER_NAME} instead.
///
@Deprecated('use TAG_CAMERA_OWNER_NAME')
const String TAG_CAMARA_OWNER_NAME = "CameraOwnerName";

///
///  <p>This tag records the owner of a camera used in photography as an ASCII string.</p>
///
///  <ul>
///      <li>Tag = 42032</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_CAMERA_OWNER_NAME = "CameraOwnerName";

///
///  <p>This tag records the serial number of the body of the camera that was used in photography
///  as an ASCII string.</p>
///
///  <ul>
///      <li>Tag = 42033</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_BODY_SERIAL_NUMBER = "BodySerialNumber";

///
///  <p>This tag notes minimum focal length, maximum focal length, minimum F number in the
///  minimum focal length, and minimum F number in the maximum focal length, which are
///  specification information for the lens that was used in photography. When the minimum
///  F number is unknown, the notation is 0/0.</p>
///
///  <ul>
///      <li>Tag = 42034</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 4</li>
///      <li>Default = None</li>
///      <ul>
///          <li>Value 1 := Minimum focal length (unit: mm)</li>
///          <li>Value 2 : = Maximum focal length (unit: mm)</li>
///          <li>Value 3 : = Minimum F number in the minimum focal length</li>
///          <li>Value 4 : = Minimum F number in the maximum focal length</li>
///      </ul>
///  </ul>
///
const String TAG_LENS_SPECIFICATION = "LensSpecification";

///
///  <p>This tag records the lens manufacturer as an ASCII string.</p>
///
///  <ul>
///      <li>Tag = 42035</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_LENS_MAKE = "LensMake";

///
///  <p>This tag records the lens’s model name and model number as an ASCII string.</p>
///
///  <ul>
///      <li>Tag = 42036</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_LENS_MODEL = "LensModel";

///
///  <p>This tag records the serial number of the interchangeable lens that was used in
///  photography as an ASCII string.</p>
///
///  <ul>
///      <li>Tag = 42037</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_LENS_SERIAL_NUMBER = "LensSerialNumber";
// GPS Attribute Information
///
///  <p>Indicates the version of GPS Info IFD. The version is given as 2.3.0.0. This tag is
///  mandatory when GPS-related tags are present. Note that this tag is written as a different
///  byte than {@link #TAG_EXIF_VERSION}.</p>
///
///  <ul>
///      <li>Tag = 0</li>
///      <li>Type = Byte</li>
///      <li>Count = 4</li>
///      <li>Default = 2.3.0.0</li>
///      <ul>
///          <li>2300 = Version 2.3</li>
///          <li>Other = reserved</li>
///      </ul>
///  </ul>
///
const String TAG_GPS_VERSION_ID = "GPSVersionID";

///
///  <p>Indicates whether the latitude is north or south latitude.</p>
///
///  <ul>
///      <li>Tag = 1</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #LATITUDE_NORTH
///  @see #LATITUDE_SOUTH
///
const String TAG_GPS_LATITUDE_REF = "GPSLatitudeRef";

///
///  <p>Indicates the latitude. The latitude is expressed as three RATIONAL values giving
///  the degrees, minutes, and seconds, respectively. If latitude is expressed as degrees,
///  minutes and seconds, a typical format would be dd/1,mm/1,ss/1. When degrees and minutes are
///  used and, for example, fractions of minutes are given up to two decimal places, the format
///  would be dd/1,mmmm/100,0/1.</p>
///
///  <ul>
///      <li>Tag = 2</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 3</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_LATITUDE = "GPSLatitude";

///
///  <p>Indicates whether the longitude is east or west longitude.</p>
///
///  <ul>
///      <li>Tag = 3</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #LONGITUDE_EAST
///  @see #LONGITUDE_WEST
///
const String TAG_GPS_LONGITUDE_REF = "GPSLongitudeRef";

///
///  <p>Indicates the longitude. The longitude is expressed as three RATIONAL values giving
///  the degrees, minutes, and seconds, respectively. If longitude is expressed as degrees,
///  minutes and seconds, a typical format would be ddd/1,mm/1,ss/1. When degrees and minutes
///  are used and, for example, fractions of minutes are given up to two decimal places,
///  the format would be ddd/1,mmmm/100,0/1.</p>
///
///  <ul>
///      <li>Tag = 4</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 3</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_LONGITUDE = "GPSLongitude";

///
///  <p>Indicates the altitude used as the reference altitude. If the reference is sea level
///  and the altitude is above sea level, 0 is given. If the altitude is below sea level,
///  a value of 1 is given and the altitude is indicated as an absolute value in
///  {@link #TAG_GPS_ALTITUDE}.</p>
///
///  <ul>
///      <li>Tag = 5</li>
///      <li>Type = Byte</li>
///      <li>Count = 1</li>
///      <li>Default = 0</li>
///  </ul>
///
///  @see #ALTITUDE_ABOVE_SEA_LEVEL
///  @see #ALTITUDE_BELOW_SEA_LEVEL
///
const String TAG_GPS_ALTITUDE_REF = "GPSAltitudeRef";

///
///  <p>Indicates the altitude based on the reference in {@link #TAG_GPS_ALTITUDE_REF}.
///  The reference unit is meters.</p>
///
///  <ul>
///      <li>Tag = 6</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_ALTITUDE = "GPSAltitude";

///
///  <p>Indicates the time as UTC (Coordinated Universal Time). TimeStamp is expressed as three
///  unsigned rational values giving the hour, minute, and second.</p>
///
///  <ul>
///      <li>Tag = 7</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 3</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_TIMESTAMP = "GPSTimeStamp";

///
///  <p>Indicates the GPS satellites used for measurements. This tag may be used to describe
///  the number of satellites, their ID number, angle of elevation, azimuth, SNR and other
///  information in ASCII notation. The format is not specified. If the GPS receiver is incapable
///  of taking measurements, value of the tag shall be set to {@code null}.</p>
///
///  <ul>
///      <li>Tag = 8</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_SATELLITES = "GPSSatellites";

///
///  <p>Indicates the status of the GPS receiver when the image is recorded. 'A' means
///  measurement is in progress, and 'V' means the measurement is interrupted.</p>
///
///  <ul>
///      <li>Tag = 9</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #GPS_MEASUREMENT_IN_PROGRESS
///  @see #GPS_MEASUREMENT_INTERRUPTED
///
const String TAG_GPS_STATUS = "GPSStatus";

///
///  <p>Indicates the GPS measurement mode. Originally it was defined for GPS, but it may
///  be used for recording a measure mode to record the position information provided from
///  a mobile base station or wireless LAN as well as GPS.</p>
///
///  <ul>
///      <li>Tag = 10</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #GPS_MEASUREMENT_2D
///  @see #GPS_MEASUREMENT_3D
///
const String TAG_GPS_MEASURE_MODE = "GPSMeasureMode";

///
///  <p>Indicates the GPS DOP (data degree of precision). An HDOP value is written during
///  two-dimensional measurement, and PDOP during three-dimensional measurement.</p>
///
///  <ul>
///      <li>Tag = 11</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_DOP = "GPSDOP";

///
///  <p>Indicates the unit used to express the GPS receiver speed of movement.</p>
///
///  <ul>
///      <li>Tag = 12</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = {@link #GPS_SPEED_KILOMETERS_PER_HOUR}</li>
///  </ul>
///
///  @see #GPS_SPEED_KILOMETERS_PER_HOUR
///  @see #GPS_SPEED_MILES_PER_HOUR
///  @see #GPS_SPEED_KNOTS
///
const String TAG_GPS_SPEED_REF = "GPSSpeedRef";

///
///  <p>Indicates the speed of GPS receiver movement.</p>
///
///  <ul>
///      <li>Tag = 13</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_SPEED = "GPSSpeed";

///
///  <p>Indicates the reference for giving the direction of GPS receiver movement.</p>
///
///  <ul>
///      <li>Tag = 14</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = {@link #GPS_DIRECTION_TRUE}</li>
///  </ul>
///
///  @see #GPS_DIRECTION_TRUE
///  @see #GPS_DIRECTION_MAGNETIC
///
const String TAG_GPS_TRACK_REF = "GPSTrackRef";

///
///  <p>Indicates the direction of GPS receiver movement.
///  The range of values is from 0.00 to 359.99.</p>
///
///  <ul>
///      <li>Tag = 15</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_TRACK = "GPSTrack";

///
///  <p>Indicates the reference for giving the direction of the image when it is captured.</p>
///
///  <ul>
///      <li>Tag = 16</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = {@link #GPS_DIRECTION_TRUE}</li>
///  </ul>
///
///  @see #GPS_DIRECTION_TRUE
///  @see #GPS_DIRECTION_MAGNETIC
///
const String TAG_GPS_IMG_DIRECTION_REF = "GPSImgDirectionRef";

///
///  <p>ndicates the direction of the image when it was captured.
///  The range of values is from 0.00 to 359.99.</p>
///
///  <ul>
///      <li>Tag = 17</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_IMG_DIRECTION = "GPSImgDirection";

///
///  <p>Indicates the geodetic survey data used by the GPS receiver. If the survey data is
///  restricted to Japan,the value of this tag is 'TOKYO' or 'WGS-84'. If a GPS Info tag is
///  recorded, it is strongly recommended that this tag be recorded.</p>
///
///  <ul>
///      <li>Tag = 18</li>
///      <li>Type = String</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_MAP_DATUM = "GPSMapDatum";

///
///  <p>Indicates whether the latitude of the destination point is north or south latitude.</p>
///
///  <ul>
///      <li>Tag = 19</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #LATITUDE_NORTH
///  @see #LATITUDE_SOUTH
///
const String TAG_GPS_DEST_LATITUDE_REF = "GPSDestLatitudeRef";

///
///  <p>Indicates the latitude of the destination point. The latitude is expressed as three
///  unsigned rational values giving the degrees, minutes, and seconds, respectively.
///  If latitude is expressed as degrees, minutes and seconds, a typical format would be
///  dd/1,mm/1,ss/1. When degrees and minutes are used and, for example, fractions of minutes
///  are given up to two decimal places, the format would be dd/1, mmmm/100, 0/1.</p>
///
///  <ul>
///      <li>Tag = 20</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 3</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_DEST_LATITUDE = "GPSDestLatitude";

///
///  <p>Indicates whether the longitude of the destination point is east or west longitude.</p>
///
///  <ul>
///      <li>Tag = 21</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #LONGITUDE_EAST
///  @see #LONGITUDE_WEST
///
const String TAG_GPS_DEST_LONGITUDE_REF = "GPSDestLongitudeRef";

///
///  <p>Indicates the longitude of the destination point. The longitude is expressed as three
///  unsigned rational values giving the degrees, minutes, and seconds, respectively.
///  If longitude is expressed as degrees, minutes and seconds, a typical format would be ddd/1,
///  mm/1, ss/1. When degrees and minutes are used and, for example, fractions of minutes are
///  given up to two decimal places, the format would be ddd/1, mmmm/100, 0/1.</p>
///
///  <ul>
///      <li>Tag = 22</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 3</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_DEST_LONGITUDE = "GPSDestLongitude";

///
///  <p>Indicates the reference used for giving the bearing to the destination point.</p>
///
///  <ul>
///      <li>Tag = 23</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = {@link #GPS_DIRECTION_TRUE}</li>
///  </ul>
///
///  @see #GPS_DIRECTION_TRUE
///  @see #GPS_DIRECTION_MAGNETIC
///
const String TAG_GPS_DEST_BEARING_REF = "GPSDestBearingRef";

///
///  <p>Indicates the bearing to the destination point.
///  The range of values is from 0.00 to 359.99.</p>
///
///  <ul>
///      <li>Tag = 24</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_DEST_BEARING = "GPSDestBearing";

///
///  <p>Indicates the unit used to express the distance to the destination point.</p>
///
///  <ul>
///      <li>Tag = 25</li>
///      <li>Type = String</li>
///      <li>Length = 1</li>
///      <li>Default = {@link #GPS_DISTANCE_KILOMETERS}</li>
///  </ul>
///
///  @see #GPS_DISTANCE_KILOMETERS
///  @see #GPS_DISTANCE_MILES
///  @see #GPS_DISTANCE_NAUTICAL_MILES
///
const String TAG_GPS_DEST_DISTANCE_REF = "GPSDestDistanceRef";

///
///  <p>Indicates the distance to the destination point.</p>
///
///  <ul>
///      <li>Tag = 26</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_DEST_DISTANCE = "GPSDestDistance";

///
///  <p>A character string recording the name of the method used for location finding.
///  The first byte indicates the character code used, and this is followed by the name of
///  the method.</p>
///
///  <ul>
///      <li>Tag = 27</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_PROCESSING_METHOD = "GPSProcessingMethod";

///
///  <p>A character string recording the name of the GPS area. The first byte indicates
///  the character code used, and this is followed by the name of the GPS area.</p>
///
///  <ul>
///      <li>Tag = 28</li>
///      <li>Type = Undefined</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_AREA_INFORMATION = "GPSAreaInformation";

///
///  <p>A character string recording date and time information relative to UTC (Coordinated
///  Universal Time). The format is "YYYY:MM:DD".</p>
///
///  <ul>
///      <li>Tag = 29</li>
///      <li>Type = String</li>
///      <li>Length = 10</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_DATESTAMP = "GPSDateStamp";

///
///  <p>Indicates whether differential correction is applied to the GPS receiver.</p>
///
///  <ul>
///      <li>Tag = 30</li>
///      <li>Type = Unsigned short</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
///  @see #GPS_MEASUREMENT_NO_DIFFERENTIAL
///  @see #GPS_MEASUREMENT_DIFFERENTIAL_CORRECTED
///
const String TAG_GPS_DIFFERENTIAL = "GPSDifferential";

///
///  <p>This tag indicates horizontal positioning errors in meters.</p>
///
///  <ul>
///      <li>Tag = 31</li>
///      <li>Type = Unsigned rational</li>
///      <li>Count = 1</li>
///      <li>Default = None</li>
///  </ul>
///
const String TAG_GPS_H_POSITIONING_ERROR = "GPSHPositioningError";
// Interoperability IFD Attribute Information
///
///  <p>Indicates the identification of the Interoperability rule.</p>
///
///  <ul>
///      <li>Tag = 1</li>
///      <li>Type = String</li>
///      <li>Length = 4</li>
///      <li>Default = None</li>
///      <ul>
///          <li>"R98" = Indicates a file conforming to R98 file specification of Recommended
///                      Exif Interoperability Rules (Exif R 98) or to DCF basic file stipulated
///                      by Design Rule for Camera File System.</li>
///          <li>"THM" = Indicates a file conforming to DCF thumbnail file stipulated by Design
///                      rule for Camera File System.</li>
///          <li>“R03” = Indicates a file conforming to DCF Option File stipulated by Design rule
///                      for Camera File System.</li>
///      </ul>
///  </ul>
///
const String TAG_INTEROPERABILITY_INDEX = "InteroperabilityIndex";

///
/// @see #TAG_IMAGE_LENGTH
///
const String TAG_THUMBNAIL_IMAGE_LENGTH = "ThumbnailImageLength";

///
/// @see #TAG_IMAGE_WIDTH
///
const String TAG_THUMBNAIL_IMAGE_WIDTH = "ThumbnailImageWidth";

const String TAG_THUMBNAIL_ORIENTATION = "ThumbnailOrientation";

/// Type is int. DNG Specification 1.4.0.0. Section 4 ///
const String TAG_DNG_VERSION = "DNGVersion";

/// Type is int. DNG Specification 1.4.0.0. Section 4 ///
const String TAG_DEFAULT_CROP_SIZE = "DefaultCropSize";

/// Type is undefined. See Olympus MakerNote tags in http://www.exiv2.org/tags-olympus.html. ///
const String TAG_ORF_THUMBNAIL_IMAGE = "ThumbnailImage";

/// Type is int. See Olympus Camera Settings tags in http://www.exiv2.org/tags-olympus.html. ///
const String TAG_ORF_PREVIEW_IMAGE_START = "PreviewImageStart";

/// Type is int. See Olympus Camera Settings tags in http://www.exiv2.org/tags-olympus.html. ///
const String TAG_ORF_PREVIEW_IMAGE_LENGTH = "PreviewImageLength";

/// Type is int. See Olympus Image Processing tags in http://www.exiv2.org/tags-olympus.html. ///
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
