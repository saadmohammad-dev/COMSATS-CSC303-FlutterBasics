import 'package:flutter/material.dart';
import 'grade_logic.dart'; // Import your logic file

void main() {
  runApp(const MaterialApp(home: GradeApp()));
}

class GradeApp extends StatefulWidget {
  const GradeApp({super.key});

  @override
  State<GradeApp> createState() => _GradeAppState();
}

class _GradeAppState extends State<GradeApp> {
  // 1. Controller to capture user typing
  final TextEditingController _controller = TextEditingController();
  
  // 2. Variable to hold the current marks (default 0)
  int _currentMarks = 0;

  @override
  Widget build(BuildContext context) {
    // 3. Get Grade and Color from our Logic file
    String grade = GradeProcessor.computeGrade(_currentMarks);
    Color gradeColor = Color(GradeProcessor.getGradeColor(grade));

    return Scaffold(
      appBar: AppBar(title: const Text("Interactive Grade Calc")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // USER INPUT FIELD
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number, // Shows numeric keyboard
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Student Marks",
                hintText: "e.g. 85",
              ),
              onChanged: (value) {
                // 4. Update the 'State' every time the user types
                setState(() {
                  _currentMarks = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 30),
            
            // RESULT DISPLAY
            Text(
              "Grade: $grade",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: gradeColor, // Dynamic Color!
              ),
            ),
          ],
        ),
      ),
    );
  }
}