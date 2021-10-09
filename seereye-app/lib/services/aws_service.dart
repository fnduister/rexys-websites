import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:seereye_app/services/services_macro.dart';

AwsService awsService = AwsService();

class AwsService {
  AwsService(
      {String builderIp = 'http://localhost/',
      String showroomIp = 'http://localhost/'}) {
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'builder-view',
        (int viewId) => IFrameElement()
          ..style.width = '100%'
          ..style.height = '100%'
          ..src = 'http://' + builderIp
          ..style.border = 'none');

    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'showroom-view',
        (int viewId) => IFrameElement()
          ..style.width = '100%'
          ..style.height = '100%'
          ..src = 'http://' + showroomIp
          ..style.border = 'none');
  }

  AwsService.fromJson(Map<String, dynamic> json)
      : this(
          builderIp: json[BUILDER][PUBLIC_IP],
          showroomIp: json[SHOWROOM][PUBLIC_IP],
        );

  void addDisplayViewers(Map<String, dynamic> json) {
    // TODO : attendre le refactor de gab pour ajouter les sensor en fonction des sensed vehicles
    awsViewer.clear();
    awsViewer["Test 1"] = [];
    for (var elm in json[NODES]) {
      //ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
          elm[NAME],
          (int viewId) => IFrameElement()
            ..style.width = '100%'
            ..style.height = '100%'
            ..src = 'http://' + elm[ADRESS][PUBLIC_IP]
            ..style.border = 'none');

      awsViewer["Test 1"]!
          .add(ViewPair(elm[NAME], HtmlElementView(viewType: elm[NAME])));
    }
  }

  void removeDisplayViewers() {
    awsViewer.clear();
  }

  Widget actorShowroom = HtmlElementView(viewType: 'showroom-view');
  Widget mapView = HtmlElementView(viewType: 'builder-view');

  Map<String, List<ViewPair>> awsViewer = {};
}

class ViewPair {
  final String name;
  final HtmlElementView viewer;
  ViewPair(this.name, this.viewer);
}
