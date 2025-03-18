import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repository/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _repository;

  CourseProvider({required CourseRepository repository}) : _repository = repository;

  List<Course> get courses => _repository.getCourses();
  
  Course getCourseFor(String courseId) {
    return _repository.getCourses().firstWhere((course) => course.id == courseId);
  }

  void addScore(String courseId, CourseScore score) {
    final course = getCourseFor(courseId);
    _repository.addScore(course, score);
    notifyListeners();
  }
}