import 'package:flutter/material.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_element.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/material.dart'
    as m;
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';

abstract class ActorPresetMaterials extends ActorPresetElement {
  late m.MaterialList _materials;

  ActorPresetMaterials({required Mesh mesh, bool isDefault = false})
      : super(
            mesh: mesh,
            name: MATERIALS_NAME,
            actorPresetType: ActorPresetMaterials,
            isDefault: isDefault) {
    mesh.meshChangeEvent.listen((_) => updateMaterialVisibility());
  }

  @override
  Widget accept(ActorPresetVisitor visitor) {
    return visitor.actorPresetMaterialsProperties(this);
  }

  m.MaterialList get materials => _materials;
  List<m.Material<String>> get materialList => _materials.materialList;

  m.Material<String> getMaterialByIndex(int index) {
    return materialList[index];
  }

  m.Material<String> getMaterialFromJsonName(String jsonName) {
    return materialList.firstWhere((mat) => mat.param.jsonName == jsonName);
  }

  void updateMaterialVisibility() {
    for (var i = 0; i < this.materialList.length; i++) {
      this.materialList[i].param.hide = !this.mesh.param.value[i];
    }
  }

  @override
  String toString() {
    return '$materialList';
  }

  @override
  String toUEString() {
    String jsonString = '';

    for (var material in materialList) {
      jsonString += '${material.toUEString()},';
    }

    jsonString = jsonString.isEmpty
        ? '[]'
        : '[${jsonString.substring(0, jsonString.length - 1)}]';

    return '"$MATERIALS_JSON_NAME": $jsonString';
  }
}

class VehiclePresetMaterials extends ActorPresetMaterials {
  VehiclePresetMaterials([Mesh? mesh, bool isDefault = false])
      : super(mesh: mesh ?? vehicleMeshListJson.first, isDefault: isDefault) {
    this._materials = m.MaterialList(m.vehicleMaterials);
    this.updateMaterialVisibility();
  }

  factory VehiclePresetMaterials.fromJson(dynamic json,
      [Mesh? mesh, bool isDefault = false]) {
    VehiclePresetMaterials vehiclePresetMaterials =
        VehiclePresetMaterials(mesh, isDefault);

    for (var i = 0; i < vehiclePresetMaterials.materialList.length; i++) {
      vehiclePresetMaterials._materials.materialList[i] =
          m.Material.fromJson(json[i]);
    }
    return vehiclePresetMaterials;
  }
}

class PedestrianPresetMaterials extends ActorPresetMaterials {
  PedestrianPresetMaterials([Mesh? mesh, bool isDefault = false])
      : super(
            mesh: mesh ?? pedestrianMeshListJson.first, isDefault: isDefault) {
    this._materials = m.MaterialList(m.pedestrianMaterials);
    this.updateMaterialVisibility();
  }

  factory PedestrianPresetMaterials.fromJson(dynamic json,
      [Mesh? mesh, bool isDefault = false]) {
    PedestrianPresetMaterials pedestrianPresetMaterials =
        PedestrianPresetMaterials(mesh, isDefault);

    for (var i = 0; i < pedestrianPresetMaterials.materialList.length; i++) {
      pedestrianPresetMaterials._materials.materialList[i] =
          m.Material.fromJson(json[i]);
    }
    return pedestrianPresetMaterials;
  }
}
