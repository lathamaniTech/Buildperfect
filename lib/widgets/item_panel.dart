import 'dart:math';

import 'package:dashboard/types/drag_drop_types.dart';
import 'package:dashboard/widgets/my_draggable_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ItemPanel extends StatelessWidget {
  final List<String> items;
  final int crossAxisCount;
  final double spacing;
  final Function(PanelLocation) onDragStart;
  final Panel panel;
  final PanelLocation? dragStart;
  final PanelLocation? dropPreview;
  final String? hoveringData;
  const ItemPanel({
    super.key,
    required this.items,
    required this.crossAxisCount,
    required this.spacing,
    required this.onDragStart,
    required this.panel,
    required this.dragStart,
    required this.dropPreview,
    required this.hoveringData,
  });

  @override
  Widget build(BuildContext context) {
    /// have a copy of dragstartCopy to keep the local copy
    /// so
    final itemsCopy = List<String>.from(items);

    PanelLocation? dragStartCopy;
    PanelLocation? dropPreviewCopy;

    if (dragStart != null) {
      dragStartCopy = dragStart!.copyWith(null, null);
    }

    if (dropPreview != null && hoveringData != null) {
      dropPreviewCopy = dropPreview!.copyWith(
        min(items.length, dropPreview!.$1),
        null,
      );
      itemsCopy.insert(min(dropPreview!.$1, itemsCopy.length), hoveringData!);
    }

    return GridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      padding: const EdgeInsets.all(4),
      children:
          itemsCopy.asMap().entries.map<Widget>((e) {
            Color textColor =
                e.key == dragStartCopy!.$1 || e.key == dropPreviewCopy!.$1
                    ? Colors.grey
                    : Colors.white;
            Widget child = Center(
              child: Text(
                e.value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, color: textColor),
              ),
            );
            if (e.key == dragStartCopy.$1) {
              child = Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: child,
              );
            } else if (e.key == dropPreviewCopy!.$1) {
              //if dropPreview index == e.key
              child = DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(8),
                  strokeWidth: 2,
                  dashPattern: [10, 10],
                  color: Colors.grey,
                ),
                child: child,
              );
            } else {
              child = Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: child,
              );
            }

            return Draggable(
              feedback: child,
              child: MyDraggableWidget(
                data: e.value,
                onDragStart: () => onDragStart((e.key, panel)),
                child: child,
              ),
            );
          }).toList(),
    );
  }
}
