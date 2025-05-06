import 'package:flutter/material.dart';
import 'sidenavigationbar.dart';
import 'bottomnavigationbar.dart';
import 'floatingactionbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  String searchQuery = "";

  final List<Widget> pages = [
    Center(child: Text("Dashboard", style: TextStyle(fontSize: 24))),
    Center(child: Text("Application Inbox", style: TextStyle(fontSize: 24))),
    Center(child: Text("Query Inbox", style: TextStyle(fontSize: 24))),
    Center(child: Text("Masters Update", style: TextStyle(fontSize: 24))),
  ];

  void onItemTapped(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Sidenavigationbar(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              expandedHeight: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(120),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          16,
                          MediaQuery.of(context).padding.top + 12,
                          16,
                          8,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
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
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value) {
                                    setState(() => searchQuery = value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black87,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(text: "Pending"),
                          Tab(text: "Completed"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  pages[selectedIndex],
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
        floatingActionButton: FloatingActionBarWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
