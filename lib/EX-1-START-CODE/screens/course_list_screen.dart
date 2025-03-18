import 'package:flutter/material.dart';
import '../models/course.dart';
import 'course_screen.dart';
import '../providers/course_provider.dart';
import 'package:provider/provider.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final courses = Provider.of<CourseProvider>(context).courses;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: Key(courses[index].id),
          child: CourseTile(course: courses[index]),
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course});

  final Course course;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () {
              // Push navigation to CourseScreen with the course ID
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseScreen(courseId: course.id),
                ),
              );
            },
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}
