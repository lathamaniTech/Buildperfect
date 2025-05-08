import 'package:flutter/material.dart';
import '../widgets/side_navigation.dart';

class QueryInbox extends StatelessWidget {
  const QueryInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Query Inbox")),
      drawer: Sidenavigationbar(),
      body: const Center(child: Text("Query Inbox")),
    );
  }
}
