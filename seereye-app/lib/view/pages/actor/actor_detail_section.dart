import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';
import 'package:seereye_app/src/scenario/actors/transform.dart' as t;
import 'package:seereye_app/view/tools/pages_utils.dart';
import 'package:seereye_app/view/widgets/transfrom/transform_widget.dart';

class ActorDetailSection extends StatefulWidget {
  final ValueNotifier<Actor> selectedActorNotifier;

  ActorDetailSection({Key? key, required this.selectedActorNotifier})
      : super(key: key);

  @override
  ActorDetailSectionState createState() => ActorDetailSectionState();
}

class ActorDetailSectionState extends State<ActorDetailSection> {
  late Actor currentActor;

  @override
  void initState() {
    super.initState();

    socketService.builderSocket
        .on('UEUpdateActor', (data) => updateTransformable(data));
  }

  @override
  void dispose() {
    socketService.builderSocket.off('UEUpdateActor');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: widget.selectedActorNotifier,
        builder: (BuildContext context, Actor actor, Widget? child) {
          currentActor = actor;
          return ListView(
            controller: ScrollController(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  title: Text(
                    actor.name,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              actor.isDefault ? Container() : _actorViewWindowBuilder(),
              actor.isDefault ? Container() : _presetSelectBuilder(actor),
              actor.isDefault ? Container() : TransformWidget(actor),
              actor.accept(ActorVisitor()),
            ],
          );
        },
      );

  Widget _actorViewWindowBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: 150,
            child: AspectRatio(
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        WordBank.loading,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  awsService.actorShowroom,
                  PointerInterceptor(child: Container()),
                ],
              ),
              aspectRatio: 1.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _presetSelectBuilder(Actor actor) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: ListTile(
            title: Text('${WordBank.preset} : '),
          ),
        ),
        Flexible(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: DropdownButton<ActorPreset>(
              value: actor.actorPreset,
              onChanged: (ActorPreset? newValue) => setState(() {
                actor.actorPreset = newValue!;
                socketService.emitUpdateActor(actor);
              }),
              items: scenarioBuilder.actorPresetField
                  .actorPresetsMap[actor.actorPreset.runtimeType]!.presets
                  .map<DropdownMenuItem<ActorPreset>>((ActorPreset value) {
                return DropdownMenuItem<ActorPreset>(
                  value: value,
                  child: Container(
                    width: isTablet(context) ? 180 : null,
                    child: Text(value.name),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  void updateTransformable(data) {
    setState(() {
      currentActor.transform = t.Transform.fromJson(data[TRANSFORM]);
    });
  }
}
