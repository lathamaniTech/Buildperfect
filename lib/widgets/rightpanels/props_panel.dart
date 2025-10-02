import 'package:flutter/material.dart';

class PropsPanel extends StatefulWidget {
  final double width;
  final double height;
  const PropsPanel({super.key, required this.width, required this.height});

  @override
  State<PropsPanel> createState() => _PropsPanelState();
}

class _PropsPanelState extends State<PropsPanel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: widget.width,
        height: widget.height,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Configure Formcontrol Properties',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(
              width: widget.width,
              height: 0.5,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black.withAlpha(100)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
