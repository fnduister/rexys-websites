import 'package:flutter/material.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/view/layout/navigation_drawer.dart';
import 'package:seereye_app/view/pages/actor/actor_detail_section.dart';
import 'package:seereye_app/view/pages/actor/actor_list_section.dart';
import 'package:seereye_app/view/pages/actor/actor_view_section.dart';
import 'package:seereye_app/view/tools/pages_utils.dart';
import 'package:seereye_app/view/widgets/seereye_app_bar.dart';
import 'package:seereye_app/word_bank.dart';

class ActorContainer extends StatelessWidget {
  static const String routeName = '/actor';

  final ValueNotifier<Actor> selectedActorNotifier =
      ValueNotifier(Actor.base());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: SeereyeAppBar(WordBank.actorMenuItem),
      drawer: NavigationDrawer(),
      body: Row(
        children: [
          Container(
            width: kBrowserListWidth,
            child: ActorListSection(
              selectedActor: selectedActorNotifier.value,
              actorSetter: setActor,
            ),
          ),
          Container(
            width: kBrowserPropertiesWidth,
            child: ActorDetailSection(
              selectedActorNotifier: selectedActorNotifier,
            ),
          ),
          Expanded(
            child: ActorViewSection(),
          ),
        ],
      ),
    );
  }

  void setActor(Actor selectedActor) {
    selectedActorNotifier.value = selectedActor;
  }
}
