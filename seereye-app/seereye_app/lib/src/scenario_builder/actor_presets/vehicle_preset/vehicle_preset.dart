import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/actor_preset_materials.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/actor_preset_meshes.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';

class VehiclePreset extends ActorPreset {
  VehiclePreset(
      {required int ID,
      required String name,
      Map? presetElementsMap,
      bool isDefault = false})
      : super(
            ID: ID,
            name: name,
            mesh: Mesh.clone(vehicleMeshListJson.first),
            isDefault: isDefault) {
    _jsonListObjectToPresetElementList(presetElementsMap);
  }

  VehiclePreset.base()
      : this(ID: 0, name: VEHICLE_PRESETS_DEFAULT_NAME, isDefault: true);

  VehiclePreset.fromJson(dynamic json)
      : this(
            ID: json[PRESET_ID_JSON_NAME],
            name: json[PRESET_NAME_JSON_NAME],
            presetElementsMap: json[PRESET_ELEMENTS_JSON_NAME],
            isDefault: json[PRESET_ISDEFAULT_JSON_NAME]);

  void _jsonListObjectToPresetElementList(Map? jsonMapObject) {
    bool useBase = jsonMapObject == null;
    for (var jsonPresetElm in VEHICLE_ELEMENTS_JSON_OBJECT_LIST) {
      switch (jsonPresetElm.jsonName) {
        case MATERIALS_JSON_NAME:
          this.presetElementsMap[jsonPresetElm.type] = useBase
              ? VehiclePresetMaterials(mesh, isDefault)
              : VehiclePresetMaterials.fromJson(
                  jsonMapObject[MATERIALS_JSON_NAME], mesh, isDefault);
          break;
        case MESH_JSON_NAME:
          this.presetElementsMap[jsonPresetElm.type] = useBase
              ? VehiclePresetMeshes(mesh, isDefault)
              : VehiclePresetMeshes.fromJson(
                  jsonMapObject[MESH_JSON_NAME], mesh, isDefault);

          break;
        default:
          throw ImpossibleToLoad___Error('Vehicle Preset Element');
      }
    }
  }

  @override
  String toString() {
    String jsonString = super.toString();
    jsonString = jsonString.substring(0, jsonString.length - 2);

    for (var jsonElmObj in VEHICLE_ELEMENTS_JSON_OBJECT_LIST) {
      jsonString +=
          '"${jsonElmObj.jsonName}" : ${presetElementsMap[jsonElmObj.type]},';
    }

    return '${jsonString.substring(0, jsonString.length - 1)}}}';
  }
}
