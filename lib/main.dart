import 'package:flutter/material.dart';
import 'package:food_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  List pages = <Widget>[
    const HomePage(),
    Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: const Text('Page 2'),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        currentIndex: currentPageIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
