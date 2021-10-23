import 'package:flutter/material.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario/actors/sensed_vehicle/sensed_vehicle.dart';

class SensedVehiclePropertiesVisit extends StatelessWidget {
  final SensedVehicle sensedVehicle;

  const SensedVehiclePropertiesVisit(this.sensedVehicle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.only(left: 16),
      title: Text(WordBank.sensors),
      children: _sensorListBuilder(),
    );
  }

  List<Widget> _sensorListBuilder() {
    List<Widget> sensorWidgetList = [];
    for (var sensor in sensedVehicle.sensorsList) {
      sensorWidgetList.add(ListTile(
        title: Text(sensor.name),
      ));
    }

    return sensorWidgetList;
  }
}
