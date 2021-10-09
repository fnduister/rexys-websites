import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/services/http_service.dart';
import 'package:seereye_app/src/scenario/actors/sensed_vehicle/sensed_vehicle.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/actor_preset_sensors.dart';
import 'package:seereye_app/view/pages/actor/actor_container.dart';
import 'package:seereye_app/view/pages/display/display_container.dart';
import 'package:seereye_app/view/pages/preset_builder/preset_builder_container.dart';
import 'package:seereye_app/view/widgets/confirmation_dialog.dart';
import 'package:seereye_app/view/widgets/loading_dialog.dart';

class NavigationDrawer extends StatelessWidget {
  final Function? refreshDisplayPage;
  NavigationDrawer({this.refreshDisplayPage});

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(),
            createDrawerButton(
              text: WordBank.start,
              color: Colors.deepOrange,
              onTap: () => startButtonPress(context),
            ),
            createDrawerButton(
              text: WordBank.stop,
              color: Colors.red,
              onTap: () => stopButtonPress(),
            ),
            createDrawerBodyItem(
              text: WordBank.actorMenuItem,
              icon: Icons.directions_car_outlined,
              onTap: () => Navigator.pushReplacementNamed(
                  context, ActorContainer.routeName),
            ),
            createDrawerBodyItem(
              text: WordBank.presetBuilderMenuItem,
              icon: Icons.car_repair_outlined,
              onTap: () => Navigator.pushReplacementNamed(
                  context, PresetBuilderContainer.routeName),
            ),
            createDrawerBodyItem(
              text: WordBank.displayMenuItem,
              icon: Icons.tv,
              onTap: () => Navigator.pushReplacementNamed(
                  context, DisplayContainer.routeName),
            ),
          ],
        ),
      ),
    );
  }

  Widget createDrawerHeader() => DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/seereye_logo.png'),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Container(),
              // Text(
              //   WordBank.title,
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 20.0,
              //       fontWeight: FontWeight.w500),
              // ),
            ),
          ],
        ),
      );

  Widget createDrawerBodyItem({
    IconData? icon,
    required String text,
    GestureTapCallback? onTap,
  }) =>
      ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
        onTap: onTap,
      );

  Widget createDrawerButton({
    required String text,
    Color? color,
    GestureTapCallback? onTap,
  }) =>
      Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
            disabledMouseCursor: MouseCursor.defer,
          ),
        ),
      );

  void stopButtonPress() {
    HttpService.StopSeereye().then((value) {
      if (value && this.refreshDisplayPage != null) this.refreshDisplayPage!();
    });
  }

  void startButtonPress(BuildContext context) {
    bool canStart = true;
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) => LoadingDialog(),
    ).then((value) => canStart = value ?? true);

    HttpService.initSeereyeNodes().then((value) {
      if (canStart) {
        Navigator.pop(context);
        if (value)
          _startDialog(context);
        else
          _problemeDialog(context);
      } else
        HttpService.StopSeereye();
    });
  }

  void _startDialog(BuildContext context) {
    Map<String, List<String>> sensorsElements = {};

    for (var sv in scenario.actorField.actorsMap[SensedVehicle]!.actors) {
      sensorsElements[sv.name] = [];
      for (var sensor in ((sv as SensedVehicle)
              .actorPreset
              .presetElementsMap[ActorPresetSensors] as ActorPresetSensors)
          .sensorsList) {
        sensorsElements[sv.name]!.add(sensor.name);
      }
    }

    showDialog<bool>(
      context: context,
      builder: (BuildContext context) => ConfirmationDialog(
        sensorsElements,
        onOkPress: this.refreshDisplayPage,
      ),
    );
  }

  void _problemeDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(WordBank.connectionError),
        content: Text(WordBank.connectionErrorText),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(WordBank.close)),
        ],
      ),
    );
  }
}
