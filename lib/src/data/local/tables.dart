import 'package:drift/drift.dart';

class Children extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get profile => text().withLength(min: 1, max: 50).withDefault(const Constant('child'))();
  IntColumn get points => integer().withDefault(const Constant(0))();
}

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get email => text().nullable()();
  TextColumn get role => text().withLength(min: 1, max: 20).withDefault(const Constant('caregiver'))();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class CaregiverChildren extends Table {
  IntColumn get childId => integer().customConstraint('REFERENCES children(id) NOT NULL')();
  TextColumn get caregiverId => text().customConstraint('REFERENCES users(id) NOT NULL')();

  @override
  Set<Column> get primaryKey => {childId, caregiverId};
}

class ActivityResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get activityType => text().withLength(min: 1, max: 100)();
  IntColumn get childId => integer().customConstraint('REFERENCES children(id)')();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  IntColumn get score => integer().withDefault(const Constant(0))();
  TextColumn get difficulty => text().withLength(min: 1, max: 20).withDefault(const Constant('normal'))();
}
