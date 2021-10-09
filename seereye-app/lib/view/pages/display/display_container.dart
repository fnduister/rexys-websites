import 'package:flutter/material.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/view/layout/navigation_drawer.dart';
import 'package:seereye_app/view/pages/display/display_page.dart';
import 'package:seereye_app/view/widgets/seereye_app_bar.dart';
import 'package:seereye_app/word_bank.dart';

class DisplayContainer extends StatefulWidget {
  static const String routeName = '/display';

  final List<Widget> buttons = [
    Tooltip(
      message: WordBank.toggleClickTile,
      child: Icon(Icons.auto_awesome_mosaic),
    ),
    Tooltip(
      message: WordBank.toggleTileMover,
      child: Icon(Icons.repeat),
    ),
  ];

  final ValueNotifier<List<bool>> isSelected =
      ValueNotifier(List.filled(2, false));

  final PageRefresher pageRefresher = PageRefresher();

  @override
  DisplayContainerState createState() => DisplayContainerState();
}

class DisplayContainerState extends State<DisplayContainer> {
  bool moveSelectedState = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: SeereyeAppBar(
        WordBank.displayMenuItem,
        extraActions: [
          toggleButtons(),
        ],
      ),
      drawer: NavigationDrawer(
        refreshDisplayPage: () => _refreshPage(),
      ),
      body: DisplayPage(widget.isSelected, widget.pageRefresher),
      onDrawerChanged: (bool open) {
        if (widget.isSelected.value[0] != (open || moveSelectedState)) {
          widget.isSelected.value[0] = open || moveSelectedState;
          _refreshPage();
        }
      },
    );
  }

  ToggleButtons toggleButtons() => ToggleButtons(
        children: widget.buttons,
        isSelected: widget.isSelected.value,
        onPressed: (int index) => setState(
          () {
            widget.isSelected.value[index] = !widget.isSelected.value[index];
            moveSelectedState = widget.isSelected.value[0];
          },
        ),
      );

  void _refreshPage() {
    widget.pageRefresher.refresh();
  }
}

class PageRefresher with ChangeNotifier {
  void refresh() => notifyListeners();
}
