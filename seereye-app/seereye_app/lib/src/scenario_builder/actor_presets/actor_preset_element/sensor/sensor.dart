import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/macro.dart';
import 'package:seereye_app/src/scenario/actors/transform.dart';
import 'package:seereye_app/src/scenario_builder/param.dart';
import 'package:seereye_app/src/scenario_builder/scenario_builder_macro.dart';
import 'package:seereye_app/src/transformable.dart';

// #region Sensors_Macro
const String weight = 'Weight';
const String materialName = 'MaterialName';

const String whiteBalanceTemp = 'WhiteBalanceTemp';
const String whiteBalanceTint = 'WhiteBalanceTint';
const String colorGradingSaturation = 'ColorGradingSaturation';
const String colorGradingContrast = 'ColorGradingContrast';
const String colorGradingGamma = 'ColorGradingGamma';
const String colorGradingGain = 'ColorGradingGain';
const String colorGradingOffset = 'ColorGradingOffset';
const String shutterSpeed = 'ShutterSpeed';
const String ISO = 'ISO';
const String aperture = 'Aperture';
const String maxAperture = 'MaxAperture';
const String diaphramBlades = 'DiaphramBlades';
const String lensFlareIntensity = 'LensFlareIntensity';
const String lensFlareTint = 'LensFlareTint';
const String lensFlareThreshold = 'LensFlareThreshold';
const String sensorWidth = 'SensorWidth';
const String focalDistance = 'FocalDistance';
const String FOV = 'FOV';

const String channels = 'Channels';
const String range = 'Range';
const String pointsPerSeconds = 'PointsPerSeconds';
const String rotationFrequency = 'RotationFrequency';
const String upperFovLimit = 'UpperFovLimit';
const String lowerFovLimit = 'LowerFovLimit';
const String verticalFov = 'VerticalFov';
const String horizontalFov = 'HorizontalFov';
const String socketIoAdressPort = 'SocketIoAdressPort';
// #endregion Sensors_Macro

class Sensor extends Transformable {
  late String name;
  final String type;
  late final List<Param> params;

  Sensor(
      {required this.type,
      Transform? transform,
      String? name,
      List<Param>? params}) {
    this.name = name ?? type;
    this.transform = transform ?? Transform();
    this.params = params ?? sensorsTypeMap[this.type] ?? [];
  }

  factory Sensor.fromJson(dynamic json) {
    Sensor newSensor = Sensor(
        name: json[SENSOR_NAME_JSON_NAME],
        type: json[SENSOR_TYPE_JSON_NAME],
        transform: Transform.fromJson(json[TRANSFORM]),
        params: []);
    for (var item in json[SENSOR_PARAM_JSON_NAME]) {
      newSensor.params.add(Param.fromJson(item));
    }
    return newSensor;
  }

  @override
  String toString() {
    return '{"$SENSOR_NAME_JSON_NAME" : "$name", "$SENSOR_TYPE_JSON_NAME" : "$type", "$SENSOR_INSTANCE_NAME_JSON_NAME" : "node_lt", $transform, "$SENSOR_PARAM_JSON_NAME" : $params}';
  }

  String toUEString() {
    String jsonString = '';

    for (var param in params) {
      jsonString += '${param.toUEString()},';
    }

    jsonString = jsonString.isEmpty
        ? '[]'
        : '[${jsonString.substring(0, jsonString.length - 1)}]';

    return '{"$SENSOR_NAME_JSON_NAME" : "$name", "$SENSOR_TYPE_JSON_NAME" : "$type", "$SENSOR_INSTANCE_NAME_JSON_NAME" : "node_lt", $transform, "$SENSOR_PARAM_JSON_NAME" : $jsonString}';
  }
}

