import '../entities/activity_report.dart';
import '../entities/difficulty.dart';
import '../repositories/activity_results_repository.dart';

class GetActivityReportUseCase {
  final ActivityResultsRepository repository;
  GetActivityReportUseCase(this.repository);

  Future<ActivityReport> call(int childId) async {
    final results = await repository.getResultsForChild(childId);

    final total = results.length;
    final avg = total == 0 ? 0.0 : results.map((r) => r.score).reduce((a, b) => a + b) / total;

    final counts = <Difficulty, int>{};
    for (final d in Difficulty.values) counts[d] = 0;

    for (final r in results) {
      counts[r.difficulty] = (counts[r.difficulty] ?? 0) + 1;
    }

    return ActivityReport(childId: childId, totalAttempts: total, averageScore: avg, countsByDifficulty: counts);
  }
}