import 'package:dashboard/widgets/rightpanels/panel_header.dart';
import 'package:flutter/material.dart';

class ActionsPanel extends StatefulWidget {
  final double width;
  final double height;

  const ActionsPanel({super.key, required this.width, required this.height});

  @override
  State<ActionsPanel> createState() => _ActionsPanelState();
}

class _ActionsPanelState extends State<ActionsPanel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            PanelHeader(
              panelWidth: widget.width,
              title: 'Configure Formcontrol Actions',
            ),
          ],
        ),
      ),
    );
  }
}
