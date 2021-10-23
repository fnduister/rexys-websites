import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:seereye_app/services/http_service.dart';

class SeereyeAppBar extends AppBar {
  SeereyeAppBar(String title, {List<Widget> extraActions = const []})
      : super(
          title: Text(title),
          actions: kDebugMode
              ? extraActions +
                  <Widget>[
                    PopupMenuButton(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text("Debug actions"),
                        ),
                      ),
                      tooltip: "Debug actions",
                      onSelected: (DebugAction action) {
                        action.onPress!();
                      },
                      itemBuilder: (_) => debugActions
                          .map<PopupMenuItem<DebugAction>>((DebugAction value) {
                        return PopupMenuItem<DebugAction>(
                          padding: EdgeInsets.zero,
                          height: 0,
                          value: value,
                          child: PointerInterceptor(
                            child: Container(
                              height: kMinInteractiveDimension,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(value.title),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ]
              : null,
        );
}

List<DebugAction> debugActions = [
  DebugAction(title: 'Stop Builders', onPress: HttpService.StopBuilders),
];

class DebugAction {
  final String title;
  late final GestureTapCallback? onPress;

  DebugAction({required this.title, GestureTapCallback? onPress}) {
    this.onPress = onPress ?? () {};
  }
}
