import 'package:seereye_app/macro.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/actor_preset_sensors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/sensor.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/sensed_vehicle_preset/sensed_vehicle_preset.dart';

class SensedVehicle extends Actor {
  SensedVehicle({
    required String name,
    Transform? transform,
    SensedVehiclePreset? sensedVehiclePreset,
  }) : super(
            name: name,
            transform: transform,
            actorPreset: sensedVehiclePreset ?? SensedVehiclePreset.base());

  SensedVehicle.fromJson(dynamic json)
      : this(
          name: json[SUBACTOR_JSON_NAME] as String,
          transform: Transform.fromJson(json[TRANSFORM]),
          sensedVehiclePreset: scenarioBuilder
                  .actorPresetField
                  .actorPresetsMap[SensedVehiclePreset]
                  ?.presets[json[PRESET_ID_JSON_NAME] as int]
              as SensedVehiclePreset,
        );

  List<Sensor> get sensorsList =>
      (actorPreset.presetElementsMap[ActorPresetSensors] as ActorPresetSensors)
          .sensorsList;

  @override
  Widget accept(ActorVisitor visitor) {
    return visitor.sensedVehicleExtraProperties(this);
  }
}
