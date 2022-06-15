import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  int _selectedTab = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  void _onTabTapped(int index) {
    setState(
      () {
        _controller.animateToPage(index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linearToEaseOut);
        _selectedTab = index;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.grey[600]),
          titleTextStyle: TextStyle(color: Colors.grey[600], fontSize: 20),
          title: Text("ok"),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey[600],
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
                activeIcon: Icon(Icons.school_outlined)),
            BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: "Work",
                activeIcon: Icon(Icons.work_outline))
          ],
          currentIndex: _selectedTab,
          onTap: _onTabTapped,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Icon(Icons.add)),
        body: PageView(
          controller: _controller,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
          ],
          onPageChanged: (int i) {
            setState(() {
              _selectedTab = i;
            });
          },
        ),
        drawer: Drawer(
          child: Text("ok"),
        ),
      ),
    );
  }
}
