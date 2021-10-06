// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PersonalInfoData extends DataClass
    implements Insertable<PersonalInfoData> {
  final String email;
  final String nickname;
  final DateTime createdAt;
  PersonalInfoData(
      {required this.email, required this.nickname, required this.createdAt});
  factory PersonalInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PersonalInfoData(
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      nickname: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nickname'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    map['nickname'] = Variable<String>(nickname);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PersonalInfoCompanion toCompanion(bool nullToAbsent) {
    return PersonalInfoCompanion(
      email: Value(email),
      nickname: Value(nickname),
      createdAt: Value(createdAt),
    );
  }

  factory PersonalInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PersonalInfoData(
      email: serializer.fromJson<String>(json['email']),
      nickname: serializer.fromJson<String>(json['nickname']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'nickname': serializer.toJson<String>(nickname),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PersonalInfoData copyWith(
          {String? email, String? nickname, DateTime? createdAt}) =>
      PersonalInfoData(
        email: email ?? this.email,
        nickname: nickname ?? this.nickname,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('PersonalInfoData(')
          ..write('email: $email, ')
          ..write('nickname: $nickname, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(email.hashCode, $mrjc(nickname.hashCode, createdAt.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonalInfoData &&
          other.email == this.email &&
          other.nickname == this.nickname &&
          other.createdAt == this.createdAt);
}

class PersonalInfoCompanion extends UpdateCompanion<PersonalInfoData> {
  final Value<String> email;
  final Value<String> nickname;
  final Value<DateTime> createdAt;
  const PersonalInfoCompanion({
    this.email = const Value.absent(),
    this.nickname = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PersonalInfoCompanion.insert({
    required String email,
    required String nickname,
    this.createdAt = const Value.absent(),
  })  : email = Value(email),
        nickname = Value(nickname);
  static Insertable<PersonalInfoData> custom({
    Expression<String>? email,
    Expression<String>? nickname,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (nickname != null) 'nickname': nickname,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PersonalInfoCompanion copyWith(
      {Value<String>? email,
      Value<String>? nickname,
      Value<DateTime>? createdAt}) {
    return PersonalInfoCompanion(
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalInfoCompanion(')
          ..write('email: $email, ')
          ..write('nickname: $nickname, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PersonalInfoTable extends PersonalInfo
    with TableInfo<$PersonalInfoTable, PersonalInfoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PersonalInfoTable(this._db, [this._alias]);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedTextColumn email = _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn('email', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _nicknameMeta = const VerificationMeta('nickname');
  @override
  late final GeneratedTextColumn nickname = _constructNickname();
  GeneratedTextColumn _constructNickname() {
    return GeneratedTextColumn('nickname', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn('created_at', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns => [email, nickname, createdAt];
  @override
  $PersonalInfoTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'personal_info';
  @override
  final String actualTableName = 'personal_info';
  @override
  VerificationContext validateIntegrity(Insertable<PersonalInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(_nicknameMeta,
          nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta));
    } else if (isInserting) {
      context.missing(_nicknameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PersonalInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PersonalInfoData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PersonalInfoTable createAlias(String alias) {
    return $PersonalInfoTable(_db, alias);
  }
}

class ManagerData extends DataClass implements Insertable<ManagerData> {
  final String email;
  final int attend_date;
  final DateTime createdAt;
  ManagerData(
      {required this.email,
      required this.attend_date,
      required this.createdAt});
  factory ManagerData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ManagerData(
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      attend_date: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attend_date'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    map['attend_date'] = Variable<int>(attend_date);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ManagerCompanion toCompanion(bool nullToAbsent) {
    return ManagerCompanion(
      email: Value(email),
      attend_date: Value(attend_date),
      createdAt: Value(createdAt),
    );
  }

  factory ManagerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ManagerData(
      email: serializer.fromJson<String>(json['email']),
      attend_date: serializer.fromJson<int>(json['attend_date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'attend_date': serializer.toJson<int>(attend_date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ManagerData copyWith(
          {String? email, int? attend_date, DateTime? createdAt}) =>
      ManagerData(
        email: email ?? this.email,
        attend_date: attend_date ?? this.attend_date,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('ManagerData(')
          ..write('email: $email, ')
          ..write('attend_date: $attend_date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(email.hashCode, $mrjc(attend_date.hashCode, createdAt.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ManagerData &&
          other.email == this.email &&
          other.attend_date == this.attend_date &&
          other.createdAt == this.createdAt);
}

class ManagerCompanion extends UpdateCompanion<ManagerData> {
  final Value<String> email;
  final Value<int> attend_date;
  final Value<DateTime> createdAt;
  const ManagerCompanion({
    this.email = const Value.absent(),
    this.attend_date = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ManagerCompanion.insert({
    required String email,
    required int attend_date,
    this.createdAt = const Value.absent(),
  })  : email = Value(email),
        attend_date = Value(attend_date);
  static Insertable<ManagerData> custom({
    Expression<String>? email,
    Expression<int>? attend_date,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (attend_date != null) 'attend_date': attend_date,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ManagerCompanion copyWith(
      {Value<String>? email,
      Value<int>? attend_date,
      Value<DateTime>? createdAt}) {
    return ManagerCompanion(
      email: email ?? this.email,
      attend_date: attend_date ?? this.attend_date,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (attend_date.present) {
      map['attend_date'] = Variable<int>(attend_date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ManagerCompanion(')
          ..write('email: $email, ')
          ..write('attend_date: $attend_date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ManagerTable extends Manager with TableInfo<$ManagerTable, ManagerData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ManagerTable(this._db, [this._alias]);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedTextColumn email = _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn('email', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _attend_dateMeta =
      const VerificationMeta('attend_date');
  @override
  late final GeneratedIntColumn attend_date = _constructAttendDate();
  GeneratedIntColumn _constructAttendDate() {
    return GeneratedIntColumn(
      'attend_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn('created_at', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns => [email, attend_date, createdAt];
  @override
  $ManagerTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'manager';
  @override
  final String actualTableName = 'manager';
  @override
  VerificationContext validateIntegrity(Insertable<ManagerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('attend_date')) {
      context.handle(
          _attend_dateMeta,
          attend_date.isAcceptableOrUnknown(
              data['attend_date']!, _attend_dateMeta));
    } else if (isInserting) {
      context.missing(_attend_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ManagerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ManagerData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ManagerTable createAlias(String alias) {
    return $ManagerTable(_db, alias);
  }
}

class AttendData extends DataClass implements Insertable<AttendData> {
  final String email;
  final String attend_date;
  final DateTime createdAt;
  AttendData(
      {required this.email,
      required this.attend_date,
      required this.createdAt});
  factory AttendData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AttendData(
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      attend_date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attend_date'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    map['attend_date'] = Variable<String>(attend_date);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttendCompanion toCompanion(bool nullToAbsent) {
    return AttendCompanion(
      email: Value(email),
      attend_date: Value(attend_date),
      createdAt: Value(createdAt),
    );
  }

  factory AttendData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AttendData(
      email: serializer.fromJson<String>(json['email']),
      attend_date: serializer.fromJson<String>(json['attend_date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'attend_date': serializer.toJson<String>(attend_date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AttendData copyWith(
          {String? email, String? attend_date, DateTime? createdAt}) =>
      AttendData(
        email: email ?? this.email,
        attend_date: attend_date ?? this.attend_date,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('AttendData(')
          ..write('email: $email, ')
          ..write('attend_date: $attend_date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(email.hashCode, $mrjc(attend_date.hashCode, createdAt.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendData &&
          other.email == this.email &&
          other.attend_date == this.attend_date &&
          other.createdAt == this.createdAt);
}

class AttendCompanion extends UpdateCompanion<AttendData> {
  final Value<String> email;
  final Value<String> attend_date;
  final Value<DateTime> createdAt;
  const AttendCompanion({
    this.email = const Value.absent(),
    this.attend_date = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AttendCompanion.insert({
    required String email,
    required String attend_date,
    this.createdAt = const Value.absent(),
  })  : email = Value(email),
        attend_date = Value(attend_date);
  static Insertable<AttendData> custom({
    Expression<String>? email,
    Expression<String>? attend_date,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (attend_date != null) 'attend_date': attend_date,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AttendCompanion copyWith(
      {Value<String>? email,
      Value<String>? attend_date,
      Value<DateTime>? createdAt}) {
    return AttendCompanion(
      email: email ?? this.email,
      attend_date: attend_date ?? this.attend_date,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (attend_date.present) {
      map['attend_date'] = Variable<String>(attend_date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendCompanion(')
          ..write('email: $email, ')
          ..write('attend_date: $attend_date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AttendTable extends Attend with TableInfo<$AttendTable, AttendData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AttendTable(this._db, [this._alias]);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedTextColumn email = _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn('email', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _attend_dateMeta =
      const VerificationMeta('attend_date');
  @override
  late final GeneratedTextColumn attend_date = _constructAttendDate();
  GeneratedTextColumn _constructAttendDate() {
    return GeneratedTextColumn(
      'attend_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn('created_at', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns => [email, attend_date, createdAt];
  @override
  $AttendTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'attend';
  @override
  final String actualTableName = 'attend';
  @override
  VerificationContext validateIntegrity(Insertable<AttendData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('attend_date')) {
      context.handle(
          _attend_dateMeta,
          attend_date.isAcceptableOrUnknown(
              data['attend_date']!, _attend_dateMeta));
    } else if (isInserting) {
      context.missing(_attend_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  AttendData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AttendData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AttendTable createAlias(String alias) {
    return $AttendTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PersonalInfoTable personalInfo = $PersonalInfoTable(this);
  late final $ManagerTable manager = $ManagerTable(this);
  late final $AttendTable attend = $AttendTable(this);
  late final DBDao dBDao = DBDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [personalInfo, manager, attend];
}
