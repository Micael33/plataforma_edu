import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart' as _g;

import '../../domain/usecases/get_activity_report_usecase.dart';
import '../../domain/entities/activity_report.dart';
import '../../domain/repositories/activity_results_repository.dart';

final activityReportProvider = FutureProvider.family<ActivityReport, int>((ref, childId) {
  final repo = ref.read(_activityResultsRepositoryProvider);
  final usecase = GetActivityReportUseCase(repo);
  return usecase.call(childId);
});

ActivityResultsRepository import_getit_activity_repo_for_report() => _g.GetIt.instance<ActivityResultsRepository>();
final _activityResultsRepositoryProvider = Provider<ActivityResultsRepository>((ref) => import_getit_activity_repo_for_report());