import '../entities/activity_result.dart';
import '../repositories/activity_results_repository.dart';

class RecordActivityResultUseCase {
  final ActivityResultsRepository repository;
  RecordActivityResultUseCase(this.repository);

  Future<int> call(ActivityResultEntity result) => repository.recordResult(result);
}
