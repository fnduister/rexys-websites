import 'package:flutter/material.dart';
import 'package:seereye_app/services/aws_service.dart';
import 'package:seereye_app/view/widgets/custom/drag_and_drop_gridview.dart';
import 'package:seereye_app/word_bank.dart';

class DisplayPage extends StatelessWidget {
  final ValueNotifier<List<bool>> gridModifierNotifier;
  final ChangeNotifier refreshNotifier;

  const DisplayPage(this.gridModifierNotifier, this.refreshNotifier, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: refreshNotifier,
        builder: (_, __) => ValueListenableBuilder(
          valueListenable: gridModifierNotifier,
          builder: (BuildContext context, List<bool> modifierList, _) =>
              awsService.awsViewer.length > 0
                  ? DefaultTabController(
                      length: awsService.awsViewer.length,
                      child: Scaffold(
                        appBar: TabBar(
                          labelColor: Colors.black,
                          tabs: _tabBarBuilder(),
                        ),
                        body: TabBarView(
                          children: _tabBodyBuilder(modifierList: modifierList),
                        ),
                      ),
                    )
                  : Center(
                      child: ListTile(
                        title: Text(
                          WordBank.noDisplayAvailable,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
        ),
      );

  List<Tab> _tabBarBuilder() {
    List<Tab> tabs = [];
    for (var key in awsService.awsViewer.keys) {
      tabs.add(Tab(text: key));
    }
    return tabs;
  }

  List<Widget> _tabBodyBuilder({required List<bool> modifierList}) {
    List<Widget> tabs = [];
    for (var value in awsService.awsViewer.values) {
      tabs.add(_gridBuilder(
        modifierList: modifierList,
        itemList: value,
      ));
    }
    return tabs;
  }

  Widget _gridBuilder(
          {required List<bool> modifierList,
          required List<ViewPair> itemList}) =>
      DragAndDropGridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 9,
        ),
        canClickOnTile: !modifierList[0],
        gridTileMover:
            modifierList[1] ? GridTileMover.insert : GridTileMover.swap,
        padding: EdgeInsets.all(5),
        gridChildrendPadding: EdgeInsets.all(5),
        itemList: itemList, //awsService.awsViewer,
        itemBuilder: (BuildContext context, int i) => Card(
          elevation: 2,
          child: LayoutBuilder(
            builder: (context, constrains) {
              return GridTile(
                header: ListTile(
                  title: Text(itemList[i].name),
                ),
                child: Container(
                  color: Colors.grey[300],
                  height: constrains.maxHeight,
                  width: constrains.maxWidth,
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          WordBank.loading,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      itemList[i].viewer,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
}
