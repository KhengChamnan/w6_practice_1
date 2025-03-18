import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/course_provider.dart';
import 'screens/course_list_screen.dart';
import 'repository/course_mock_repository.dart';

void main() {
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => CourseProvider(repository: CourseMockRepository()),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: CourseListScreen(),
    );
  }
}
