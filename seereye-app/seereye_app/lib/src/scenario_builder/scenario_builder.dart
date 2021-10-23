import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/actor_preset_materials.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/material.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/actor_preset_meshes.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/sensor.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';
import 'package:seereye_app/src/scenario_builder/param.dart';
import 'actor_presets/actor_preset_element/mesh/mesh.dart';

class ScenarioBuilder {
  late final ActorPresets actorPresetField;
  Map<Type, List<Mesh>> meshMap = {};
  Map<Type, List<Material<List<String>>>> materialMap = {};
  Map<String, List<Param>> sensorMap = sensorsTypeMap;

  ScenarioBuilder({ActorPresets? actorPresetField}) {
    this.actorPresetField = actorPresetField ?? ActorPresets();

    this.meshMap[VehiclePresetMeshes] = vehicleMeshListJson;
    this.meshMap[PedestrianPresetMeshes] = pedestrianMeshListJson;

    this.materialMap[VehiclePresetMaterials] = vehicleMaterials;
    this.materialMap[PedestrianPresetMaterials] = pedestrianMaterials;
  }
  ScenarioBuilder.fromJson(dynamic json)
      : this(
          actorPresetField:
              ActorPresets.fromJson(json[ACTOR_PRESETS_JSON_NAME]),
        );

  @override
  String toString() {
    return '{"$ACTOR_PRESETS_JSON_NAME": ${this.actorPresetField}}';
  }
}
