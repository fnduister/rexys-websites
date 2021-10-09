import 'package:seereye_app/macro.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/vehicle_preset/vehicle_preset.dart';

class Vehicle extends Actor {
  Vehicle({
    required String name,
    Transform? transform,
    VehiclePreset? vehiclePreset,
  }) : super(
            name: name,
            transform: transform,
            actorPreset: vehiclePreset ?? VehiclePreset.base());
  Vehicle.fromJson(dynamic json)
      : this(
          name: json[SUBACTOR_JSON_NAME] as String,
          transform: Transform.fromJson(json[TRANSFORM]),
          vehiclePreset: scenarioBuilder
              .actorPresetField
              .actorPresetsMap[VehiclePreset]
              ?.presets[json[PRESET_ID_JSON_NAME] as int] as VehiclePreset,
        );

  @override
  Widget accept(ActorVisitor visitor) {
    return visitor.vehicleExtraProperties(this);
  }
}
