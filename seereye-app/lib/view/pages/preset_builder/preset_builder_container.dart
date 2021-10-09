import 'package:flutter/material.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_presets.dart';
import 'package:seereye_app/view/layout/navigation_drawer.dart';
import 'package:seereye_app/view/pages/preset_builder/preset_builder_detail_section.dart';
import 'package:seereye_app/view/pages/preset_builder/preset_builder_list_section.dart';
import 'package:seereye_app/view/pages/preset_builder/preset_builder_view_section.dart';
import 'package:seereye_app/view/tools/pages_utils.dart';
import 'package:seereye_app/view/widgets/seereye_app_bar.dart';
import 'package:seereye_app/word_bank.dart';

class PresetBuilderContainer extends StatelessWidget {
  static const String routeName = '/preset_builder';

  final ValueNotifier<ActorPreset> selectedActorPresetNotifier =
      ValueNotifier(ActorPreset.base());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: SeereyeAppBar(WordBank.presetBuilderMenuItem),
      drawer: NavigationDrawer(),
      body: Row(
        children: [
          Container(
            width: kBrowserListWidth,
            child: PresetBuilderListSection(
              selectedActorPreset: selectedActorPresetNotifier.value,
              actorPresetSetter: setActorPreset,
            ),
          ),
          Container(
            width: kBrowserPresetPropertiesWidth,
            child: PresetBuilderDetailSection(
              selectedActorPresetNotifier: selectedActorPresetNotifier,
              changeNameFunc: () {},
            ),
          ),
          Expanded(
            child: PresetBuilderViewSection(),
          ),
        ],
      ),
    );
  }

  void setActorPreset(ActorPreset selectedActorPreset) {
    selectedActorPresetNotifier.value = selectedActorPreset;
  }
}
