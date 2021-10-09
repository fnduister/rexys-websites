import 'package:flutter/material.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/services/http_service.dart';
import 'package:seereye_app/view/layout/page_routes.dart';

import 'package:flutter/widgets.dart';
import 'package:seereye_app/view/layout/routing.dart';
import 'package:yaru/yaru.dart' as yaru;

void main() {
  // print(scenario.toUEString());
  // HttpService.initSeereyeBuilders().whenComplete(() => runApp(SeereyeApp()));
  runApp(const SeereyeApp());
}

class SeereyeApp extends StatelessWidget {
  const SeereyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: WordBank.title,
      theme: yaru.lightTheme,
      darkTheme: yaru.darkTheme,
      initialRoute: PageRoutes.actor,
      routes: routing(context),
    );
  }
}
