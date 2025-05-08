import 'package:flutter/material.dart';
import '../widgets/side_navigation.dart';

class ApplicationInbox extends StatelessWidget {
  const ApplicationInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Application Inbox")),
      drawer: Sidenavigationbar(),
      body: const Center(child: Text("Application Inbox")),
    );
  }
}
