import 'package:flutter/material.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/actor_preset_materials.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/actor_preset_meshes.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/actor_preset_sensors.dart';
import 'package:seereye_app/view/widgets/visitor/preset/material_properties_visit.dart';
import 'package:seereye_app/view/widgets/visitor/preset/mesh_properties_visit.dart';
import 'package:seereye_app/view/widgets/visitor/preset/sensor_properties_visit.dart';

class ActorPresetVisitor {
  Widget noProperties() {
    return Container();
  }

  Widget actorPresetMeshProperties(ActorPresetMeshes actorPresetMeshes) {
    return MeshPropertiesVisit(actorPresetMeshes);
  }

  Widget actorPresetMaterialsProperties(
      ActorPresetMaterials actorPresetMaterials) {
    return MaterialPropertiesVisit(actorPresetMaterials);
  }

  Widget actorPresetSensorsProperties(ActorPresetSensors actorPresetSensors) {
    return SensorPropertiesVisit(actorPresetSensors);
  }
}

abstract class ActorPresetHost {
  Widget accept(ActorPresetVisitor visitor);
}
