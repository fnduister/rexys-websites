import 'package:flutter/material.dart';
import 'package:seereye_app/services/socket_service.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/sensed_vehicle_preset/sensed_vehicle_preset.dart';
import 'package:seereye_app/word_bank.dart';
import 'package:seereye_app/src/scenario/actors/transform.dart' as t;

class PresetBuilderDetailSection extends StatefulWidget {
  final ValueNotifier<ActorPreset> selectedActorPresetNotifier;
  final Function changeNameFunc;

  PresetBuilderDetailSection(
      {Key? key,
      required this.selectedActorPresetNotifier,
      required this.changeNameFunc})
      : super(key: key);

  @override
  PresetBuilderDetailSectionState createState() =>
      PresetBuilderDetailSectionState();
}

class PresetBuilderDetailSectionState
    extends State<PresetBuilderDetailSection> {
  final _formKey = GlobalKey<FormState>();
  final _presetNameFocusNode = FocusNode();
  late final TextEditingController _presetNameTextController;
  late String firstName;

  late ActorPreset currentPreset;
  String selectedSensorName = '';

  @override
  void initState() {
    super.initState();

    socketService.showroomSocket
        .on('UEUpdateSensor', (data) => updateTransformable(data));

    firstName = widget.selectedActorPresetNotifier.value.name;
    _presetNameTextController = TextEditingController(text: firstName);
  }

  @override
  void dispose() {
    socketService.showroomSocket.off('UEUpdateSensor');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: widget.selectedActorPresetNotifier,
        builder:
            (BuildContext context, ActorPreset actorPreset, Widget? child) {
          currentPreset = actorPreset;
          _presetNameTextController.text = actorPreset.name;
          _presetNameFocusNode.unfocus();
          return Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: 250,
                  child: TextFormField(
                    focusNode: _presetNameFocusNode,
                    controller: _presetNameTextController,
                    readOnly: actorPreset.isDefault,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      isDense: true,
                      border: UnderlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return WordBank.enterAName;
                      } else if (!widget.changeNameFunc(actorPreset, value)) {
                        return WordBank.badName;
                      }
                      return null;
                    },
                    onChanged: (_) => setState(() {
                      if (!_formKey.currentState!.validate()) {
                        widget.changeNameFunc(actorPreset, firstName);
                      }
                    }),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: actorPreset.presetElements.length,
                    itemBuilder: (context, i) {
                      return actorPreset.presetElements[i]
                          .accept(ActorPresetVisitor());
                    },
                  ),
                ),
              ),
            ],
          );
        },
      );

  void updateTransformable(data) {
    if (currentPreset is SensedVehiclePreset)
      setState(() {
        (currentPreset as SensedVehiclePreset)
            .getSensor(selectedSensorName)
            .transform = t.Transform.fromJson(data[TRANSFORM]);
      });
  }
}
