import 'package:flutter/material.dart';

class DatasourcePanel extends StatefulWidget {
  final double width;
  final double height;

  const DatasourcePanel({super.key, required this.width, required this.height});

  @override
  State<DatasourcePanel> createState() => _DatasourcePanelState();
}

class _DatasourcePanelState extends State<DatasourcePanel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(children: [Text('Datasource Panel')]),
      ),
    );
  }
}
