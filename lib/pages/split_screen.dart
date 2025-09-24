/*
@author     : karthick.d  23/09/2025
@desc       : split screen divides the scree in to two section where one part 
              is for widgets for draggable  and another for dragtarget canvas
              
              need two instance fields for no of columns 
              and no of 

*/

import 'package:dashboard/widgets/split_panels.dart';
import 'package:flutter/material.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});
  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplitPanel());
  }
}
