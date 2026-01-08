import 'difficulty.dart';

class ActivityResultEntity {
  final int? id;
  final String activityType;
  final int childId;
  final DateTime timestamp;
  final int score;
  final Difficulty difficulty;

  ActivityResultEntity({this.id, required this.activityType, required this.childId, required this.timestamp, required this.score, this.difficulty = Difficulty.normal});
}