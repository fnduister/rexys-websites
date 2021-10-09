import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class DragAndDropGridView<T> extends StatefulWidget {
  final Widget Function(BuildContext, int) itemBuilder;

  // #region custom_variable

  final List<T> itemList;
  final GridTileMover gridTileMover;
  final bool canClickOnTile;
  final double feedbackWidth;
  final double feedbackHeight;
  final EdgeInsets? gridChildrendPadding;
  final Duration longPressDuration;
  final Widget? feedbackWidget;
  final Widget? dragPlaceholderWidget;

  // #endregion custom_variable

  // #region base_variable

  final Key? key;
  final SliverGridDelegate gridDelegate;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  // #endregion base_variable

  DragAndDropGridView({
    required this.itemBuilder,
    required this.gridDelegate,
    required this.itemList,
    this.gridChildrendPadding,
    this.gridTileMover = GridTileMover.insert,
    this.canClickOnTile = true,
    this.feedbackWidth = 50,
    this.feedbackHeight = 50,
    this.feedbackWidget,
    this.dragPlaceholderWidget,
    this.longPressDuration = kLongPressTimeout,
    this.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
  });

  int get itemCount => itemList.length;

  @override
  _DragAndDropGridViewState createState() => _DragAndDropGridViewState();
}

class _DragAndDropGridViewState extends State<DragAndDropGridView> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: widget.gridDelegate,
      itemCount: widget.itemCount,
      itemBuilder: (BuildContext context, int i) {
        return Padding(
          padding: widget.gridChildrendPadding ?? EdgeInsets.zero,
          child: MouseRegion(
            onHover: (data) => _setPosition(data.localPosition),
            child: _buildDraggable(widget.itemBuilder(context, i), i),
          ),
        );
      },
      key: widget.key,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: widget.controller,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
    );
  }

  void _setPosition(Offset offset) {
    setState(() {
      x = offset.dx - widget.feedbackWidth / 2;
      y = offset.dy - widget.feedbackHeight / 2;
    });
  }

// #region draggable

  Widget _buildDraggable(Widget itemWidget, int i) {
    int index = i;
    return DragTarget<int>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return LongPressDraggable<int>(
          delay: widget.longPressDuration,
          data: index,
          child: Stack(
            children: [
              itemWidget,
              Visibility(
                visible: !widget.canClickOnTile,
                child: PointerInterceptor(
                  child: Container(),
                ),
              ),
            ],
          ),
          feedback: Container(
            transform: Matrix4.translationValues(x, y, 0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[200],
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: widget.feedbackHeight,
            width: widget.feedbackWidth,
            child: widget.feedbackWidget ?? Center(child: Icon(Icons.tv)),
          ),
          childWhenDragging: widget.dragPlaceholderWidget ??
              Stack(
                children: [
                  itemWidget,
                  PointerInterceptor(
                    child: Container(),
                  ),
                ],
              ),
        );
      },
      onAccept: (int draggedIndex) {
        setState(() {
          _updateGrid(index, draggedIndex);
        });
      },
    );
  }

  void _updateGrid(int containerIndex, int draggedIndex) {
    if (containerIndex != draggedIndex) {
      setState(() {
        switch (widget.gridTileMover) {
          case GridTileMover.insert:
            widget.itemList
                .insert(containerIndex, widget.itemList.removeAt(draggedIndex));
            break;
          case GridTileMover.swap:
            var item = widget.itemList[containerIndex];
            widget.itemList[containerIndex] = widget.itemList[draggedIndex];
            widget.itemList[draggedIndex] = item;
            break;
        }
      });
    }
  }

// #endregion draggable
}

enum GridTileMover {
  insert,
  swap,
}
