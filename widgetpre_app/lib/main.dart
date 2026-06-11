import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Registration',
      home: const CourseRegistrationPage(),
    );
  }
}

class CourseRegistrationPage extends StatefulWidget {
  const CourseRegistrationPage({super.key});

  @override
  State<CourseRegistrationPage> createState() => _CourseRegistrationPageState();
}

class _CourseRegistrationPageState extends State<CourseRegistrationPage> {
  // List of available courses
  final List<String> courses = [
    'Mobile App Development',
    'Database Systems',
    'Web Development',
    'Artificial Intelligence',
    'CYBER SECURITY',
  ];

  // Default selected course
  String selectedCourse = 'Mobile App Development';

  void enrollCourse() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Successfully enrolled in $selectedCourse'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Registration App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select a Course',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // DropdownButton Widget
              DropdownButton<String>(
                value: selectedCourse,
                items: courses.map((course) {
                  return DropdownMenuItem(value: course, child: Text(course));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              Text(
                'Selected Course:',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),

              const SizedBox(height: 10),

              Text(
                selectedCourse,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              // IconButton Widget
              IconButton(
                icon: const Icon(Icons.school),
                iconSize: 60,
                color: Colors.blue,
                tooltip: 'Enroll',
                onPressed: enrollCourse,
              ),

              const SizedBox(height: 10),

              const Text(
                'Tap the icon to enroll',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 