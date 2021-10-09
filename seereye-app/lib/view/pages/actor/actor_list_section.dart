import 'package:flutter/material.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/src/scenario/actors/pedestrian/pedestrian.dart';
import 'package:seereye_app/src/scenario/actors/sensed_vehicle/sensed_vehicle.dart';
import 'package:seereye_app/src/scenario/actors/vehicle/vehicle.dart';

class ActorListSection extends StatefulWidget {
  final Actor selectedActor;
  final Function actorSetter;

  const ActorListSection({
    Key? key,
    required this.selectedActor,
    required this.actorSetter,
  }) : super(key: key);

  @override
  ActorListSectionState createState() => ActorListSectionState();
}

class ActorListSectionState extends State<ActorListSection> {
  late Actor selectedActor;

  final List<ActorList> scenarioActorList = scenario.actorField.actorsList;

  @override
  void initState() {
    super.initState();

    socketService.builderSocket.on('UESpawnActor', (data) => spawnActor(data));
    socketService.builderSocket
        .on('UESelectActor', (data) => actorSelected(data));
    socketService.builderSocket
        .on('UEDeleteActor', (data) => actorDeleted(data));
    socketService.builderSocket.on('UERequestData', (data) => updateUE(data));

    selectedActor = widget.selectedActor;
  }

  @override
  void dispose() {
    socketService.builderSocket.off('UESpawnActor');
    socketService.builderSocket.off('UESelectActor');
    socketService.builderSocket.off('UEDeleteActor');
    socketService.builderSocket.off('UERequestData');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scenario.actorField.actorsMap.length,
      itemBuilder: (context, i) {
        return ExpansionTile(
          childrenPadding: EdgeInsets.only(left: 16),
          title: ListTile(
            contentPadding: EdgeInsets.all(0),
            mouseCursor: SystemMouseCursors.click,
            title: Text(scenarioActorList[i].actorTypeName),
            trailing: IconButton(
              onPressed: () {
                setState(() => scenarioActorList[i].addNewActor());
              },
              icon: Icon(Icons.add),
              splashRadius: 26,
            ),
          ),
          children: _actorElementsBuilder(scenarioActorList[i]),
        );
      },
    );
  }

  List<Widget> _actorElementsBuilder(ActorList actorList) {
    List<Widget> widgetList = [];

    for (var actor in actorList.actors) {
      widgetList.add(
        ListTile(
          selected: actor == selectedActor,
          title: Text(actor.name),
          trailing: actor.isDefault
              ? null
              : IconButton(
                  onPressed: () {
                    setState(() {
                      if (selectedActor == actor) {
                        selectedActor = Actor.base();
                        widget.actorSetter(selectedActor);
                      }
                      actorList.removeActor(actor);
                    });
                  },
                  icon: Icon(Icons.remove),
                  splashRadius: 26,
                ),
          onTap: () {
            setState(() {
              selectedActor = actor;
              widget.actorSetter(selectedActor);
            });
            socketService.emitActorSelected(actor);
            socketService.emitLoadSkinActor(actor);
          },
        ),
      );
    }

    return widgetList;
  }

// #region socket_functions
  void spawnActor(data) {
    setState(() {
      switch (data["type"]) {
        case "PedestrianPreset":
          setState(() =>
              scenario.actorField.actorsMap[Pedestrian]!.addActorFromUE(data));

          break;
        case "VehiclePreset":
          setState(() =>
              scenario.actorField.actorsMap[Vehicle]!.addActorFromUE(data));
          break;
        case "SensedVehiclePreset":
          setState(() => scenario.actorField.actorsMap[SensedVehicle]!
              .addActorFromUE(data));
          break;
        default:
          print("ERROR NAME MISSMATCH");
          return;
      }
    });
  }

  void actorSelected(data) {
    for (ActorList list in scenarioActorList) {
      Iterable<Actor> actor =
          list.actors.where((actor) => actor.name == data['Name']);

      if (actor.isNotEmpty) {
        if (!this.mounted) {
          return;
        }
        selectedActor = actor.first;
        widget.actorSetter(selectedActor);
        socketService.emitLoadSkinActor(selectedActor);
        return;
      }
    }
  }

  void actorDeleted(data) {
    for (ActorList actorList in scenarioActorList) {
      Iterable<Actor> actor =
          actorList.actors.where((actor) => actor.name == data);
      if (actor.isNotEmpty) {
        setState(() => actorList.removeActor(actor.first));
        return;
      }
    }
  }

  void updateUE(data) {
    for (ActorList list in scenarioActorList) {
      for (Actor actor in list.actors) {
        socketService.emitSpawnActor(actor);
      }
    }
  }

// #endregion socket_functions
}
