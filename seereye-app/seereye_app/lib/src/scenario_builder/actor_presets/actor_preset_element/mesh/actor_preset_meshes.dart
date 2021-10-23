import 'package:flutter/material.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_element.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';

abstract class ActorPresetMeshes extends ActorPresetElement {
  ActorPresetMeshes({required Mesh mesh, bool isDefault = false})
      : super(
            mesh: mesh,
            name: MESH_NAME,
            actorPresetType: ActorPresetMeshes,
            isDefault: isDefault);

  @override
  Widget accept(ActorPresetVisitor visitor) {
    return visitor.actorPresetMeshProperties(this);
  }

  void changeMesh(Mesh newMesh) {
    mesh.changeParam(newMesh.param);
  }

  @override
  String toString() {
    return '$mesh';
  }

  @override
  String toUEString() {
    return '"$MESH_JSON_NAME": ${mesh.toUEString()}';
  }
}

class VehiclePresetMeshes extends ActorPresetMeshes {
  VehiclePresetMeshes([Mesh? mesh, bool isDefault = false])
      : super(
            mesh: mesh ?? Mesh.clone(vehicleMeshListJson.first),
            isDefault: isDefault);

  VehiclePresetMeshes.fromJson(dynamic json, Mesh mesh,
      [bool isDefault = false])
      : super(mesh: mesh, isDefault: isDefault) {
    this.mesh.param = Mesh.fromJson(json).param;
  }
}

class PedestrianPresetMeshes extends ActorPresetMeshes {
  PedestrianPresetMeshes([Mesh? mesh, bool isDefault = false])
      : super(
            mesh: mesh ?? Mesh.clone(pedestrianMeshListJson.first),
            isDefault: isDefault);
  PedestrianPresetMeshes.fromJson(dynamic json, Mesh mesh,
      [bool isDefault = false])
      : super(mesh: mesh, isDefault: isDefault) {
    this.mesh.param = Mesh.fromJson(json).param;
  }
}
