import '../entities/activity_result.dart';
import '../repositories/activity_results_repository.dart';

class GetActivityResultsUseCase {
  final ActivityResultsRepository repository;
  GetActivityResultsUseCase(this.repository);

  Future<List<ActivityResultEntity>> call(int childId) => repository.getResultsForChild(childId);
}
