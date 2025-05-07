import 'package:flutter/material.dart';
import 'pending_leads.dart';
import 'completed_leads.dart';

class LeadTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.teal,
            child: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Pending"),
                Tab(text: "Completed"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                PendingLeads(),
                CompletedLeads(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
