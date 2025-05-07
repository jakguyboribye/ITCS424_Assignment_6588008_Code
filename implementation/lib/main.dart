import 'package:flutter/material.dart';
import '/pages/aboutme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newborn Actionable Guidance Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Home Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Text(
        '(implementations are in the fourth tab)',
        style: TextStyle(fontSize: 20),
      ),
    ],
  ),
),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.energy_savings_leaf),
            label: 'Grow',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.edit_document), label: 'Articles'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutMePage()),
            );
          }
        },
      ),
    );
  }

}
