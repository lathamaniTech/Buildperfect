import 'package:flutter/material.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class MyDraggableWidget extends StatelessWidget {
  final String data;
  final Function() onDragStart;
  final Widget child;
  const MyDraggableWidget({
    super.key,
    required this.data,
    required this.child,
    required this.onDragStart,
  });

  DragItem dragItemProvider(DragItemRequest request) {
    onDragStart();
    final item = DragItem(localData: data);
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return DragItemWidget(
      dragItemProvider: dragItemProvider,
      dragBuilder: (context, child) => Opacity(opacity: 0.7, child: child),
      allowedOperations: () => [DropOperation.copy],
      child: DraggableWidget(child: child),
    );
  }
}
