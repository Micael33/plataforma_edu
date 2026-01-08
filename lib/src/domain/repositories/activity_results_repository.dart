import '../entities/activity_result.dart';

abstract class ActivityResultsRepository {
  Future<int> recordResult(ActivityResultEntity result);
  Future<List<ActivityResultEntity>> getResultsForChild(int childId);
  Stream<List<ActivityResultEntity>> watchResultsForChild(int childId);
}
