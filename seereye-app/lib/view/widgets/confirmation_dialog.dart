import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/services/http_service.dart';

class ConfirmationDialog extends StatelessWidget {
  final Map<String, List<String>> sensorsElements;
  final Function? onOkPress;
  ConfirmationDialog(this.sensorsElements, {this.onOkPress});

  @override
  Widget build(BuildContext context) => PointerInterceptor(
        child: AlertDialog(
          title: Text(WordBank.startSimulation),
          content: SingleChildScrollView(
            child: Text(WordBank.startSimulationText(sensorsElements)),
          ),
          actions: [
            ElevatedButton(
                onPressed: () => cancelSimulation(context),
                child: Text(WordBank.cancel)),
            ElevatedButton(
                onPressed: () => startSimulation(context),
                child: Text(WordBank.start))
          ],
        ),
      );

  void cancelSimulation(BuildContext context) {
    HttpService.StopSeereye();
    Navigator.pop(context, false);
  }

  void startSimulation(BuildContext context) {
    HttpService.StartSeereye().then((value) {
      Navigator.pop(context, true);
      if (value && onOkPress != null) onOkPress!();
    });
  }
}
