import 'package:flutter/material.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';

class PresetBuilderListSection extends StatefulWidget {
  final ActorPreset selectedActorPreset;
  final Function actorPresetSetter;

  const PresetBuilderListSection({
    Key? key,
    required this.selectedActorPreset,
    required this.actorPresetSetter,
  }) : super(key: key);

  @override
  PresetBuilderListSectionState createState() =>
      PresetBuilderListSectionState();
}

class PresetBuilderListSectionState extends State<PresetBuilderListSection> {
  late ActorPreset selectedActorPreset;
  bool delete = false;

  final List<ActorPresetList> scenarioBuilderActorPresetList =
      scenarioBuilder.actorPresetField.actorPresetList;

  @override
  void initState() {
    super.initState();

    selectedActorPreset = widget.selectedActorPreset;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scenario.actorField.actorsMap.length,
      itemBuilder: (context, i) {
        return ExpansionTile(
          title: ListTile(
            contentPadding: EdgeInsets.all(0),
            mouseCursor: SystemMouseCursors.click,
            title: Text(scenarioBuilderActorPresetList[i].presetTypeName),
            trailing: IconButton(
              onPressed: () {
                setState(
                    () => scenarioBuilderActorPresetList[i].addNewPreset());
              },
              icon: Icon(Icons.add),
              splashRadius: 26,
            ),
          ),
          children: _actorElementsBuilder(scenarioBuilderActorPresetList[i]),
        );
      },
    );
  }

  List<Widget> _actorElementsBuilder(ActorPresetList actorPresetList) {
    List<Widget> widgetList = [];

    for (var actorPreset in actorPresetList.presets) {
      widgetList.add(
        ListTile(
          selected: actorPreset == selectedActorPreset,
          title: Text(actorPreset.name),
          trailing: actorPreset.isDefault
              ? null
              : IconButton(
                  onPressed: () {
                    setState(() {
                      if (selectedActorPreset == actorPreset) {
                        selectedActorPreset = ActorPreset.base();
                        widget.actorPresetSetter(selectedActorPreset);
                      }
                      actorPresetList.removePreset(actorPreset);
                    });
                  },
                  icon: Icon(Icons.remove),
                  splashRadius: 26,
                ),
          onTap: () {
            setState(() {
              selectedActorPreset = actorPreset;
              widget.actorPresetSetter(selectedActorPreset);
            });
            socketService.emitLoadSkin(actorPreset);
          },
        ),
      );
    }

    return widgetList;
  }
}
