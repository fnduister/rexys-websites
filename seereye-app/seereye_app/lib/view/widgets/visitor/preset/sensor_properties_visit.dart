import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/actor_preset_sensors.dart';
import 'package:seereye_app/view/widgets/sensor/sensor_widget.dart';

class SensorPropertiesVisit extends StatefulWidget {
  final ActorPresetSensors actorPresetSensors;

  SensorPropertiesVisit(this.actorPresetSensors);

  @override
  SensorPropertiesVisitState createState() => SensorPropertiesVisitState();
}

class SensorPropertiesVisitState extends State<SensorPropertiesVisit> {
  final Map<String, bool> expansionState = {};

  @override
  void initState() {
    super.initState();

    socketService.showroomSocket
        .on('UESelectSensor', (data) => selectSensor(data));

    widget.actorPresetSensors.sensorsList.forEach((sensor) {
      expansionState.putIfAbsent(sensor.name, () => false);
    });
  }

  @override
  void dispose() {
    socketService.showroomSocket.off('UESelectSensor');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.only(left: 16),
      title: ListTile(
        title: Text(widget.actorPresetSensors.name),
        contentPadding: EdgeInsets.all(0),
        mouseCursor: SystemMouseCursors.click,
        trailing: _addSensorBuilder(),
      ),
      children: _sensorElementsBuilder(),
    );
  }

  Widget _addSensorBuilder() {
    return PopupMenuButton(
      enabled: !widget.actorPresetSensors.isDefault,
      icon: Icon(Icons.add),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      tooltip: WordBank.addSensor,
      onSelected: (String newValue) =>
          setState(() => widget.actorPresetSensors.addNewSensor(newValue)),
      itemBuilder: (_) => scenarioBuilder.sensorMap.keys
          .map<PopupMenuItem<String>>((String value) {
        return PopupMenuItem<String>(
          value: value,
          child: PointerInterceptor(
            child: Container(
              height: kMinInteractiveDimension,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(value),
              alignment: Alignment.centerLeft,
            ),
          ),
        );
      }).toList(),
    );
  }

  List<ExpansionTile> _sensorElementsBuilder() {
    List<ExpansionTile> elementList = [];

    for (var elm in widget.actorPresetSensors.sensorsList) {
      elementList.add(
        ExpansionTile(
          initiallyExpanded: expansionState[elm.name] ?? false,
          title: ListTile(
            title: Text(elm.name),
            contentPadding: EdgeInsets.zero,
            mouseCursor: SystemMouseCursors.click,
            trailing: IconButton(
              onPressed: () {
                setState(() => widget.actorPresetSensors.removeSensor(elm));
              },
              icon: Icon(Icons.remove),
              splashRadius: 26,
            ),
          ),
          childrenPadding: EdgeInsets.only(left: 16),
          children: <SensorWidget>[
            SensorWidget(sensor: elm),
          ],
          onExpansionChanged: (bool expend) {
            expansionState[elm.name] = expend;
            if (expend) socketService.emitSelectedSensor(elm);
          },
        ),
      );
    }

    return elementList;
  }

  void selectSensor(String data) {
    setState(() => expansionState[data] = true);
  }
}
