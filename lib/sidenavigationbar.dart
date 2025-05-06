import 'package:flutter/material.dart';

class Sidenavigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.pending),
            title: Text("Pending"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.done),
            title: Text("Completed"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}