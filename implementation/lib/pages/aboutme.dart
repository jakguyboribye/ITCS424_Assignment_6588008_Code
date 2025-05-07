import 'package:flutter/material.dart';
import '../main.dart';
import 'todolist.dart';

class AboutMePage extends StatefulWidget{
    const AboutMePage({super.key});

    @override
    State<AboutMePage> createState() => AboutMePageState();
}

class AboutMePageState extends State<AboutMePage>{
  int _selectedIndex = 3;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'About me Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoList()));
      }, child: Text('To Do List'))
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
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          }
        },
      ),
    );
}
}