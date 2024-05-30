import 'package:flutter/material.dart';
import 'package:quiz_1/question_1/screens/question_1_screen.dart';
import 'package:quiz_1/question_2/screens/question_2_screen.dart';
import 'package:quiz_1/question_3/screens/question_3_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedScreen = 1;
  List<Widget> screens = const [
    Question1Screen(),
    Question2Screen(),
    Question3Screen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedScreen = index;
          });
        },
        currentIndex: selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.model_training),
            label: 'Question 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slow_motion_video),
            label: 'Question 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Question 3',
          ),
        ],
      ),
    );
  }
}
