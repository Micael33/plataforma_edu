import 'difficulty.dart';

class ActivityReport {
  final int childId;
  final int totalAttempts;
  final double averageScore;
  final Map<Difficulty, int> countsByDifficulty;

  ActivityReport({required this.childId, required this.totalAttempts, required this.averageScore, required this.countsByDifficulty});
}