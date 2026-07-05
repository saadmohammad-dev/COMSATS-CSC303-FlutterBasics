import 'package:flutter/material.dart';
import 'dart:math'; // Still need this for the "coin flip"

void main() {
  runApp(const MaterialApp(home: NameScreen()));
}

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> studentNames = ["saad Ali", "mahad", "zeeshan- ", "Sir Ahmed ali"];
    return Scaffold(
      appBar: AppBar(centerTitle: true,
  backgroundColor: const Color.fromARGB(255, 116, 184, 239),
  foregroundColor: const Color.fromARGB(255, 134, 94, 80),
  title: const Text(
    "Daily Attendance",  
    style: TextStyle( 
      fontWeight: FontWeight.bold, // Text is now bold
      fontSize: 20,
      color: Colors.white,
    ),
  ),
),

      body: Container( // Container is required to set color
    color: const Color.fromARGB(79, 241, 239, 186) ,// Color for body only
    
    child: Center(child: Attendance(names: studentNames)),
      ),
      );
  }



}

class Attendance extends StatelessWidget {
  final List<String> names;
  const Attendance({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: names.map((name) {
        // REAL LOGIC: Instead of 0 or 1, we use a Boolean (True/False)
        // random.nextBool() is exactly like flipping a real coin.
        bool isPresent = random.nextBool(); 

        return Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        
          decoration: BoxDecoration(
            color: isPresent ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              // We convert the Boolean to a Real Word here
              Text(
                isPresent ? "Present" : "Absent",
                style: TextStyle(
                  color: isPresent ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}