import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/actor_preset_materials.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/actor_preset_meshes.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';

class PedestrianPreset extends ActorPreset {
  PedestrianPreset(
      {required int ID,
      required String name,
      Map? presetElementsMap,
      bool isDefault = false})
      : super(
            ID: ID,
            name: name,
            mesh: Mesh.clone(pedestrianMeshListJson.first),
            isDefault: isDefault) {
    _jsonListObjectToPresetElementList(presetElementsMap);
  }

  PedestrianPreset.base()
      : this(ID: 0, name: PEDESTRIAN_PRESETS_DEFAULT_NAME, isDefault: true);

  PedestrianPreset.fromJson(dynamic json)
      : this(
            ID: json[PRESET_ID_JSON_NAME],
            name: json[PRESET_NAME_JSON_NAME],
            presetElementsMap: json[PRESET_ELEMENTS_JSON_NAME],
            isDefault: json[PRESET_ISDEFAULT_JSON_NAME]);

  void _jsonListObjectToPresetElementList(Map? jsonMapObject) {
    bool useBase = jsonMapObject == null;
    for (var jsonPresetElm in PEDESTRIAN_ELEMENTS_JSON_OBJECT_LIST) {
      switch (jsonPresetElm.jsonName) {
        case MATERIALS_JSON_NAME:
          this.presetElementsMap[jsonPresetElm.type] = useBase
              ? PedestrianPresetMaterials(mesh, isDefault)
              : PedestrianPresetMaterials.fromJson(
                  jsonMapObject[MATERIALS_JSON_NAME], mesh, isDefault);
          break;
        case MESH_JSON_NAME:
          this.presetElementsMap[jsonPresetElm.type] = useBase
              ? PedestrianPresetMeshes(mesh, isDefault)
              : PedestrianPresetMeshes.fromJson(
                  jsonMapObject[MESH_JSON_NAME], mesh, isDefault);
          break;
        default:
          throw ImpossibleToLoad___Error('Pedestrian Preset Element');
      }
    }
  }

  @override
  String toString() {
    String jsonString = super.toString();
    jsonString = jsonString.substring(0, jsonString.length - 2);

    for (var jsonElmObj in PEDESTRIAN_ELEMENTS_JSON_OBJECT_LIST) {
      jsonString +=
          '"${jsonElmObj.jsonName}" : ${presetElementsMap[jsonElmObj.type]},';
    }

    return '${jsonString.substring(0, jsonString.length - 1)}}}';
  }
}
