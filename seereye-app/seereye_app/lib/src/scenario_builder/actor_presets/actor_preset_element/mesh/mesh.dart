import 'dart:async';

import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/param.dart';

class Mesh {
  Param<List<bool>> param;
  Mesh(this.param);
  Mesh.clone(Mesh newMesh) : this(Param.clone(newMesh.param));

  Mesh.fromJson(dynamic json) : this(Param.fromJson(json));

  Mesh.base() : this(Param.base([]));

  StreamController meshChangeController =
      StreamController.broadcast(sync: true);

  Stream get meshChangeEvent => meshChangeController.stream;

  void changeParam(Param<List<bool>> newParam) {
    this.param = Param.clone(newParam);
    meshChangeController.add(null);
  }

  String get name => param.displayName[LANGUAGE]!;
  List<bool> get value => param.value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Mesh && other.param == param;
  }

  @override
  String toString() {
    return '$param';
  }

  String toUEString() {
    return '"${param.jsonName}"';
  }
}

List<Mesh> vehicleMeshListJson = [
  Mesh(Param('ChaosCar', {
    EN: 'Chaos Car',
    FR: 'Chaos Car'
  }, [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ])),
  Mesh(Param('Kia', {
    EN: 'Kia Soul',
    FR: 'Kia Soul'
  }, [
    false,
    true,
    true,
    false,
    true,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ]))
];

List<Mesh> pedestrianMeshListJson = [
  Mesh(Param('AdultMale', {EN: 'Adult Male', FR: 'Adult Male'},
      [true, true, true, true, true, true, true])),
  Mesh(Param('AdultFemale', {EN: 'Adult Female', FR: 'Adult Female'},
      [false, true, true, false, true, false, true])),
];
