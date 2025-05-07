
/*
 @created on : May 7,2025
 @author : Akshayaa 
 Description : Primary screen contains tab interface with options and switches views based on bottom navigation bar
*/

import 'package:flutter/material.dart';
import 'side_navigation.dart';
import 'bottom_navigation.dart';
import 'floating_action.dart';
import 'lead_tile_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String searchQuery = "";
  bool loading = false;

  Future<void> onItemTapped(int index) async {
    setState(() => loading = true);
    await Future.delayed(Duration(seconds:2));
    setState(() {
      selectedIndex = index;
      loading = false;
    });
  }
  
Widget getPage() {
  if (selectedIndex == 0) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.teal,
            child: TabBar(
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
                // 1. PendingLeads()
                ListView(
                  children: [
                    LeadTileCard(
                      title: "Rajesh",
                      subtitle: "1740984324466",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "03-03-2025",
                      location: "Chennai",
                      loanamount: "750000",
                    ),
                    LeadTileCard(
                      title: "Vishal",
                      subtitle: "1740984327286",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "03-05-2025",
                      location: "Chennai",
                      loanamount: "840000",
                    ),
                    LeadTileCard(
                      title: "Gaurav",
                      subtitle: "1742790445973",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "25-03-2025",
                      location: "Chennai",
                      loanamount: "100000",
                    ),
                    LeadTileCard(
                      title: "Shyam",
                      subtitle: "1742905368319",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "25-05-2025",
                      location: "Chennai",
                      loanamount: "125000",
                    ),
                  ],
                ),
                // CompletedLeads()
                ListView(
                  children: [
                    LeadTileCard(
                      title: "Rajesh",
                      subtitle: "1740984324466",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "03-03-2025",
                      location: "Chennai",
                      loanamount: "750000",
                    ),
                    LeadTileCard(
                      title: "Vishal",
                      subtitle: "1740984327286",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "03-05-2025",
                      location: "Chennai",
                      loanamount: "840000",
                    ),
                    LeadTileCard(
                      title: "Gaurav",
                      subtitle: "1742790445973",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "25-03-2025",
                      location: "Chennai",
                      loanamount: "100000",
                    ),
                    LeadTileCard(
                      title: "Shyam",
                      subtitle: "1742905368319",
                      icon: Icons.person,
                      color: Colors.teal,
                      phone: "7200517188",
                      createdon: "25-05-2025",
                      location: "Chennai",
                      loanamount: "125000",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    } else if (selectedIndex == 1) {
      return Center(child: Text("Application Inbox", style: TextStyle(fontSize: 24)));
    } else if (selectedIndex == 2) {
      return Center(child: Text("Query Inbox", style: TextStyle(fontSize: 24)));
    } else {
      return Center(child: Text("Masters Update", style: TextStyle(fontSize: 24)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidenavigationbar(),
      body: Column(
        children: [
          Container(
            color: Colors.teal,
            padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top + 16, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu, color: Colors.black),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Here',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() => searchQuery = value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (loading) LinearProgressIndicator(
            minHeight: 3,
          ),
          Expanded(child: getPage()),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
      floatingActionButton: FloatingActionBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}