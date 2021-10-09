import 'package:seereye_app/macro.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_element.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/pedestrian_preset/pedestrian_preset.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/sensed_vehicle_preset/sensed_vehicle_preset.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/vehicle_preset/vehicle_preset.dart';
import 'package:seereye_app/src/scenario_builder/scenario_builder_macro.dart';

export 'package:seereye_app/src/scenario_builder/scenario_builder_macro.dart';
export 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_element.dart';
export 'package:seereye_app/macro.dart';

class ActorPresets {
  final Map<Type, ActorPresetList> actorPresetsMap = {};

  ActorPresets() {
    for (var jsonElmObj in ACTORS_PRESETS_JSON_OBJECT_LIST) {
      actorPresetsMap[jsonElmObj.type] = ActorPresetList(
          presetTypeName: jsonElmObj.name,
          presetType: jsonElmObj.type,
          presets: [_loadBaseActorPreset(jsonElmObj.type)],
          currentID: 0);
    }
  }

  ActorPresets.fromJson(dynamic json) {
    for (var jsonElmObj in ACTORS_PRESETS_JSON_OBJECT_LIST) {
      dynamic jsonElm = json[jsonElmObj.jsonName];
      actorPresetsMap[jsonElmObj.type] = ActorPresetList(
          presetTypeName: jsonElmObj.name,
          presetType: jsonElmObj.type,
          presets: _jsonListObjectToActorPresetList(
              jsonElmObj.type, jsonElm[PRESETS_JSON_NAME]),
          currentID: jsonElm[PRESET_CURRENT_ID_JSON_NAME]);
    }
  }

  ActorPreset _loadBaseActorPreset(Type type) {
    switch (type) {
      case SensedVehiclePreset:
        return SensedVehiclePreset.base();
      case VehiclePreset:
        return VehiclePreset.base();
      case PedestrianPreset:
        return PedestrianPreset.base();
      default:
        throw ImpossibleToLoad___Error('Actor');
    }
  }

  List<ActorPreset> _jsonListObjectToActorPresetList(
      Type type, List jsonListObject) {
    switch (type) {
      case SensedVehiclePreset:
        return jsonListObject
            .map((jsonObject) => SensedVehiclePreset.fromJson(jsonObject))
            .toList();
      case VehiclePreset:
        return jsonListObject
            .map((jsonObject) => VehiclePreset.fromJson(jsonObject))
            .toList();
      case PedestrianPreset:
        return jsonListObject
            .map((jsonObject) => PedestrianPreset.fromJson(jsonObject))
            .toList();
      default:
        throw ImpossibleToLoad___Error('Actor');
    }
  }

  List<ActorPresetList> get actorPresetList => actorPresetsMap.values.toList();

  @override
  String toString() {
    String jsonString = '';

    for (var jsonElmObj in ACTORS_PRESETS_JSON_OBJECT_LIST) {
      jsonString +=
          '"${jsonElmObj.jsonName}": ${actorPresetsMap[jsonElmObj.type]},';
    }
    return jsonString.isEmpty
        ? '{}'
        : '{${jsonString.substring(0, jsonString.length - 1)}}';
  }
}

class ActorPresetList {
  final String presetTypeName;
  final Type presetType;
  final List<ActorPreset> presets;

  int currentID;

  ActorPresetList({
    required this.presetTypeName,
    required this.presetType,
    required this.presets,
    required this.currentID,
  });

  void addNewPreset() {
    String newPresetNaming = '';
    ActorPreset presetToAdd;

    switch (presets[0].runtimeType) {
      case SensedVehiclePreset:
        newPresetNaming = SENSED_VEHICLE_PRESETS_NAMING;
        presetToAdd =
            SensedVehiclePreset(name: newPresetNaming, ID: ++currentID);
        break;
      case VehiclePreset:
        newPresetNaming = VEHICLE_PRESETS_NAMING;
        presetToAdd = VehiclePreset(name: newPresetNaming, ID: ++currentID);
        break;
      case PedestrianPreset:
        newPresetNaming = PEDESTRIAN_PRESETS_NAMING;
        presetToAdd = PedestrianPreset(name: newPresetNaming, ID: ++currentID);
        break;
      default:
        throw ImpossibleToAdd___Error('New Preset');
    }

    int newNameInt = 1;
    String newName = '$newPresetNaming $newNameInt';
    while (presets.any((element) => element.name == newName)) {
      newName = '$newPresetNaming ${++newNameInt}';
    }
    presetToAdd.name = newName;

    presets.add(presetToAdd);
  }

  void removePreset(ActorPreset actorPresetToRemove) {
    presets.removeWhere((preset) => preset == actorPresetToRemove);
  }

  bool changePresetName(ActorPreset actorPreset, String newName) {
    ActorPreset curActorPreset =
        presets.firstWhere((pre) => pre == actorPreset);
    if (curActorPreset.isDefault ||
        presets.any((element) => element.name == newName)) return false;

    curActorPreset.name = newName;
    return true;
  }

  @override
  String toString() {
    String jsonString =
        '{"$PRESET_CURRENT_ID_JSON_NAME" : $currentID, "$PRESETS_JSON_NAME" : $presets}';

    return jsonString;
  }
}

class ActorPreset {
  final int ID;
  String name;
  final bool isDefault;
  final Map<Type, ActorPresetElement> presetElementsMap = {};
  Mesh mesh;

  ActorPreset(
      {required this.name,
      required this.ID,
      required this.mesh,
      this.isDefault = false});

  ActorPreset.base()
      : this(
            ID: 0,
            name: ACTOR_PRESET_DEFAULT_NAME,
            mesh: Mesh.base(),
            isDefault: true);

  List<ActorPresetElement> get presetElements =>
      presetElementsMap.values.toList();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ActorPreset && other.ID == ID;
  }

  @override
  String toString() {
    String jsonString =
        '{"$PRESET_ID_JSON_NAME" : $ID, "$PRESET_NAME_JSON_NAME" : "$name",  "$PRESET_ISDEFAULT_JSON_NAME" : $isDefault, "$PRESET_ELEMENTS_JSON_NAME" : {}}';

    return '$jsonString';
  }

  String toScenarioString() {
    String jsonString = '"$PRESET_ID_JSON_NAME" : $ID';
    return '$jsonString';
  }

  String toUEString() {
    String jsonString = '';
    for (var elem in presetElements) {
      jsonString += '${elem.toUEString()},';
    }

    return jsonString.isEmpty
        ? ''
        : '${jsonString.substring(0, jsonString.length - 1)}';
  }
}
