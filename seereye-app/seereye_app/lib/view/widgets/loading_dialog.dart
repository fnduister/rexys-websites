import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:seereye_app/general_variables.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => PointerInterceptor(
        child: AlertDialog(
          title: Text(WordBank.connectingToServer),
          content: Center(
            heightFactor: 1,
            child: CircularProgressIndicator(),
          ),
          actions: [
            ElevatedButton(
                onPressed: () => cancelSimulation(context),
                child: Text(WordBank.cancel)),
          ],
        ),
      );

  void cancelSimulation(BuildContext context) {
    Navigator.pop(context, false);
  }
}