Map<String, List<Param>> sensorsTypeMap = {
  CAMERA_JSON_NAME: [
    Param<String>(whiteBalanceTemp,
        {EN: 'White Balance Temp', FR: 'White Balance Temp'}, '6500'),
    Param<String>(whiteBalanceTint,
        {EN: 'White Balance Tint', FR: 'White Balance Tint'}, '0'),
    Param<Map<String, int>>(
        colorGradingSaturation,
        {EN: 'Color Grading Saturation', FR: 'Color Grading Saturation'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingContrast,
        {EN: 'Color Grading Contrast', FR: 'Color Grading Contrast'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingGamma,
        {EN: 'Color Grading Gamma', FR: 'Color Grading Gamma'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingGain,
        {EN: 'Color Grading Gain', FR: 'Color Grading Gain'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingOffset,
        {EN: 'Color Grading Offset', FR: 'Color Grading Offset'},
        {'X': 0, 'Y': 0, 'Z': 0, 'W': 0}),
    Param<String>(
        shutterSpeed, {EN: 'Shutter Speed', FR: 'Shutter Speed'}, '60'),
    Param<String>(ISO, {EN: 'ISO', FR: 'ISO'}, '100'),
    Param<String>(aperture, {EN: 'Aperture', FR: 'Aperture'}, '4'),
    Param<String>(maxAperture, {EN: 'Max Aperture', FR: 'Max Aperture'}, '1.2'),
    Param<String>(
        diaphramBlades, {EN: 'Diaphram Blades', FR: 'Diaphram Blades'}, '5'),
    Param<String>(lensFlareIntensity,
        {EN: 'Lens Flare Intensity', FR: 'Lens Flare Intensity'}, '1'),
    Param<Map<String, int>>(
        lensFlareTint,
        {EN: 'Lens Flare Tint', FR: 'Lens Flare Tint'},
        {'R': 1, 'G': 1, 'B': 1, 'A': 1}),
    Param<String>(lensFlareThreshold,
        {EN: 'Lens Flare Threshold', FR: 'Lens Flare Threshold'}, '8'),
    Param<String>(
        sensorWidth, {EN: 'Sensor Width', FR: 'Sensor Width'}, '24.576'),
    Param<String>(
        focalDistance, {EN: 'Focal Distance', FR: 'Focal Distance'}, '0'),
    Param<String>(FOV, {EN: 'FOV', FR: 'FOV'}, '100')
  ],
  IR_CAMERA_JSON_NAME: [
    Param<String>(weight, {EN: 'Weight', FR: 'Weight'}, '1'),
    Param<String>(
        materialName, {EN: 'Material Name', FR: 'Material Name'}, '0'),
    Param<String>(whiteBalanceTemp,
        {EN: 'White Balance Temp', FR: 'White Balance Temp'}, '6500'),
    Param<String>(whiteBalanceTint,
        {EN: 'White Balance Tint', FR: 'White Balance Tint'}, '0'),
    Param<Map<String, int>>(
        colorGradingSaturation,
        {EN: 'Color Grading Saturation', FR: 'Color Grading Saturation'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingContrast,
        {EN: 'Color Grading Contrast', FR: 'Color Grading Contrast'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingGamma,
        {EN: 'Color Grading Gamma', FR: 'Color Grading Gamma'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingGain,
        {EN: 'Color Grading Gain', FR: 'Color Grading Gain'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingOffset,
        {EN: 'Color Grading Offset', FR: 'Color Grading Offset'},
        {'X': 0, 'Y': 0, 'Z': 0, 'W': 0}),
    Param<String>(
        shutterSpeed, {EN: 'Shutter Speed', FR: 'Shutter Speed'}, '60'),
    Param<String>(ISO, {EN: 'ISO', FR: 'ISO'}, '100'),
    Param<String>(aperture, {EN: 'Aperture', FR: 'Aperture'}, '4'),
    Param<String>(maxAperture, {EN: 'Max Aperture', FR: 'Max Aperture'}, '1.2'),
    Param<String>(
        diaphramBlades, {EN: 'Diaphram Blades', FR: 'Diaphram Blades'}, '5'),
    Param<String>(lensFlareIntensity,
        {EN: 'Lens Flare Intensity', FR: 'Lens Flare Intensity'}, '1'),
    Param<Map<String, int>>(
        lensFlareTint,
        {EN: 'Lens Flare Tint', FR: 'Lens Flare Tint'},
        {'R': 1, 'G': 1, 'B': 1, 'A': 1}),
    Param<String>(lensFlareThreshold,
        {EN: 'Lens Flare Threshold', FR: 'Lens Flare Threshold'}, '8'),
    Param<String>(
        sensorWidth, {EN: 'Sensor Width', FR: 'Sensor Width'}, '24.576'),
    Param<String>(
        focalDistance, {EN: 'Focal Distance', FR: 'Focal Distance'}, '0'),
    Param<String>(FOV, {EN: 'FOV', FR: 'FOV'}, '100')
  ],
  THERMAL_CAMERA_JSON_NAME: [
    Param<String>(weight, {EN: 'Weight', FR: 'Weight'}, '1'),
    Param<String>(
        materialName, {EN: 'Material Name', FR: 'Material Name'}, '0'),
    Param<String>(whiteBalanceTemp,
        {EN: 'White Balance Temp', FR: 'White Balance Temp'}, '6500'),
    Param<String>(whiteBalanceTint,
        {EN: 'White Balance Tint', FR: 'White Balance Tint'}, '0'),
    Param<Map<String, int>>(
        colorGradingSaturation,
        {EN: 'Color Grading Saturation', FR: 'Color Grading Saturation'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingContrast,
        {EN: 'Color Grading Contrast', FR: 'Color Grading Contrast'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingGamma,
        {EN: 'Color Grading Gamma', FR: 'Color Grading Gamma'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingGain,
        {EN: 'Color Grading Gain', FR: 'Color Grading Gain'},
        {'X': 1, 'Y': 1, 'Z': 1, 'W': 1}),
    Param<Map<String, int>>(
        colorGradingOffset,
        {EN: 'Color Grading Offset', FR: 'Color Grading Offset'},
        {'X': 0, 'Y': 0, 'Z': 0, 'W': 0}),
    Param<String>(
        shutterSpeed, {EN: 'Shutter Speed', FR: 'Shutter Speed'}, '60'),
    Param<String>(ISO, {EN: 'ISO', FR: 'ISO'}, '100'),
    Param<String>(aperture, {EN: 'Aperture', FR: 'Aperture'}, '4'),
    Param<String>(maxAperture, {EN: 'Max Aperture', FR: 'Max Aperture'}, '1.2'),
    Param<String>(
        diaphramBlades, {EN: 'Diaphram Blades', FR: 'Diaphram Blades'}, '5'),
    Param<String>(lensFlareIntensity,
        {EN: 'Lens Flare Intensity', FR: 'Lens Flare Intensity'}, '1'),
    Param<Map<String, int>>(
        lensFlareTint,
        {EN: 'Lens Flare Tint', FR: 'Lens Flare Tint'},
        {'R': 1, 'G': 1, 'B': 1, 'A': 1}),
    Param<String>(lensFlareThreshold,
        {EN: 'Lens Flare Threshold', FR: 'Lens Flare Threshold'}, '8'),
    Param<String>(
        sensorWidth, {EN: 'Sensor Width', FR: 'Sensor Width'}, '24.576'),
    Param<String>(
        focalDistance, {EN: 'Focal Distance', FR: 'Focal Distance'}, '0'),
    Param<String>(FOV, {EN: 'FOV', FR: 'FOV'}, '100')
  ],
  LIDAR_JSON_NAME: [
    Param<String>(channels, {EN: 'Channels', FR: 'Channels'}, '16'),
    Param<String>(range, {EN: 'Range', FR: 'Range'}, '1500'),
    Param<String>(pointsPerSeconds,
        {EN: 'Points Per Seconds', FR: 'Points Per Seconds'}, '200000'),
    Param<String>(rotationFrequency,
        {EN: 'Rotation Frequency', FR: 'Rotation Frequency'}, '30'),
    Param<String>(
        upperFovLimit, {EN: 'Upper FOV Limit', FR: 'Upper FOV Limit'}, '10'),
    Param<String>(
        lowerFovLimit, {EN: 'Lower FOV Limit', FR: 'Lower FOV Limit'}, '-30'),
    Param<String>(
        horizontalFov, {EN: 'Horizontal FOV', FR: 'Horizontal FOV'}, '360'),
    Param<String>(
        socketIoAdressPort,
        {EN: 'SocketIoAdressPort', FR: 'SocketIoAdressPort'},
        'http://localhost:3000',
        hide: true)
  ],
  RADAR_JSON_NAME: [
    Param<String>(range, {EN: 'Range', FR: 'Range'}, '1500'),
    Param<String>(pointsPerSeconds,
        {EN: 'Points Per Seconds', FR: 'Points Per Seconds'}, '60000'),
    Param<String>(verticalFov, {EN: 'Vertical FOV', FR: 'Vertical FOV'}, '30'),
    Param<String>(
        horizontalFov, {EN: 'Horizontal FOV', FR: 'Horizontal FOV'}, '40'),
    Param<String>(
        socketIoAdressPort,
        {EN: 'SocketIoAdressPort', FR: 'SocketIoAdressPort'},
        'http://localhost:3000',
        hide: true)
  ]
};
