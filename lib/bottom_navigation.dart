import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.teal,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.mail_outlined), label: "Application Inbox"),
        BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "Query Inbox"),
        BottomNavigationBarItem(icon: Icon(Icons.update_outlined), label: "Masters Update"),
      ],
    );
  }
}