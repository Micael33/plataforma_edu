class ChildEntity {
  final int? id;
  final String name;
  final DateTime? birthDate;
  final String profile; // ex: 'child'
  final int points;

  ChildEntity({this.id, required this.name, this.birthDate, this.profile = 'child', this.points = 0});
}