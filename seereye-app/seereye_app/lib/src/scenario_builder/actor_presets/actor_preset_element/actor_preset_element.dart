import 'dart:async';

import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_visitor.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';

export 'package:seereye_app/macro.dart';

export 'package:seereye_app/src/scenario_builder/scenario_builder_macro.dart';
export 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/actor_preset_visitor.dart';

abstract class ActorPresetElement implements ActorPresetHost {
  final Type actorPresetType;
  final String name;
  final bool isDefault;
  Mesh mesh;

  ActorPresetElement(
      {required this.mesh,
      required this.name,
      required this.actorPresetType,
      required this.isDefault});

  StreamController elementChangeController =
      StreamController.broadcast(sync: true);

  Stream get elementChangeEvent => elementChangeController.stream;

  void changeStuff() {
    elementChangeController.add(actorPresetType);
  }

  String toUEString();
}
