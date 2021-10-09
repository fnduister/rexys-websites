import 'package:flutter/widgets.dart';
import 'package:seereye_app/view/layout/page_routes.dart';
import 'package:seereye_app/view/pages/actor/actor_container.dart';
import 'package:seereye_app/view/pages/display/display_container.dart';
import 'package:seereye_app/view/pages/preset_builder/preset_builder_container.dart';

Map<String, WidgetBuilder> routing(BuildContext context) => {
      PageRoutes.actor: (context) => ActorContainer(),
      PageRoutes.presetBuilder: (context) => PresetBuilderContainer(),
      PageRoutes.display: (context) => DisplayContainer(),
    };
