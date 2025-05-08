import 'package:flutter/material.dart';
import '../widgets/side_navigation.dart';

class MastersUpdate extends StatelessWidget {
  const MastersUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Masters Update")),
      drawer: Sidenavigationbar(),
      body: const Center(child: Text("Masters Update")),
    );
  }
}
