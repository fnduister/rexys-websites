import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_element.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';

import 'sensor.dart';
import 'package:flutter/material.dart';

class ActorPresetSensors extends ActorPresetElement {
  final List<Sensor> sensorsList = [];

  ActorPresetSensors([Mesh? mesh, bool isDefault = false])
      : super(
            mesh: mesh ?? vehicleMeshListJson.first,
            name: SENSORS_NAME,
            actorPresetType: ActorPresetSensors,
            isDefault: isDefault);

  factory ActorPresetSensors.fromJson(dynamic json,
      [Mesh? mesh, bool isDefault = false]) {
    ActorPresetSensors actorPresetSensors = ActorPresetSensors(mesh, isDefault);
    for (var jsonObj in json) {
      actorPresetSensors.sensorsList.add(Sensor.fromJson(jsonObj));
    }
    return actorPresetSensors;
  }

  void addNewSensor(String type) {
    int newNameInt = 1;
    String newName = '$type $newNameInt';
    while (sensorsList.any((element) => element.name == newName)) {
      newName = '$type ${++newNameInt}';
    }

    Sensor newSensor = Sensor(type: type, name: newName);
    sensorsList.add(newSensor);

    sensorsList.sort((a, b) => a.name.compareTo(b.name));

    socketService.emitAddedSensor(newSensor);
  }

  void removeSensor(Sensor sensor) {
    socketService.emitDeleteSensor(sensor);
    sensorsList.removeWhere((sen) => sen == sensor);
  }

  @override
  String toString() {
    return '$sensorsList';
  }

  @override
  String toUEString() {
    String jsonString = '';

    for (var sensor in sensorsList) {
      jsonString += '${sensor.toUEString()},';
    }

    jsonString = jsonString.isEmpty
        ? '[]'
        : '[${jsonString.substring(0, jsonString.length - 1)}]';

    return '"$SENSORS_JSON_NAME": $jsonString';
  }

  @override
  Widget accept(ActorPresetVisitor visitor) {
    return visitor.actorPresetSensorsProperties(this);
  }
}
