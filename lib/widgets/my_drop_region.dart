import 'package:dashboard/types/drag_drop_types.dart';
import 'package:flutter/material.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class MyDropRegion extends StatefulWidget {
  final Size childSize;
  final int columns;
  final Panel panel;
  final void Function(PanelLocation) updateDropPreview;
  final Widget child;
  final VoidCallback onDrop;
  const MyDropRegion({
    super.key,
    required this.childSize,
    required this.panel,
    required this.columns,
    required this.updateDropPreview,
    required this.child,
    required this.onDrop,
  });

  @override
  State<MyDropRegion> createState() => _MyDropRegionState();
}

class _MyDropRegionState extends State<MyDropRegion> {
  int? dropIndex;
  _updatePreview(Offset hoverPosition) {
    final int row = hoverPosition.dy ~/ widget.childSize.height;
    final int column =
        (hoverPosition.dx - (widget.childSize.width / 2)) ~/
        widget.childSize.width;
    int newDropIndex = (row * widget.columns) + column;
    if (newDropIndex != dropIndex) {
      dropIndex = newDropIndex;
      widget.updateDropPreview((dropIndex!, widget.panel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropRegion(
      formats: Formats.standardFormats,
      onDropOver: (DropOverEvent event) {
        _updatePreview(event.position.local);
        return DropOperation.copy;
      },
      onPerformDrop: (ev) async {
        widget.onDrop();
      },
      child: widget.child,
    );
  }
}
