/*
@author     :   karthick.d  30/09/2025
@desc       :   rightpanel contains the components for configuring UDF (user defined fields)
                right panel have segment button for configuration segments
                conf segment 1 - properties 
                     {properties} segment wraps formcontrol properties
                     {action}     segment wraps formcontrols events
                     {datasource} segment wraps datasource for dropdown fields
                the above three components encaps in widgets 
                [FormControlProperties] - wraps all controls for props conf
                [FormControlActions]    - wraps all controls for events conf
                [FormControlDataSource] - wraps all controls for control's DS
*/
import 'package:dashboard/widgets/page_props_button_segment.dart';
import 'package:flutter/material.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({super.key});

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [PagePropsButtonSegment()]),
    );
  }
}
