import 'dart:convert';

import 'package:seereye_app/services/services_macro.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/material.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/sensor.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';
import 'package:socket_io_client/socket_io_client.dart';

SocketService socketService = SocketService();

class SocketService {
  final String builderIp;
  final String showroomIp;
  late final Socket builderSocket;
  late final Socket showroomSocket;

  SocketService({this.builderIp = '127.0.0.1', this.showroomIp = '127.0.0.1'}) {
    this.builderSocket =
        io('http://' + this.builderIp + ':3000/', <String, dynamic>{
      'transports': ['websocket']
    });
    this.showroomSocket =
        io('http://' + this.showroomIp + ':3000/', <String, dynamic>{
      'transports': ['websocket']
    });
  }

  SocketService.fromJson(Map<String, dynamic> json)
      : this(
          builderIp: json[BUILDER][PUBLIC_IP],
          showroomIp: json[SHOWROOM][PUBLIC_IP],
        );

  // #region Actor_Communication

  void emitUpdateActor(Actor actor) {
    final e = jsonDecode(actor.toUEString());

    builderSocket.emit('FlutterUpdateActor', e);
  }

  void emitActorDeleted(Actor actor) {
    final e = actor.name;

    builderSocket.emit('FlutterDeleteActor', e);
  }

  void emitSpawnActor(Actor actor) {
    final e = jsonDecode(actor.toUEString());

    builderSocket.emit('FlutterSpawnActor', e);
  }

  void emitActorSelected(Actor actor) {
    final e = actor.name;

    builderSocket.emit('FlutterSelectActor', e);
  }

  void emitLoadSkinActor(Actor actor) {
    final e = json.decode(actor.toUEString());
    builderSocket.emit('FlutterLoadActor', e);
  }

  // #endregion Actor_Communication

  // #region Preset_Communication

  void emitUpdateSensor(Sensor sens) {
    final e = json.decode(sens.toUEString());

    showroomSocket.emit('FlutterUpdateSensor', e);
  }

  void emitDeleteSensor(Sensor sens) {
    final e = sens.name;

    showroomSocket.emit('FlutterDeleteSensor', e);
  }

  void emitSelectedSensor(Sensor sens) {
    final e = sens.name;

    showroomSocket.emit('FlutterSelectSensor', e);
  }

  void emitAddedSensor(Sensor sens) {
    final e = json.decode(sens.toUEString());

    showroomSocket.emit('FlutterAddSensor', e);
  }

  void emitLoadSkin(ActorPreset actorPreset) {
    String bod = actorPreset.toUEString();
    final e = json.decode('{"Type": "${actorPreset.runtimeType}", $bod}');

    showroomSocket.emit('FlutterLoadActor', e);
  }

  void emitUpdateSkin(MaterialList matList) {
    final e = json.decode(matList.toUEString());
    showroomSocket.emit('FlutterUpdateSkin', e);
  }

  void emitUpdateMesh(Mesh mesh) {
    final e = json.decode(mesh.toUEString());
    showroomSocket.emit('FlutterUpdateMesh', e);
  }

  // #endregion Preset_Communication

}
