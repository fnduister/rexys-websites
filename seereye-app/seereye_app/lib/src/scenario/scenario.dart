import 'package:seereye_app/src/scenario/actors/actors.dart';

class Scenario {
  String name;
  late final Actors actorField;

  Scenario({required this.name, Actors? actorField}) {
    this.actorField = actorField ?? Actors();
  }

  Scenario.fromJson(dynamic json)
      : this(
          name: json[SCENARIO_JSON_NAME] as String,
          actorField: Actors.fromJson(json[ACTORS_JSON_NAME]),
        );

  @override
  String toString() {
    return '{"$SCENARIO_JSON_NAME" : "$name", "$ACTORS_JSON_NAME": ${this.actorField}}';
  }

  String toUEString() {
    return '{"$SCENARIO_JSON_NAME" : "$name", "$ACTORS_JSON_NAME": ${this.actorField.toUEString()}}';
  }
}
