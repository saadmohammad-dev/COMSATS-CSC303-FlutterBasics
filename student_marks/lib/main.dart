import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    home: GradeScreen(),
  ));

}

class GradeScreen extends StatelessWidget{
const GradeScreen({super.key});

Widget build(BuildContext contex){
return Scaffold(


appBar: AppBar(title: const Text("Student Grade Calculator")),
body: Center(
  child: GradeCalculator(marks: 0),
),
);
}
}



class GradeCalculator extends StatelessWidget{

  final int marks;
  const GradeCalculator({super.key,required this.marks});


String computedGrade(){
  if (marks < 50) return "F";
    else if (marks < 60) return "E";
    else if (marks < 70) return "D";
    else if (marks < 80) return "C";
    else if (marks < 90) return "B";
    else return "A";
}

Color getGradeColor(String grade){

if (grade == "A") return Colors.green;
    if (grade == "D" || grade == "E") return Colors.yellow;
    if (grade == "B" || grade == "C") return const Color.fromARGB(255, 232, 76, 201); // You asked for BC pink
    if (grade == "F") return Colors.red; // You asked for F pink
    return Colors.black; // Default color
}


Widget build(BuildContext contex){
String grade=computedGrade();


return Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
  Text("Marks: $marks",style: const TextStyle(fontSize: 25)),
  const SizedBox(height: 10),
  Text(
    "Grade: $grade",
    style: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: getGradeColor(grade),
    ),
  ),
],

);

}
}
