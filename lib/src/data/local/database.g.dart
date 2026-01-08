// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ChildrenTable extends Children
    with TableInfo<$ChildrenTable, ChildrenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildrenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profileMeta = const VerificationMeta(
    'profile',
  );
  @override
  late final GeneratedColumn<String> profile = GeneratedColumn<String>(
    'profile',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('child'),
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, birthDate, profile, points];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'children';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChildrenData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('profile')) {
      context.handle(
        _profileMeta,
        profile.isAcceptableOrUnknown(data['profile']!, _profileMeta),
      );
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChildrenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChildrenData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      profile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
    );
  }

  @override
  $ChildrenTable createAlias(String alias) {
    return $ChildrenTable(attachedDatabase, alias);
  }
}

class ChildrenData extends DataClass implements Insertable<ChildrenData> {
  final int id;
  final String name;
  final DateTime? birthDate;
  final String profile;
  final int points;
  const ChildrenData({
    required this.id,
    required this.name,
    this.birthDate,
    required this.profile,
    required this.points,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    map['profile'] = Variable<String>(profile);
    map['points'] = Variable<int>(points);
    return map;
  }

  ChildrenCompanion toCompanion(bool nullToAbsent) {
    return ChildrenCompanion(
      id: Value(id),
      name: Value(name),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      profile: Value(profile),
      points: Value(points),
    );
  }

  factory ChildrenData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChildrenData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      profile: serializer.fromJson<String>(json['profile']),
      points: serializer.fromJson<int>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'profile': serializer.toJson<String>(profile),
      'points': serializer.toJson<int>(points),
    };
  }

  ChildrenData copyWith({
    int? id,
    String? name,
    Value<DateTime?> birthDate = const Value.absent(),
    String? profile,
    int? points,
  }) => ChildrenData(
    id: id ?? this.id,
    name: name ?? this.name,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    profile: profile ?? this.profile,
    points: points ?? this.points,
  );
  ChildrenData copyWithCompanion(ChildrenCompanion data) {
    return ChildrenData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      profile: data.profile.present ? data.profile.value : this.profile,
      points: data.points.present ? data.points.value : this.points,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChildrenData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('profile: $profile, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, birthDate, profile, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChildrenData &&
          other.id == this.id &&
          other.name == this.name &&
          other.birthDate == this.birthDate &&
          other.profile == this.profile &&
          other.points == this.points);
}

