// lib/grade_logic.dart

class GradeProcessor {
  // We make this function 'static' so we can use it without 
  // creating a new instance of the class every time.
  static String computeGrade(int marks) {
    if (marks < 50) return "F";
    if (marks < 60) return "E";
    if (marks < 70) return "D";
    if (marks < 80) return "C";
    if (marks < 90) return "B";
    return "A";
  }

  // You can move the color logic here too!
  static dynamic getGradeColor(String grade) {
    if (grade == "A") return 0xFF4CAF50; // Green hex code
    if (grade == "D" || grade == "E") return 0xFFFFEB3B; // Yellow
    if (grade == "B" || grade == "C") return 0xFFE91E63; // Pink
    return 0xFFE91E63; // F Pink
  }
}