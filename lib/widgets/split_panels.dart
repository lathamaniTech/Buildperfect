import 'dart:math';

import 'package:dashboard/types/drag_drop_types.dart';
import 'package:dashboard/widgets/item_panel.dart';
import 'package:dashboard/widgets/my_drop_region.dart';
import 'package:flutter/material.dart';

class SplitPanel extends StatefulWidget {
  final int columns;
  final double itemSpacing;
  const SplitPanel({super.key, this.columns = 3, this.itemSpacing = 2.0});

  @override
  State<SplitPanel> createState() => _SplitPanelState();
}

class _SplitPanelState extends State<SplitPanel> {
  final List<String> upper = [];
  final List<String> lower = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];

  PanelLocation dragStart = (-1, Panel.lower);
  PanelLocation dropPreview = (0, Panel.lower);

  String hoveringData = '';

  /// this method is called when the itemplaceholder is dragged
  /// it's set  the state -> dragStart and data state properties
  ///
  void onItemDragStart(PanelLocation start) {
    final data = switch (start.$2) {
      Panel.upper => upper[start.$1],
      Panel.lower => lower[start.$1],
    };

    setState(() {
      dragStart = start;
      hoveringData = data;
    });
  }

  void updateDropPreview(PanelLocation update) => setState(() {
    dropPreview = update;
  });

  void drop() {
    setState(() {
      if (dropPreview.$2 == Panel.upper) {
        upper.insert(min(dropPreview.$1, upper.length), hoveringData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final gutter = widget.columns + 1;
        final spaceForColumns =
            constraints.maxWidth - (widget.itemSpacing * gutter);
        final columnWidth = spaceForColumns / widget.columns;
        final itemSize = Size(columnWidth, columnWidth);

        return Stack(
          children: [
            Positioned(
              // for draggable component
              width: constraints.maxWidth / 6,
              height: constraints.maxHeight,
              left: 0,
              child: MyDropRegion(
                onDrop: drop,
                updateDropPreview: updateDropPreview,
                childSize: itemSize,
                columns: widget.columns,
                panel: Panel.lower,

                child: ItemPanel(
                  crossAxisCount: widget.columns,
                  spacing: widget.itemSpacing,
                  items: lower,
                  onDragStart: onItemDragStart,
                  panel: Panel.lower,
                  dragStart: dragStart,
                  dropPreview: dropPreview,
                  hoveringData: hoveringData,
                ),
              ),
            ),
            Positioned(
              width: 2,
              height: constraints.maxHeight,
              left: constraints.maxHeight / 2,
              child: ColoredBox(color: Colors.black),
            ),
            Positioned(
              // for dragtarget
              width: constraints.maxWidth / 5,
              height: constraints.maxHeight,
              right: 0,
              child: MyDropRegion(
                onDrop: drop,
                updateDropPreview: updateDropPreview,
                childSize: itemSize,
                columns: widget.columns,
                panel: Panel.upper,
                child: ItemPanel(
                  crossAxisCount: widget.columns,
                  spacing: widget.itemSpacing,
                  items: upper,
                  onDragStart: onItemDragStart,
                  panel: Panel.upper,
                  dragStart: dragStart,
                  dropPreview: dropPreview,
                  hoveringData: hoveringData,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
