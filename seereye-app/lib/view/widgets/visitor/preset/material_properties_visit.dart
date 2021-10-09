import 'package:flutter/material.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/actor_preset_materials.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/material/material.dart'
    as m;

class MaterialPropertiesVisit extends StatefulWidget {
  final ActorPresetMaterials actorPresetMaterials;

  MaterialPropertiesVisit(this.actorPresetMaterials);

  @override
  MaterialPropertiesVisitState createState() => MaterialPropertiesVisitState();
}

class MaterialPropertiesVisitState extends State<MaterialPropertiesVisit> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.actorPresetMaterials.name),
      children: _materialElementsBuilder(),
    );
  }

  List<Widget> _materialElementsBuilder() {
    List<Widget> elementList = [];
    scenarioBuilder.materialMap[widget.actorPresetMaterials.runtimeType]!
        .asMap()
        .forEach(
      (i, elm) {
        if (widget.actorPresetMaterials.mesh.param.value[i]) {
          m.Material<String> dropdownValue = widget.actorPresetMaterials
              .getMaterialFromJsonName(elm.param.jsonName);
          elementList.add(
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: 125,
                      child: ListTile(
                        title: Text(elm.name),
                      ),
                    ),
                  ),
                  Flexible(
                    child: MouseRegion(
                      cursor: widget.actorPresetMaterials.isDefault
                          ? SystemMouseCursors.basic
                          : SystemMouseCursors.click,
                      child: DropdownButton<String>(
                        value: dropdownValue.value,
                        onChanged: widget.actorPresetMaterials.isDefault
                            ? null
                            : (String? newValue) {
                                setState(() {
                                  dropdownValue.value = newValue!;
                                  socketService.emitUpdateSkin(
                                      widget.actorPresetMaterials.materials);
                                });
                              },
                        items: elm.value
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(width: 200, child: Text(value)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
    return elementList;
  }
}
