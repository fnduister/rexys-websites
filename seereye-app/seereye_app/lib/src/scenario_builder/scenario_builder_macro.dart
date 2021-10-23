import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_element.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/actor_preset_materials.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/actor_preset_meshes.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/actor_preset_sensors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/pedestrian_preset/pedestrian_preset.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/sensed_vehicle_preset/sensed_vehicle_preset.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/vehicle_preset/vehicle_preset.dart';

const String ACTOR_PRESET_DEFAULT_NAME = 'Actor Default Preset';

const String ACTOR_PRESETS_JSON_NAME = 'ActorPresets';
const String PRESETS_JSON_NAME = 'Presets';
const String PRESET_ID_JSON_NAME = 'presetId';
const String PRESET_CURRENT_ID_JSON_NAME = 'PresetCurrentID';
const String PRESET_NAME_JSON_NAME = 'PresetName';
const String PRESET_ELEMENTS_JSON_NAME = 'PresetElements';
const String PRESET_ISDEFAULT_JSON_NAME = 'IsDefault';

const List<ActorPresetInfo> ACTORS_PRESETS_JSON_OBJECT_LIST = [
  ActorPresetInfo(
      type: SensedVehiclePreset,
      name: SENSED_VEHICLE_PRESETS_NAME,
      jsonName: SENSED_VEHICLE_PRESETS_JSON_NAME),
  ActorPresetInfo(
      type: VehiclePreset,
      name: VEHICLE_PRESETS_NAME,
      jsonName: VEHICLE_PRESETS_JSON_NAME),
  ActorPresetInfo(
      type: PedestrianPreset,
      name: PEDESTRIAN_PRESETS_NAME,
      jsonName: PEDESTRIAN_PRESETS_JSON_NAME),
];

class ActorPresetInfo {
  final Type type;
  final String name;
  final String jsonName;
  const ActorPresetInfo({this.type = Null, this.name = '', this.jsonName = ''});
}

const String SENSED_VEHICLE_PRESETS_NAME = WordBank.sensedVehiclePresets;
const String SENSED_VEHICLE_PRESETS_JSON_NAME = 'SensedVehiclePresets';
const String SENSED_VEHICLE_PRESETS_DEFAULT_NAME =
    '$SENSED_VEHICLE_PRESETS_NAMING Default';
final Map<String, ActorPresetElement> SENSED_VEHICLE_PRESETS_DEFAULT_MAP = {
  SENSORS_JSON_NAME: ActorPresetSensors()
};

const String VEHICLE_PRESETS_NAME = WordBank.vehiclePresets;
const String VEHICLE_PRESETS_JSON_NAME = 'VehiclePresets';
const String VEHICLE_PRESETS_DEFAULT_NAME = '$VEHICLE_PRESETS_NAMING Default';
final Map<String, ActorPresetElement> VEHICLE_PRESETS_DEFAULT_MAP = {
  MESH_JSON_NAME: VehiclePresetMeshes(),
  MATERIALS_JSON_NAME: VehiclePresetMaterials()
};

const String PEDESTRIAN_PRESETS_NAME = WordBank.pedestrianPresets;
const String PEDESTRIAN_PRESETS_JSON_NAME = 'PedestrianPresets';
const String PEDESTRIAN_PRESETS_DEFAULT_NAME =
    '$PEDESTRIAN_PRESETS_NAMING Default';
final Map<String, ActorPresetElement> PEDESTRIAN_PRESETS_DEFAULT_MAP = {
  MESH_JSON_NAME: PedestrianPresetMeshes(),
  MATERIALS_JSON_NAME: PedestrianPresetMaterials()
};

const String SENSED_VEHICLE_PRESETS_NAMING = 'Sensed Vehicle Preset';
const String VEHICLE_PRESETS_NAMING = 'Vehicle Preset';
const String PEDESTRIAN_PRESETS_NAMING = 'Pedestrian Preset';

// This list completes the vehicle one
const List<ActorPresetInfo> SENSED_VEHICLE_ELEMENTS_JSON_OBJECT_LIST = [
  ActorPresetInfo(
      type: ActorPresetSensors,
      name: SENSORS_NAME,
      jsonName: SENSORS_JSON_NAME),
];

const List<ActorPresetInfo> VEHICLE_ELEMENTS_JSON_OBJECT_LIST = [
  ActorPresetInfo(
      type: ActorPresetMeshes, name: MESH_NAME, jsonName: MESH_JSON_NAME),
  ActorPresetInfo(
      type: ActorPresetMaterials,
      name: MATERIALS_NAME,
      jsonName: MATERIALS_JSON_NAME),
];

const List<ActorPresetInfo> PEDESTRIAN_ELEMENTS_JSON_OBJECT_LIST = [
  ActorPresetInfo(
      type: ActorPresetMeshes, name: MESH_NAME, jsonName: MESH_JSON_NAME),
  ActorPresetInfo(
      type: ActorPresetMaterials,
      name: MATERIALS_NAME,
      jsonName: MATERIALS_JSON_NAME),
];

const String MATERIALS_NAME = WordBank.materials;
const String MATERIALS_JSON_NAME = 'Materials';

const String MESH_NAME = WordBank.meshes;
const String MESH_JSON_NAME = 'MeshName';

const String DEFAULT_CAR_MESH = 'ChaosCar';
const String DEFAULT_PEDESTRIAN_MESH = 'Adult_Male';

const String SENSORS_NAME = WordBank.sensors;
const String SENSORS_JSON_NAME = 'Sensors';
const String SENSOR_TYPE_JSON_NAME = 'Type';
const String SENSOR_NAME_JSON_NAME = 'Name';
const String SENSOR_PARAM_JSON_NAME = 'Params';
const String PARAM_NAME_JSON_NAME = 'Name';
const String PARAM_DISPLAY_NAME_JSON_NAME = 'DisplayName';
const String PARAM_VALUE_JSON_NAME = 'Value';
const String PARAM_HIDE_JSON_NAME = 'Hide';
const String SENSOR_INSTANCE_NAME_JSON_NAME = 'InstanceName';

const String MATERIAL_LIST = 'MaterialList';

const String LIDAR_JSON_NAME = 'Lidar';
const String RADAR_JSON_NAME = 'Radar';
const String CAMERA_JSON_NAME = 'Camera';
const String IR_CAMERA_JSON_NAME = 'IRCamera';
const String THERMAL_CAMERA_JSON_NAME = 'ThermalCamera';
