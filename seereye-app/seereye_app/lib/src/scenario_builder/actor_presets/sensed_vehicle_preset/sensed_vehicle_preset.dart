import 'dart:async';

import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/actor_preset_sensors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/sensor.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/vehicle_preset/vehicle_preset.dart';

class SensedVehiclePreset extends VehiclePreset {
  VehiclePreset? vehiclePreset = null;
  final List<StreamSubscription> listener = [];

  SensedVehiclePreset(
      {required int ID,
      required String name,
      Map? presetElementsMap,
      bool isDefault = false})
      : super(
            ID: ID,
            name: name,
            presetElementsMap: presetElementsMap,
            isDefault: isDefault) {
    _jsonListObjectToPresetElementList(presetElementsMap);
  }

  SensedVehiclePreset.base()
      : this(ID: 0, name: SENSED_VEHICLE_PRESETS_DEFAULT_NAME, isDefault: true);

  SensedVehiclePreset.fromJson(dynamic json)
      : this(
            ID: json[PRESET_ID_JSON_NAME],
            name: json[PRESET_NAME_JSON_NAME],
            presetElementsMap: json[PRESET_ELEMENTS_JSON_NAME],
            isDefault: json[PRESET_ISDEFAULT_JSON_NAME]);

  void _jsonListObjectToPresetElementList(Map? jsonMapObject) {
    bool useBase = jsonMapObject == null;
    for (var jsonPresetElm in SENSED_VEHICLE_ELEMENTS_JSON_OBJECT_LIST) {
      switch (jsonPresetElm.jsonName) {
        case SENSORS_JSON_NAME:
          this.presetElementsMap[ActorPresetSensors] = useBase
              ? ActorPresetSensors(this.mesh, this.isDefault)
              : ActorPresetSensors.fromJson(
                  jsonMapObject[SENSORS_JSON_NAME], this.mesh, isDefault);
          break;
        default:
          throw ImpossibleToLoad___Error('Sensed Vehicle Preset Element');
      }
    }
  }

  void changeVehiclePreset(VehiclePreset? vehiclePreset) {
    this.vehiclePreset = vehiclePreset;
    final keyList = this.vehiclePreset?.presetElementsMap.keys;
    if (keyList != null) {
      for (var key in keyList) {
        this.presetElementsMap[key] =
            this.vehiclePreset!.presetElementsMap[key]!;
        listener.add(
            this.presetElementsMap[key]!.elementChangeEvent.listen((value) {
          if (value == SensedVehiclePreset) changeVehiclePreset(null);
        }));
      }
    } else {
      listener.forEach((elm) {
        elm.cancel();
      });
      listener.clear();
      final vehicleMapCopy = Map.from(this.presetElementsMap);
      for (var key in this.presetElementsMap.keys) {
        this.presetElementsMap[key] = vehicleMapCopy[key]!;
        listener.add(
            this.presetElementsMap[key]!.elementChangeEvent.listen((value) {
          if (value == SensedVehiclePreset) changeVehiclePreset(null);
        }));
      }
    }
  }

  List<Sensor> get sensors =>
      (this.presetElementsMap[ActorPresetSensors] as ActorPresetSensors)
          .sensorsList;

  Sensor getSensor(String name) {
    return sensors.firstWhere((sensor) => sensor.name == name);
  }

  @override
  String toString() {
    String jsonString = super.toString();
    jsonString = jsonString.substring(0, jsonString.length - 2);

    for (var jsonElmObj in SENSED_VEHICLE_ELEMENTS_JSON_OBJECT_LIST) {
      jsonString +=
          ',"${jsonElmObj.jsonName}" : ${presetElementsMap[jsonElmObj.type]}';
    }

    return '$jsonString}}';
  }
}
