import '../models/course.dart';
import 'course_repository.dart';

class CourseMockRepository extends CourseRepository {
  final List<Course> _courses = [
    Course(id: '1', name: 'Flutter Basics'),
    Course(id: '2', name: 'Dart Programming'),
    Course(id: '3', name: 'State Management'),
    Course(id: '4', name: 'Firebase'),
  ];

  @override
  List<Course> getCourses() {
    return _courses;
  }
  @override
  void addScore(Course course, CourseScore score) {
    final courseIndex = _courses.indexWhere((c) => c.id == course.id);
    if (courseIndex != -1) {
      _courses[courseIndex].addScore(score);
    }
  }
}