class ChildrenCompanion extends UpdateCompanion<ChildrenData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> birthDate;
  final Value<String> profile;
  final Value<int> points;
  const ChildrenCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.profile = const Value.absent(),
    this.points = const Value.absent(),
  });
  ChildrenCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.birthDate = const Value.absent(),
    this.profile = const Value.absent(),
    this.points = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ChildrenData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? birthDate,
    Expression<String>? profile,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (birthDate != null) 'birth_date': birthDate,
      if (profile != null) 'profile': profile,
      if (points != null) 'points': points,
    });
  }

  ChildrenCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime?>? birthDate,
    Value<String>? profile,
    Value<int>? points,
  }) {
    return ChildrenCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      profile: profile ?? this.profile,
      points: points ?? this.points,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (profile.present) {
      map['profile'] = Variable<String>(profile.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildrenCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('profile: $profile, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('caregiver'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, email, role, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String name;
  final String? email;
  final String role;
  final DateTime? createdAt;
  const User({
    required this.id,
    required this.name,
    this.email,
    required this.role,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      role: Value(role),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      role: serializer.fromJson<String>(json['role']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'role': serializer.toJson<String>(role),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  User copyWith({
    String? id,
    String? name,
    Value<String?> email = const Value.absent(),
    String? role,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    role: role ?? this.role,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      role: data.role.present ? data.role.value : this.role,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, role, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.role == this.role &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> email;
  final Value<String> role;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String name,
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? role,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? email,
    Value<String>? role,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CaregiverChildrenTable extends CaregiverChildren
    with TableInfo<$CaregiverChildrenTable, CaregiverChildrenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaregiverChildrenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES children(id) NOT NULL',
  );
  static const VerificationMeta _caregiverIdMeta = const VerificationMeta(
    'caregiverId',
  );
  @override
  late final GeneratedColumn<String> caregiverId = GeneratedColumn<String>(
    'caregiver_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES users(id) NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [childId, caregiverId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'caregiver_children';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaregiverChildrenData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('caregiver_id')) {
      context.handle(
        _caregiverIdMeta,
        caregiverId.isAcceptableOrUnknown(
          data['caregiver_id']!,
          _caregiverIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_caregiverIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {childId, caregiverId};
  @override
  CaregiverChildrenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaregiverChildrenData(
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}child_id'],
      )!,
      caregiverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caregiver_id'],
      )!,
    );
  }

  @override
  $CaregiverChildrenTable createAlias(String alias) {
    return $CaregiverChildrenTable(attachedDatabase, alias);
  }
}

class CaregiverChildrenData extends DataClass
    implements Insertable<CaregiverChildrenData> {
  final int childId;
  final String caregiverId;
  const CaregiverChildrenData({
    required this.childId,
    required this.caregiverId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['child_id'] = Variable<int>(childId);
    map['caregiver_id'] = Variable<String>(caregiverId);
    return map;
  }

  CaregiverChildrenCompanion toCompanion(bool nullToAbsent) {
    return CaregiverChildrenCompanion(
      childId: Value(childId),
      caregiverId: Value(caregiverId),
    );
  }

  factory CaregiverChildrenData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaregiverChildrenData(
      childId: serializer.fromJson<int>(json['childId']),
      caregiverId: serializer.fromJson<String>(json['caregiverId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'childId': serializer.toJson<int>(childId),
      'caregiverId': serializer.toJson<String>(caregiverId),
    };
  }

  CaregiverChildrenData copyWith({int? childId, String? caregiverId}) =>
      CaregiverChildrenData(
        childId: childId ?? this.childId,
        caregiverId: caregiverId ?? this.caregiverId,
      );
  CaregiverChildrenData copyWithCompanion(CaregiverChildrenCompanion data) {
    return CaregiverChildrenData(
      childId: data.childId.present ? data.childId.value : this.childId,
      caregiverId: data.caregiverId.present
          ? data.caregiverId.value
          : this.caregiverId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaregiverChildrenData(')
          ..write('childId: $childId, ')
          ..write('caregiverId: $caregiverId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(childId, caregiverId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaregiverChildrenData &&
          other.childId == this.childId &&
          other.caregiverId == this.caregiverId);
}

class CaregiverChildrenCompanion
    extends UpdateCompanion<CaregiverChildrenData> {
  final Value<int> childId;
  final Value<String> caregiverId;
  final Value<int> rowid;
  const CaregiverChildrenCompanion({
    this.childId = const Value.absent(),
    this.caregiverId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CaregiverChildrenCompanion.insert({
    required int childId,
    required String caregiverId,
    this.rowid = const Value.absent(),
  }) : childId = Value(childId),
       caregiverId = Value(caregiverId);
  static Insertable<CaregiverChildrenData> custom({
    Expression<int>? childId,
    Expression<String>? caregiverId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (childId != null) 'child_id': childId,
      if (caregiverId != null) 'caregiver_id': caregiverId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CaregiverChildrenCompanion copyWith({
    Value<int>? childId,
    Value<String>? caregiverId,
    Value<int>? rowid,
  }) {
    return CaregiverChildrenCompanion(
      childId: childId ?? this.childId,
      caregiverId: caregiverId ?? this.caregiverId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (caregiverId.present) {
      map['caregiver_id'] = Variable<String>(caregiverId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaregiverChildrenCompanion(')
          ..write('childId: $childId, ')
          ..write('caregiverId: $caregiverId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActivityResultsTable extends ActivityResults
    with TableInfo<$ActivityResultsTable, ActivityResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activityTypeMeta = const VerificationMeta(
    'activityType',
  );
  @override
  late final GeneratedColumn<String> activityType = GeneratedColumn<String>(
    'activity_type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES children(id)',
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('normal'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    activityType,
    childId,
    timestamp,
    score,
    difficulty,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_type')) {
      context.handle(
        _activityTypeMeta,
        activityType.isAcceptableOrUnknown(
          data['activity_type']!,
          _activityTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_activityTypeMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityResult(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_type'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}child_id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
    );
  }

  @override
  $ActivityResultsTable createAlias(String alias) {
    return $ActivityResultsTable(attachedDatabase, alias);
  }
}

class ActivityResult extends DataClass implements Insertable<ActivityResult> {
  final int id;
  final String activityType;
  final int childId;
  final DateTime timestamp;
  final int score;
  final String difficulty;
  const ActivityResult({
    required this.id,
    required this.activityType,
    required this.childId,
    required this.timestamp,
    required this.score,
    required this.difficulty,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_type'] = Variable<String>(activityType);
    map['child_id'] = Variable<int>(childId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['score'] = Variable<int>(score);
    map['difficulty'] = Variable<String>(difficulty);
    return map;
  }

  ActivityResultsCompanion toCompanion(bool nullToAbsent) {
    return ActivityResultsCompanion(
      id: Value(id),
      activityType: Value(activityType),
      childId: Value(childId),
      timestamp: Value(timestamp),
      score: Value(score),
      difficulty: Value(difficulty),
    );
  }

  factory ActivityResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityResult(
      id: serializer.fromJson<int>(json['id']),
      activityType: serializer.fromJson<String>(json['activityType']),
      childId: serializer.fromJson<int>(json['childId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      score: serializer.fromJson<int>(json['score']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityType': serializer.toJson<String>(activityType),
      'childId': serializer.toJson<int>(childId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'score': serializer.toJson<int>(score),
      'difficulty': serializer.toJson<String>(difficulty),
    };
  }

  ActivityResult copyWith({
    int? id,
    String? activityType,
    int? childId,
    DateTime? timestamp,
    int? score,
    String? difficulty,
  }) => ActivityResult(
    id: id ?? this.id,
    activityType: activityType ?? this.activityType,
    childId: childId ?? this.childId,
    timestamp: timestamp ?? this.timestamp,
    score: score ?? this.score,
    difficulty: difficulty ?? this.difficulty,
  );
  ActivityResult copyWithCompanion(ActivityResultsCompanion data) {
    return ActivityResult(
      id: data.id.present ? data.id.value : this.id,
      activityType: data.activityType.present
          ? data.activityType.value
          : this.activityType,
      childId: data.childId.present ? data.childId.value : this.childId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      score: data.score.present ? data.score.value : this.score,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityResult(')
          ..write('id: $id, ')
          ..write('activityType: $activityType, ')
          ..write('childId: $childId, ')
          ..write('timestamp: $timestamp, ')
          ..write('score: $score, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, activityType, childId, timestamp, score, difficulty);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityResult &&
          other.id == this.id &&
          other.activityType == this.activityType &&
          other.childId == this.childId &&
          other.timestamp == this.timestamp &&
          other.score == this.score &&
          other.difficulty == this.difficulty);
}

class ActivityResultsCompanion extends UpdateCompanion<ActivityResult> {
  final Value<int> id;
  final Value<String> activityType;
  final Value<int> childId;
  final Value<DateTime> timestamp;
  final Value<int> score;
  final Value<String> difficulty;
  const ActivityResultsCompanion({
    this.id = const Value.absent(),
    this.activityType = const Value.absent(),
    this.childId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.score = const Value.absent(),
    this.difficulty = const Value.absent(),
  });
  ActivityResultsCompanion.insert({
    this.id = const Value.absent(),
    required String activityType,
    required int childId,
    this.timestamp = const Value.absent(),
    this.score = const Value.absent(),
    this.difficulty = const Value.absent(),
  }) : activityType = Value(activityType),
       childId = Value(childId);
  static Insertable<ActivityResult> custom({
    Expression<int>? id,
    Expression<String>? activityType,
    Expression<int>? childId,
    Expression<DateTime>? timestamp,
    Expression<int>? score,
    Expression<String>? difficulty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityType != null) 'activity_type': activityType,
      if (childId != null) 'child_id': childId,
      if (timestamp != null) 'timestamp': timestamp,
      if (score != null) 'score': score,
      if (difficulty != null) 'difficulty': difficulty,
    });
  }

  ActivityResultsCompanion copyWith({
    Value<int>? id,
    Value<String>? activityType,
    Value<int>? childId,
    Value<DateTime>? timestamp,
    Value<int>? score,
    Value<String>? difficulty,
  }) {
    return ActivityResultsCompanion(
      id: id ?? this.id,
      activityType: activityType ?? this.activityType,
      childId: childId ?? this.childId,
      timestamp: timestamp ?? this.timestamp,
      score: score ?? this.score,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activityType.present) {
      map['activity_type'] = Variable<String>(activityType.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityResultsCompanion(')
          ..write('id: $id, ')
          ..write('activityType: $activityType, ')
          ..write('childId: $childId, ')
          ..write('timestamp: $timestamp, ')
          ..write('score: $score, ')
          ..write('difficulty: $difficulty')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChildrenTable children = $ChildrenTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $CaregiverChildrenTable caregiverChildren =
      $CaregiverChildrenTable(this);
  late final $ActivityResultsTable activityResults = $ActivityResultsTable(
    this,
  );
  late final ChildrenDao childrenDao = ChildrenDao(this as AppDatabase);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  late final AssociationsDao associationsDao = AssociationsDao(
    this as AppDatabase,
  );
  late final ActivityResultsDao activityResultsDao = ActivityResultsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    children,
    users,
    caregiverChildren,
    activityResults,
  ];
}

typedef $$ChildrenTableCreateCompanionBuilder =
    ChildrenCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime?> birthDate,
      Value<String> profile,
      Value<int> points,
    });
typedef $$ChildrenTableUpdateCompanionBuilder =
    ChildrenCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime?> birthDate,
      Value<String> profile,
      Value<int> points,
    });

final class $$ChildrenTableReferences
    extends BaseReferences<_$AppDatabase, $ChildrenTable, ChildrenData> {
  $$ChildrenTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $CaregiverChildrenTable,
    List<CaregiverChildrenData>
  >
  _caregiverChildrenRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.caregiverChildren,
        aliasName: $_aliasNameGenerator(
          db.children.id,
          db.caregiverChildren.childId,
        ),
      );

  $$CaregiverChildrenTableProcessedTableManager get caregiverChildrenRefs {
    final manager = $$CaregiverChildrenTableTableManager(
      $_db,
      $_db.caregiverChildren,
    ).filter((f) => f.childId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _caregiverChildrenRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ActivityResultsTable, List<ActivityResult>>
  _activityResultsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.activityResults,
    aliasName: $_aliasNameGenerator(db.children.id, db.activityResults.childId),
  );

  $$ActivityResultsTableProcessedTableManager get activityResultsRefs {
    final manager = $$ActivityResultsTableTableManager(
      $_db,
      $_db.activityResults,
    ).filter((f) => f.childId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _activityResultsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChildrenTableFilterComposer
    extends Composer<_$AppDatabase, $ChildrenTable> {
  $$ChildrenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profile => $composableBuilder(
    column: $table.profile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> caregiverChildrenRefs(
    Expression<bool> Function($$CaregiverChildrenTableFilterComposer f) f,
  ) {
    final $$CaregiverChildrenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caregiverChildren,
      getReferencedColumn: (t) => t.childId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaregiverChildrenTableFilterComposer(
            $db: $db,
            $table: $db.caregiverChildren,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> activityResultsRefs(
    Expression<bool> Function($$ActivityResultsTableFilterComposer f) f,
  ) {
    final $$ActivityResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.activityResults,
      getReferencedColumn: (t) => t.childId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityResultsTableFilterComposer(
            $db: $db,
            $table: $db.activityResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChildrenTableOrderingComposer
    extends Composer<_$AppDatabase, $ChildrenTable> {
  $$ChildrenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profile => $composableBuilder(
    column: $table.profile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChildrenTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChildrenTable> {
  $$ChildrenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get profile =>
      $composableBuilder(column: $table.profile, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  Expression<T> caregiverChildrenRefs<T extends Object>(
    Expression<T> Function($$CaregiverChildrenTableAnnotationComposer a) f,
  ) {
    final $$CaregiverChildrenTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.caregiverChildren,
          getReferencedColumn: (t) => t.childId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CaregiverChildrenTableAnnotationComposer(
                $db: $db,
                $table: $db.caregiverChildren,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> activityResultsRefs<T extends Object>(
    Expression<T> Function($$ActivityResultsTableAnnotationComposer a) f,
  ) {
    final $$ActivityResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.activityResults,
      getReferencedColumn: (t) => t.childId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.activityResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChildrenTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChildrenTable,
          ChildrenData,
          $$ChildrenTableFilterComposer,
          $$ChildrenTableOrderingComposer,
          $$ChildrenTableAnnotationComposer,
          $$ChildrenTableCreateCompanionBuilder,
          $$ChildrenTableUpdateCompanionBuilder,
          (ChildrenData, $$ChildrenTableReferences),
          ChildrenData,
          PrefetchHooks Function({
            bool caregiverChildrenRefs,
            bool activityResultsRefs,
          })
        > {
  $$ChildrenTableTableManager(_$AppDatabase db, $ChildrenTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChildrenTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChildrenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChildrenTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String> profile = const Value.absent(),
                Value<int> points = const Value.absent(),
              }) => ChildrenCompanion(
                id: id,
                name: name,
                birthDate: birthDate,
                profile: profile,
                points: points,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String> profile = const Value.absent(),
                Value<int> points = const Value.absent(),
              }) => ChildrenCompanion.insert(
                id: id,
                name: name,
                birthDate: birthDate,
                profile: profile,
                points: points,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChildrenTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({caregiverChildrenRefs = false, activityResultsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (caregiverChildrenRefs) db.caregiverChildren,
                    if (activityResultsRefs) db.activityResults,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (caregiverChildrenRefs)
                        await $_getPrefetchedData<
                          ChildrenData,
                          $ChildrenTable,
                          CaregiverChildrenData
                        >(
                          currentTable: table,
                          referencedTable: $$ChildrenTableReferences
                              ._caregiverChildrenRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChildrenTableReferences(
                                db,
                                table,
                                p0,
                              ).caregiverChildrenRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.childId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (activityResultsRefs)
                        await $_getPrefetchedData<
                          ChildrenData,
                          $ChildrenTable,
                          ActivityResult
                        >(
                          currentTable: table,
                          referencedTable: $$ChildrenTableReferences
                              ._activityResultsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChildrenTableReferences(
                                db,
                                table,
                                p0,
                              ).activityResultsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.childId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ChildrenTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChildrenTable,
      ChildrenData,
      $$ChildrenTableFilterComposer,
      $$ChildrenTableOrderingComposer,
      $$ChildrenTableAnnotationComposer,
      $$ChildrenTableCreateCompanionBuilder,
      $$ChildrenTableUpdateCompanionBuilder,
      (ChildrenData, $$ChildrenTableReferences),
      ChildrenData,
      PrefetchHooks Function({
        bool caregiverChildrenRefs,
        bool activityResultsRefs,
      })
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String name,
      Value<String?> email,
      Value<String> role,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> email,
      Value<String> role,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $CaregiverChildrenTable,
    List<CaregiverChildrenData>
  >
  _caregiverChildrenRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.caregiverChildren,
        aliasName: $_aliasNameGenerator(
          db.users.id,
          db.caregiverChildren.caregiverId,
        ),
      );

  $$CaregiverChildrenTableProcessedTableManager get caregiverChildrenRefs {
    final manager = $$CaregiverChildrenTableTableManager(
      $_db,
      $_db.caregiverChildren,
    ).filter((f) => f.caregiverId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _caregiverChildrenRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> caregiverChildrenRefs(
    Expression<bool> Function($$CaregiverChildrenTableFilterComposer f) f,
  ) {
    final $$CaregiverChildrenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caregiverChildren,
      getReferencedColumn: (t) => t.caregiverId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaregiverChildrenTableFilterComposer(
            $db: $db,
            $table: $db.caregiverChildren,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> caregiverChildrenRefs<T extends Object>(
    Expression<T> Function($$CaregiverChildrenTableAnnotationComposer a) f,
  ) {
    final $$CaregiverChildrenTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.caregiverChildren,
          getReferencedColumn: (t) => t.caregiverId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CaregiverChildrenTableAnnotationComposer(
                $db: $db,
                $table: $db.caregiverChildren,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool caregiverChildrenRefs})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                email: email,
                role: role,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                email: email,
                role: role,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({caregiverChildrenRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (caregiverChildrenRefs) db.caregiverChildren,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (caregiverChildrenRefs)
                    await $_getPrefetchedData<
                      User,
                      $UsersTable,
                      CaregiverChildrenData
                    >(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._caregiverChildrenRefsTable(db),
                      managerFromTypedResult: (p0) => $$UsersTableReferences(
                        db,
                        table,
                        p0,
                      ).caregiverChildrenRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.caregiverId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool caregiverChildrenRefs})
    >;
typedef $$CaregiverChildrenTableCreateCompanionBuilder =
    CaregiverChildrenCompanion Function({
      required int childId,
      required String caregiverId,
      Value<int> rowid,
    });
typedef $$CaregiverChildrenTableUpdateCompanionBuilder =
    CaregiverChildrenCompanion Function({
      Value<int> childId,
      Value<String> caregiverId,
      Value<int> rowid,
    });

final class $$CaregiverChildrenTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CaregiverChildrenTable,
          CaregiverChildrenData
        > {
  $$CaregiverChildrenTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChildrenTable _childIdTable(_$AppDatabase db) =>
      db.children.createAlias(
        $_aliasNameGenerator(db.caregiverChildren.childId, db.children.id),
      );

  $$ChildrenTableProcessedTableManager get childId {
    final $_column = $_itemColumn<int>('child_id')!;

    final manager = $$ChildrenTableTableManager(
      $_db,
      $_db.children,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_childIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _caregiverIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.caregiverChildren.caregiverId, db.users.id),
      );

  $$UsersTableProcessedTableManager get caregiverId {
    final $_column = $_itemColumn<String>('caregiver_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_caregiverIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CaregiverChildrenTableFilterComposer
    extends Composer<_$AppDatabase, $CaregiverChildrenTable> {
  $$CaregiverChildrenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChildrenTableFilterComposer get childId {
    final $$ChildrenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.children,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildrenTableFilterComposer(
            $db: $db,
            $table: $db.children,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get caregiverId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.caregiverId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaregiverChildrenTableOrderingComposer
    extends Composer<_$AppDatabase, $CaregiverChildrenTable> {
  $$CaregiverChildrenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChildrenTableOrderingComposer get childId {
    final $$ChildrenTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.children,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildrenTableOrderingComposer(
            $db: $db,
            $table: $db.children,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get caregiverId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.caregiverId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaregiverChildrenTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaregiverChildrenTable> {
  $$CaregiverChildrenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChildrenTableAnnotationComposer get childId {
    final $$ChildrenTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.children,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildrenTableAnnotationComposer(
            $db: $db,
            $table: $db.children,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get caregiverId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.caregiverId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaregiverChildrenTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaregiverChildrenTable,
          CaregiverChildrenData,
          $$CaregiverChildrenTableFilterComposer,
          $$CaregiverChildrenTableOrderingComposer,
          $$CaregiverChildrenTableAnnotationComposer,
          $$CaregiverChildrenTableCreateCompanionBuilder,
          $$CaregiverChildrenTableUpdateCompanionBuilder,
          (CaregiverChildrenData, $$CaregiverChildrenTableReferences),
          CaregiverChildrenData,
          PrefetchHooks Function({bool childId, bool caregiverId})
        > {
  $$CaregiverChildrenTableTableManager(
    _$AppDatabase db,
    $CaregiverChildrenTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaregiverChildrenTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaregiverChildrenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaregiverChildrenTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> childId = const Value.absent(),
                Value<String> caregiverId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaregiverChildrenCompanion(
                childId: childId,
                caregiverId: caregiverId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int childId,
                required String caregiverId,
                Value<int> rowid = const Value.absent(),
              }) => CaregiverChildrenCompanion.insert(
                childId: childId,
                caregiverId: caregiverId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CaregiverChildrenTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({childId = false, caregiverId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (childId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.childId,
                                referencedTable:
                                    $$CaregiverChildrenTableReferences
                                        ._childIdTable(db),
                                referencedColumn:
                                    $$CaregiverChildrenTableReferences
                                        ._childIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (caregiverId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.caregiverId,
                                referencedTable:
                                    $$CaregiverChildrenTableReferences
                                        ._caregiverIdTable(db),
                                referencedColumn:
                                    $$CaregiverChildrenTableReferences
                                        ._caregiverIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CaregiverChildrenTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaregiverChildrenTable,
      CaregiverChildrenData,
      $$CaregiverChildrenTableFilterComposer,
      $$CaregiverChildrenTableOrderingComposer,
      $$CaregiverChildrenTableAnnotationComposer,
      $$CaregiverChildrenTableCreateCompanionBuilder,
      $$CaregiverChildrenTableUpdateCompanionBuilder,
      (CaregiverChildrenData, $$CaregiverChildrenTableReferences),
      CaregiverChildrenData,
      PrefetchHooks Function({bool childId, bool caregiverId})
    >;
typedef $$ActivityResultsTableCreateCompanionBuilder =
    ActivityResultsCompanion Function({
      Value<int> id,
      required String activityType,
      required int childId,
      Value<DateTime> timestamp,
      Value<int> score,
      Value<String> difficulty,
    });
typedef $$ActivityResultsTableUpdateCompanionBuilder =
    ActivityResultsCompanion Function({
      Value<int> id,
      Value<String> activityType,
      Value<int> childId,
      Value<DateTime> timestamp,
      Value<int> score,
      Value<String> difficulty,
    });

final class $$ActivityResultsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ActivityResultsTable, ActivityResult> {
  $$ActivityResultsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChildrenTable _childIdTable(_$AppDatabase db) =>
      db.children.createAlias(
        $_aliasNameGenerator(db.activityResults.childId, db.children.id),
      );

  $$ChildrenTableProcessedTableManager get childId {
    final $_column = $_itemColumn<int>('child_id')!;

    final manager = $$ChildrenTableTableManager(
      $_db,
      $_db.children,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_childIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActivityResultsTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityResultsTable> {
  $$ActivityResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  $$ChildrenTableFilterComposer get childId {
    final $$ChildrenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.children,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildrenTableFilterComposer(
            $db: $db,
            $table: $db.children,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivityResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityResultsTable> {
  $$ActivityResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChildrenTableOrderingComposer get childId {
    final $$ChildrenTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.children,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildrenTableOrderingComposer(
            $db: $db,
            $table: $db.children,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivityResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityResultsTable> {
  $$ActivityResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  $$ChildrenTableAnnotationComposer get childId {
    final $$ChildrenTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childId,
      referencedTable: $db.children,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChildrenTableAnnotationComposer(
            $db: $db,
            $table: $db.children,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivityResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityResultsTable,
          ActivityResult,
          $$ActivityResultsTableFilterComposer,
          $$ActivityResultsTableOrderingComposer,
          $$ActivityResultsTableAnnotationComposer,
          $$ActivityResultsTableCreateCompanionBuilder,
          $$ActivityResultsTableUpdateCompanionBuilder,
          (ActivityResult, $$ActivityResultsTableReferences),
          ActivityResult,
          PrefetchHooks Function({bool childId})
        > {
  $$ActivityResultsTableTableManager(
    _$AppDatabase db,
    $ActivityResultsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> activityType = const Value.absent(),
                Value<int> childId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
              }) => ActivityResultsCompanion(
                id: id,
                activityType: activityType,
                childId: childId,
                timestamp: timestamp,
                score: score,
                difficulty: difficulty,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String activityType,
                required int childId,
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
              }) => ActivityResultsCompanion.insert(
                id: id,
                activityType: activityType,
                childId: childId,
                timestamp: timestamp,
                score: score,
                difficulty: difficulty,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActivityResultsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({childId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (childId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.childId,
                                referencedTable:
                                    $$ActivityResultsTableReferences
                                        ._childIdTable(db),
                                referencedColumn:
                                    $$ActivityResultsTableReferences
                                        ._childIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActivityResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityResultsTable,
      ActivityResult,
      $$ActivityResultsTableFilterComposer,
      $$ActivityResultsTableOrderingComposer,
      $$ActivityResultsTableAnnotationComposer,
      $$ActivityResultsTableCreateCompanionBuilder,
      $$ActivityResultsTableUpdateCompanionBuilder,
      (ActivityResult, $$ActivityResultsTableReferences),
      ActivityResult,
      PrefetchHooks Function({bool childId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChildrenTableTableManager get children =>
      $$ChildrenTableTableManager(_db, _db.children);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$CaregiverChildrenTableTableManager get caregiverChildren =>
      $$CaregiverChildrenTableTableManager(_db, _db.caregiverChildren);
  $$ActivityResultsTableTableManager get activityResults =>
      $$ActivityResultsTableTableManager(_db, _db.activityResults);
}

mixin _$ChildrenDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChildrenTable get children => attachedDatabase.children;
}
mixin _$UsersDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
mixin _$AssociationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChildrenTable get children => attachedDatabase.children;
  $UsersTable get users => attachedDatabase.users;
  $CaregiverChildrenTable get caregiverChildren =>
      attachedDatabase.caregiverChildren;
}
mixin _$ActivityResultsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChildrenTable get children => attachedDatabase.children;
  $ActivityResultsTable get activityResults => attachedDatabase.activityResults;
}
