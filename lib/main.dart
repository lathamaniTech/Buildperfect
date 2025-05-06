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

class HomeScreenState extends State<HomeScreen> {
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
 @override
Widget build(BuildContext context) {
  return Scaffold(
    drawer: Sidenavigationbar(),
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.teal,
          expandedHeight: 100.0,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20, left: 16, right: 16),
              color: Colors.teal,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.white),
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
  ),
),
        SliverToBoxAdapter(
          child: pages[selectedIndex],
        ),
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