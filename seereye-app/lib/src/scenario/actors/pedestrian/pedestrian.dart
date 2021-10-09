import 'package:seereye_app/macro.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/pedestrian_preset/pedestrian_preset.dart';

class Pedestrian extends Actor {
  Pedestrian({
    required String name,
    Transform? transform,
    PedestrianPreset? pedestrianPreset,
  }) : super(
            name: name,
            transform: transform,
            actorPreset: pedestrianPreset ?? PedestrianPreset.base());

  Pedestrian.fromJson(dynamic json)
      : this(
          name: json[SUBACTOR_JSON_NAME] as String,
          transform: Transform.fromJson(json[TRANSFORM]),
          pedestrianPreset: scenarioBuilder
              .actorPresetField
              .actorPresetsMap[PedestrianPreset]
              ?.presets[json[PRESET_ID_JSON_NAME]] as PedestrianPreset,
        );

  @override
  Widget accept(ActorVisitor visitor) {
    return visitor.pedestrianExtraProperties(this);
  }
}
