import 'package:seereye_app/src/scenario/scenario.dart';
import 'package:seereye_app/src/scenario/scenario_macro.dart';

class ScenarioList {
  final List<ScenarioListElement> scenarioList = [];

  void addNewScenario() {
    int newNameInt = 1;
    String newName = '$SCENARIO_NAMING $newNameInt';
    while (scenarioList.any((element) => element.name == newName)) {
      newName = '$SCENARIO_NAMING ${++newNameInt}';
    }

    Scenario newScenario = Scenario(name: newName);
    scenarioList.add(ScenarioListElement(
        name: newScenario.name, scenario: newScenario.toString()));
  }

  void saveScenario(int index, Scenario scenario) {
    scenarioList[index]
      ..name = scenario.name
      ..scenario = scenario.toString();
  }

  Scenario getScenario(int index) {
    Scenario scenario = Scenario.fromJson(
      scenarioList[index].scenario,
    );
    if (scenarioList[index].isDirty) {
      scenario.name = scenarioList[index].name;
      scenarioList[index].isDirty = false;
    }
    return scenario;
  }

  bool changeScenarioName(int index, String newName) {
    if (scenarioList.any((element) => element.name == newName)) return false;

    scenarioList[index]
      ..name = newName
      ..isDirty = true;
    return true;
  }
}

class ScenarioListElement {
  String name;
  String scenario;
  bool isDirty = false;

  ScenarioListElement({
    required this.name,
    required this.scenario,
  });
}
