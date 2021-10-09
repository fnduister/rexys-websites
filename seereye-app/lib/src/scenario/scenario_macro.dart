import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario/actors/pedestrian/pedestrian.dart';
import 'package:seereye_app/src/scenario/actors/sensed_vehicle/sensed_vehicle.dart';
import 'package:seereye_app/src/scenario/actors/vehicle/vehicle.dart';

const String SCENARIO_NAMING = 'Scenario';
const String SCENARIO_JSON_NAME = 'ScenarioName';
const String ACTORS_DEFAULT_NAME = 'Actor Default';
const String ACTORS_JSON_NAME = 'Actors';
const String SUBACTOR_JSON_NAME = 'actorName';

const List<ActorTriple> ACTORS_JSON_TRIPLE_LIST = [
  ActorTriple(
    SensedVehicle,
    SENSED_VEHICLES_NAME,
    SENSED_VEHICLES_JSON_NAME,
  ),
  ActorTriple(
    Vehicle,
    VEHICLES_NAME,
    VEHICLES_JSON_NAME,
  ),
  ActorTriple(
    Pedestrian,
    PEDESTRIANS_NAME,
    PEDESTRIANS_JSON_NAME,
  ),
];

const String SENSED_VEHICLES_NAME = WordBank.sensedVehicles;
const String SENSED_VEHICLES_NAMING = 'Sensed Vehicle';
const String SENSED_VEHICLES_JSON_NAME = 'SensoredVehicles';

const String VEHICLES_NAME = WordBank.vehicles;
const String VEHICLES_NAMING = 'Vehicle';
const String VEHICLES_JSON_NAME = 'Vehicles';

const String PEDESTRIANS_NAME = WordBank.pedestrians;
const String PEDESTRIANS_NAMING = 'Pedestrian';
const String PEDESTRIANS_JSON_NAME = 'Pedestrians';

class ActorTriple {
  final Type type;
  final String name;
  final String jsonName;
  const ActorTriple(this.type, this.name, this.jsonName);
}

const String TRANSFORM_JSON_NAME = 'transform';
const String PRESET_ID_JSON_NAME = 'presetId';
