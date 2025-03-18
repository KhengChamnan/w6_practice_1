import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';
import 'course_score_form.dart';

const Color mainColor = Colors.blue;

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.courseId});

  final String courseId;

  
  Color _scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  Future<void> _addScore(BuildContext context) async {
    final score = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(
        builder: (ctx) => const CourseScoreForm(),
      ),
    );

    if (score != null) {
      Provider.of<CourseProvider>(context, listen: false).addScore(courseId, score);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CourseProvider>(context);
    final course = provider.getCourseFor(courseId);
    final scores = course.scores;

    Widget content = scores.isEmpty 
        ? const Center(child: Text('No Scores added yet.'))
        : ListView.builder(
            itemCount: scores.length,
            itemBuilder: (ctx, index) => ScoreTile(
              color: _scoreColor(scores[index].studenScore),
              score: scores[index]),
          );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () => _addScore(context), icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }


}

// ScoreTile widget to display a score
class ScoreTile extends StatelessWidget {
  final CourseScore score;
  final Color color;

  const ScoreTile({super.key, required this.score, required this.color});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(score.studentName),
      trailing: Text(
        score.studenScore.toString(),
        style: TextStyle(
          color: color,
          fontSize: 15,
        ),
      ),
    );
  }
}
