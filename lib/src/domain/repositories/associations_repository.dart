abstract class AssociationsRepository {
  Future<void> associateChildToCaregiver({required int childId, required String caregiverId});
  Future<List<int>> getChildIdsForCaregiver(String caregiverId);
}