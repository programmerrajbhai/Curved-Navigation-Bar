import 'package:carved_bottom_navigation/pages/notification.dart';
import 'package:carved_bottom_navigation/pages/people.dart';
import 'package:carved_bottom_navigation/pages/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pages = [
    Icon(Icons.people, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.notifications, size: 30),
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Curved Navigation Bar"),
        backgroundColor: Colors.blue[300],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: pages,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex; // Ensure the UI refreshes when an item is tapped
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
      ),
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;

    switch (index) {
      case 0:
        widget = People();
        break;
      case 1:
        widget = Search();
        break;
      case 2:
        widget = Notificationss();
        break;
      default:
        widget = Notificationss();
        break;
    }

    return widget;
  }
}