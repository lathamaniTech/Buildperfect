import 'package:flutter/material.dart';

class FloatingActionBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Floating Action Button Pressed")),
        );
      },
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
    );
  }
}