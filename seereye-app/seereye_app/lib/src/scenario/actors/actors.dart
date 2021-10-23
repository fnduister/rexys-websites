import 'package:flutter/src/widgets/framework.dart';
import 'package:seereye_app/macro.dart';
import 'package:seereye_app/services/socket_service.dart';
import 'package:seereye_app/src/scenario/actors/actor_visitor.dart';
import 'package:seereye_app/src/scenario/actors/pedestrian/pedestrian.dart';
import 'package:seereye_app/src/scenario/actors/sensed_vehicle/sensed_vehicle.dart';
import 'package:seereye_app/src/scenario/actors/transform.dart';
import 'package:seereye_app/src/scenario/actors/vehicle/vehicle.dart';
import 'package:seereye_app/src/scenario/scenario_macro.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';
import 'package:seereye_app/src/transformable.dart';

export 'package:flutter/src/widgets/framework.dart';
export 'package:seereye_app/src/scenario/actors/transform.dart';
export 'package:seereye_app/src/scenario/scenario_macro.dart';
export 'package:seereye_app/general_variables.dart';
export 'package:seereye_app/src/scenario/actors/actor_visitor.dart';

class Actors {
  final Map<Type, ActorList> actorsMap = {};

  Actors() {
    for (var jsonElmObj in ACTORS_JSON_TRIPLE_LIST) {
      actorsMap[jsonElmObj.type] =
          ActorList(actorTypeName: jsonElmObj.name, actorType: jsonElmObj.type);
    }
  }

  Actors.fromJson(dynamic json) {
    for (var jsonElmObj in ACTORS_JSON_TRIPLE_LIST) {
      actorsMap[jsonElmObj.type] = ActorList(
        actorTypeName: jsonElmObj.name,
        actorType: jsonElmObj.type,
        actors: _jsonListObjectToActorList(
            jsonElmObj.type, json[jsonElmObj.jsonName]),
      );
    }
  }

  List<Actor> _jsonListObjectToActorList(Type type, List jsonListObject) {
    switch (type) {
      case SensedVehicle:
        return jsonListObject
            .map((jsonObject) => SensedVehicle.fromJson(jsonObject))
            .toList();
      case Vehicle:
        return jsonListObject
            .map((jsonObject) => Vehicle.fromJson(jsonObject))
            .toList();
      case Pedestrian:
        return jsonListObject
            .map((jsonObject) => Pedestrian.fromJson(jsonObject))
            .toList();
      default:
        throw ImpossibleToLoad___Error('Actor');
    }
  }

  List<ActorList> get actorsList => actorsMap.values.toList();

  @override
  String toString() {
    String jsonString = '';

    for (var jsonTriple in ACTORS_JSON_TRIPLE_LIST) {
      jsonString += '"${jsonTriple.jsonName}": ${actorsMap[jsonTriple.type]},';
    }
    return jsonString.isEmpty
        ? '{}'
        : '{${jsonString.substring(0, jsonString.length - 1)}}';
  }

  String toUEString() {
    String jsonString = '';

    for (var jsonTriple in ACTORS_JSON_TRIPLE_LIST) {
      jsonString +=
          '"${jsonTriple.jsonName}": ${actorsMap[jsonTriple.type]!.toUEString()},';
    }
    return jsonString.isEmpty
        ? '{}'
        : '{${jsonString.substring(0, jsonString.length - 1)}}';
  }
}

class ActorList {
  final String actorTypeName;
  final Type actorType;
  late final List<Actor> actors;

  ActorList(
      {required this.actorTypeName,
      required this.actorType,
      List<Actor>? actors}) {
    this.actors = actors ?? [];
  }

  void addNewActor() {
    String newPresetNaming = '';
    Actor actorToAdd;

    switch (actorType) {
      case SensedVehicle:
        newPresetNaming = SENSED_VEHICLES_NAMING;
        actorToAdd = SensedVehicle(name: newPresetNaming);
        break;
      case Vehicle:
        newPresetNaming = VEHICLES_NAMING;
        actorToAdd = Vehicle(name: newPresetNaming);
        break;
      case Pedestrian:
        newPresetNaming = PEDESTRIANS_NAMING;
        actorToAdd = Pedestrian(name: newPresetNaming);
        break;
      default:
        throw ImpossibleToAdd___Error('Preset');
    }

    int newNameInt = 1;
    String newName = '$newPresetNaming $newNameInt';
    while (actors.any((element) => element.name == newName)) {
      newName = '$newPresetNaming ${++newNameInt}';
    }
    actorToAdd.name = newName;

    actors.add(actorToAdd);

    socketService.emitSpawnActor(actorToAdd);
  }

  void addActorFromUE(dynamic json) {
    /*  Change this function if we need a different 
        implementation from adding an actor from UE */
    addNewActor();
  }

  void removeActor(Actor actorToRemove) {
    socketService.emitActorDeleted(actorToRemove);
    actors.removeWhere((actor) => actor == actorToRemove);
  }

  @override
  String toString() {
    String jsonString = '$actors';
    return jsonString;
  }

  String toUEString() {
    String jsonString = '';

    for (var actor in actors) {
      jsonString += '${actor.toUEString()},';
    }

    return jsonString.isEmpty
        ? '[]'
        : '[${jsonString.substring(0, jsonString.length - 1)}]';
  }
}

class Actor extends Transformable implements ActorHost {
  String name;
  final bool isDefault;
  late ActorPreset actorPreset;

  Actor(
      {required this.name,
      Transform? transform,
      ActorPreset? actorPreset,
      this.isDefault = false}) {
    this.transform = transform ?? Transform();
    this.actorPreset = actorPreset ?? ActorPreset.base();
  }

  Actor.base() : this(name: ACTORS_DEFAULT_NAME, isDefault: true);

  @override
  Widget accept(ActorVisitor visitor) {
    return visitor.noExtraProperties();
  }

  @override
  String toString() {
    return '{"$SUBACTOR_JSON_NAME": "$name", "$TYPE_JSON_NAME" : "${this.runtimeType}", $transform , ${actorPreset.toScenarioString()}}';
  }

  String toUEString() {
    return '{"$SUBACTOR_JSON_NAME": "$name", "$TYPE_JSON_NAME" : "${this.runtimeType}", $transform , ${actorPreset.toUEString()}}';
  }
}
