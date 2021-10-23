import 'package:flutter/material.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/actor_preset_meshes.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/mesh/mesh.dart';

class MeshPropertiesVisit extends StatefulWidget {
  final ActorPresetMeshes actorPresetMeshes;

  MeshPropertiesVisit(this.actorPresetMeshes);

  @override
  MeshPropertiesVisitState createState() => MeshPropertiesVisitState();
}

class MeshPropertiesVisitState extends State<MeshPropertiesVisit> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
            width: 125,
            child: ListTile(
              title: Text(widget.actorPresetMeshes.name),
            ),
          ),
        ),
        Flexible(
          child: MouseRegion(
            cursor: widget.actorPresetMeshes.isDefault
                ? SystemMouseCursors.basic
                : SystemMouseCursors.click,
            child: DropdownButton<Mesh>(
              value: widget.actorPresetMeshes.mesh,
              onChanged: widget.actorPresetMeshes.isDefault
                  ? null
                  : (Mesh? newValue) {
                      setState(() {
                        widget.actorPresetMeshes.changeMesh(newValue!);
                        socketService
                            .emitUpdateMesh(widget.actorPresetMeshes.mesh);
                      });
                    },
              items: scenarioBuilder
                  .meshMap[widget.actorPresetMeshes.runtimeType]!
                  .map<DropdownMenuItem<Mesh>>((Mesh value) {
                return DropdownMenuItem<Mesh>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
