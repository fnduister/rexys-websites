import 'package:flutter/material.dart';
import 'package:seereye_app/src/scenario/actors/pedestrian/pedestrian.dart';
import 'package:seereye_app/src/scenario/actors/sensed_vehicle/sensed_vehicle.dart';
import 'package:seereye_app/src/scenario/actors/vehicle/vehicle.dart';
import 'package:seereye_app/view/widgets/visitor/actor/pedestrian_properties_visit.dart';
import 'package:seereye_app/view/widgets/visitor/actor/sensed_vehicle_properties_visit.dart';
import 'package:seereye_app/view/widgets/visitor/actor/vehicle_properties_visit.dart';

class ActorVisitor {
  Widget noExtraProperties() {
    return Container();
  }

  Widget sensedVehicleExtraProperties(SensedVehicle sensedVehicle) {
    return SensedVehiclePropertiesVisit(sensedVehicle);
  }

  Widget vehicleExtraProperties(Vehicle vehicle) {
    return VehiclePropertiesVisit(vehicle);
  }

  Widget pedestrianExtraProperties(Pedestrian pedestrian) {
    return PedestrianPropertiesVisit(pedestrian);
  }
}

abstract class ActorHost {
  Widget accept(ActorVisitor visitor);
}
