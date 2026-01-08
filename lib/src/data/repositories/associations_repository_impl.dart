import 'package:drift/drift.dart' as d;

import '../../domain/repositories/associations_repository.dart';
import '../local/database.dart';

class AssociationsRepositoryImpl implements AssociationsRepository {
  final AppDatabase _db;

  AssociationsRepositoryImpl(this._db);

  @override
  Future<void> associateChildToCaregiver({required int childId, required String caregiverId}) async {
    final companion = CaregiverChildrenCompanion(
      childId: d.Value(childId),
      caregiverId: d.Value(caregiverId),
    );
    await _db.associationsDao.insertAssociation(companion);
  }

  @override
  Future<List<int>> getChildIdsForCaregiver(String caregiverId) async {
    final rows = await _db.associationsDao.customSelect(
      'SELECT child_id FROM caregiver_children WHERE caregiver_id = ?',
      variables: [d.Variable.withString(caregiverId)],
      readsFrom: {_db.caregiverChildren},
    ).get();

    return rows.map((r) => r.data['child_id'] as int).toList();
  }
}
