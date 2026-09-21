// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BodyMeasurementsTable extends BodyMeasurements
    with TableInfo<$BodyMeasurementsTable, BodyMeasurement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyMeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neckMeta = const VerificationMeta('neck');
  @override
  late final GeneratedColumn<double> neck = GeneratedColumn<double>(
    'neck',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chestMeta = const VerificationMeta('chest');
  @override
  late final GeneratedColumn<double> chest = GeneratedColumn<double>(
    'chest',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _waistMeta = const VerificationMeta('waist');
  @override
  late final GeneratedColumn<double> waist = GeneratedColumn<double>(
    'waist',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hipMeta = const VerificationMeta('hip');
  @override
  late final GeneratedColumn<double> hip = GeneratedColumn<double>(
    'hip',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _armRightMeta = const VerificationMeta(
    'armRight',
  );
  @override
  late final GeneratedColumn<double> armRight = GeneratedColumn<double>(
    'arm_right',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _armLeftMeta = const VerificationMeta(
    'armLeft',
  );
  @override
  late final GeneratedColumn<double> armLeft = GeneratedColumn<double>(
    'arm_left',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thighRightMeta = const VerificationMeta(
    'thighRight',
  );
  @override
  late final GeneratedColumn<double> thighRight = GeneratedColumn<double>(
    'thigh_right',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thighLeftMeta = const VerificationMeta(
    'thighLeft',
  );
  @override
  late final GeneratedColumn<double> thighLeft = GeneratedColumn<double>(
    'thigh_left',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calfRightMeta = const VerificationMeta(
    'calfRight',
  );
  @override
  late final GeneratedColumn<double> calfRight = GeneratedColumn<double>(
    'calf_right',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calfLeftMeta = const VerificationMeta(
    'calfLeft',
  );
  @override
  late final GeneratedColumn<double> calfLeft = GeneratedColumn<double>(
    'calf_left',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(DataSource.medido),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    weight,
    neck,
    chest,
    waist,
    hip,
    armRight,
    armLeft,
    thighRight,
    thighLeft,
    calfRight,
    calfLeft,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_measurements';
  @override
  VerificationContext validateIntegrity(
    Insertable<BodyMeasurement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('neck')) {
      context.handle(
        _neckMeta,
        neck.isAcceptableOrUnknown(data['neck']!, _neckMeta),
      );
    }
    if (data.containsKey('chest')) {
      context.handle(
        _chestMeta,
        chest.isAcceptableOrUnknown(data['chest']!, _chestMeta),
      );
    }
    if (data.containsKey('waist')) {
      context.handle(
        _waistMeta,
        waist.isAcceptableOrUnknown(data['waist']!, _waistMeta),
      );
    }
    if (data.containsKey('hip')) {
      context.handle(
        _hipMeta,
        hip.isAcceptableOrUnknown(data['hip']!, _hipMeta),
      );
    }
    if (data.containsKey('arm_right')) {
      context.handle(
        _armRightMeta,
        armRight.isAcceptableOrUnknown(data['arm_right']!, _armRightMeta),
      );
    }
    if (data.containsKey('arm_left')) {
      context.handle(
        _armLeftMeta,
        armLeft.isAcceptableOrUnknown(data['arm_left']!, _armLeftMeta),
      );
    }
    if (data.containsKey('thigh_right')) {
      context.handle(
        _thighRightMeta,
        thighRight.isAcceptableOrUnknown(data['thigh_right']!, _thighRightMeta),
      );
    }
    if (data.containsKey('thigh_left')) {
      context.handle(
        _thighLeftMeta,
        thighLeft.isAcceptableOrUnknown(data['thigh_left']!, _thighLeftMeta),
      );
    }
    if (data.containsKey('calf_right')) {
      context.handle(
        _calfRightMeta,
        calfRight.isAcceptableOrUnknown(data['calf_right']!, _calfRightMeta),
      );
    }
    if (data.containsKey('calf_left')) {
      context.handle(
        _calfLeftMeta,
        calfLeft.isAcceptableOrUnknown(data['calf_left']!, _calfLeftMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyMeasurement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyMeasurement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      neck: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}neck'],
      ),
      chest: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}chest'],
      ),
      waist: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}waist'],
      ),
      hip: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hip'],
      ),
      armRight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}arm_right'],
      ),
      armLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}arm_left'],
      ),
      thighRight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}thigh_right'],
      ),
      thighLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}thigh_left'],
      ),
      calfRight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calf_right'],
      ),
      calfLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calf_left'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $BodyMeasurementsTable createAlias(String alias) {
    return $BodyMeasurementsTable(attachedDatabase, alias);
  }
}

class BodyMeasurement extends DataClass implements Insertable<BodyMeasurement> {
  final String id;
  final DateTime date;
  final double? weight;
  final double? neck;
  final double? chest;
  final double? waist;
  final double? hip;
  final double? armRight;
  final double? armLeft;
  final double? thighRight;
  final double? thighLeft;
  final double? calfRight;
  final double? calfLeft;
  final String source;
  const BodyMeasurement({
    required this.id,
    required this.date,
    this.weight,
    this.neck,
    this.chest,
    this.waist,
    this.hip,
    this.armRight,
    this.armLeft,
    this.thighRight,
    this.thighLeft,
    this.calfRight,
    this.calfLeft,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || neck != null) {
      map['neck'] = Variable<double>(neck);
    }
    if (!nullToAbsent || chest != null) {
      map['chest'] = Variable<double>(chest);
    }
    if (!nullToAbsent || waist != null) {
      map['waist'] = Variable<double>(waist);
    }
    if (!nullToAbsent || hip != null) {
      map['hip'] = Variable<double>(hip);
    }
    if (!nullToAbsent || armRight != null) {
      map['arm_right'] = Variable<double>(armRight);
    }
    if (!nullToAbsent || armLeft != null) {
      map['arm_left'] = Variable<double>(armLeft);
    }
    if (!nullToAbsent || thighRight != null) {
      map['thigh_right'] = Variable<double>(thighRight);
    }
    if (!nullToAbsent || thighLeft != null) {
      map['thigh_left'] = Variable<double>(thighLeft);
    }
    if (!nullToAbsent || calfRight != null) {
      map['calf_right'] = Variable<double>(calfRight);
    }
    if (!nullToAbsent || calfLeft != null) {
      map['calf_left'] = Variable<double>(calfLeft);
    }
    map['source'] = Variable<String>(source);
    return map;
  }

  BodyMeasurementsCompanion toCompanion(bool nullToAbsent) {
    return BodyMeasurementsCompanion(
      id: Value(id),
      date: Value(date),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      neck: neck == null && nullToAbsent ? const Value.absent() : Value(neck),
      chest: chest == null && nullToAbsent
          ? const Value.absent()
          : Value(chest),
      waist: waist == null && nullToAbsent
          ? const Value.absent()
          : Value(waist),
      hip: hip == null && nullToAbsent ? const Value.absent() : Value(hip),
      armRight: armRight == null && nullToAbsent
          ? const Value.absent()
          : Value(armRight),
      armLeft: armLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(armLeft),
      thighRight: thighRight == null && nullToAbsent
          ? const Value.absent()
          : Value(thighRight),
      thighLeft: thighLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(thighLeft),
      calfRight: calfRight == null && nullToAbsent
          ? const Value.absent()
          : Value(calfRight),
      calfLeft: calfLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(calfLeft),
      source: Value(source),
    );
  }

  factory BodyMeasurement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyMeasurement(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      weight: serializer.fromJson<double?>(json['weight']),
      neck: serializer.fromJson<double?>(json['neck']),
      chest: serializer.fromJson<double?>(json['chest']),
      waist: serializer.fromJson<double?>(json['waist']),
      hip: serializer.fromJson<double?>(json['hip']),
      armRight: serializer.fromJson<double?>(json['armRight']),
      armLeft: serializer.fromJson<double?>(json['armLeft']),
      thighRight: serializer.fromJson<double?>(json['thighRight']),
      thighLeft: serializer.fromJson<double?>(json['thighLeft']),
      calfRight: serializer.fromJson<double?>(json['calfRight']),
      calfLeft: serializer.fromJson<double?>(json['calfLeft']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'weight': serializer.toJson<double?>(weight),
      'neck': serializer.toJson<double?>(neck),
      'chest': serializer.toJson<double?>(chest),
      'waist': serializer.toJson<double?>(waist),
      'hip': serializer.toJson<double?>(hip),
      'armRight': serializer.toJson<double?>(armRight),
      'armLeft': serializer.toJson<double?>(armLeft),
      'thighRight': serializer.toJson<double?>(thighRight),
      'thighLeft': serializer.toJson<double?>(thighLeft),
      'calfRight': serializer.toJson<double?>(calfRight),
      'calfLeft': serializer.toJson<double?>(calfLeft),
      'source': serializer.toJson<String>(source),
    };
  }

  BodyMeasurement copyWith({
    String? id,
    DateTime? date,
    Value<double?> weight = const Value.absent(),
    Value<double?> neck = const Value.absent(),
    Value<double?> chest = const Value.absent(),
    Value<double?> waist = const Value.absent(),
    Value<double?> hip = const Value.absent(),
    Value<double?> armRight = const Value.absent(),
    Value<double?> armLeft = const Value.absent(),
    Value<double?> thighRight = const Value.absent(),
    Value<double?> thighLeft = const Value.absent(),
    Value<double?> calfRight = const Value.absent(),
    Value<double?> calfLeft = const Value.absent(),
    String? source,
  }) => BodyMeasurement(
    id: id ?? this.id,
    date: date ?? this.date,
    weight: weight.present ? weight.value : this.weight,
    neck: neck.present ? neck.value : this.neck,
    chest: chest.present ? chest.value : this.chest,
    waist: waist.present ? waist.value : this.waist,
    hip: hip.present ? hip.value : this.hip,
    armRight: armRight.present ? armRight.value : this.armRight,
    armLeft: armLeft.present ? armLeft.value : this.armLeft,
    thighRight: thighRight.present ? thighRight.value : this.thighRight,
    thighLeft: thighLeft.present ? thighLeft.value : this.thighLeft,
    calfRight: calfRight.present ? calfRight.value : this.calfRight,
    calfLeft: calfLeft.present ? calfLeft.value : this.calfLeft,
    source: source ?? this.source,
  );
  BodyMeasurement copyWithCompanion(BodyMeasurementsCompanion data) {
    return BodyMeasurement(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      weight: data.weight.present ? data.weight.value : this.weight,
      neck: data.neck.present ? data.neck.value : this.neck,
      chest: data.chest.present ? data.chest.value : this.chest,
      waist: data.waist.present ? data.waist.value : this.waist,
      hip: data.hip.present ? data.hip.value : this.hip,
      armRight: data.armRight.present ? data.armRight.value : this.armRight,
      armLeft: data.armLeft.present ? data.armLeft.value : this.armLeft,
      thighRight: data.thighRight.present
          ? data.thighRight.value
          : this.thighRight,
      thighLeft: data.thighLeft.present ? data.thighLeft.value : this.thighLeft,
      calfRight: data.calfRight.present ? data.calfRight.value : this.calfRight,
      calfLeft: data.calfLeft.present ? data.calfLeft.value : this.calfLeft,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurement(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('weight: $weight, ')
          ..write('neck: $neck, ')
          ..write('chest: $chest, ')
          ..write('waist: $waist, ')
          ..write('hip: $hip, ')
          ..write('armRight: $armRight, ')
          ..write('armLeft: $armLeft, ')
          ..write('thighRight: $thighRight, ')
          ..write('thighLeft: $thighLeft, ')
          ..write('calfRight: $calfRight, ')
          ..write('calfLeft: $calfLeft, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    weight,
    neck,
    chest,
    waist,
    hip,
    armRight,
    armLeft,
    thighRight,
    thighLeft,
    calfRight,
    calfLeft,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyMeasurement &&
          other.id == this.id &&
          other.date == this.date &&
          other.weight == this.weight &&
          other.neck == this.neck &&
          other.chest == this.chest &&
          other.waist == this.waist &&
          other.hip == this.hip &&
          other.armRight == this.armRight &&
          other.armLeft == this.armLeft &&
          other.thighRight == this.thighRight &&
          other.thighLeft == this.thighLeft &&
          other.calfRight == this.calfRight &&
          other.calfLeft == this.calfLeft &&
          other.source == this.source);
}

class BodyMeasurementsCompanion extends UpdateCompanion<BodyMeasurement> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<double?> weight;
  final Value<double?> neck;
  final Value<double?> chest;
  final Value<double?> waist;
  final Value<double?> hip;
  final Value<double?> armRight;
  final Value<double?> armLeft;
  final Value<double?> thighRight;
  final Value<double?> thighLeft;
  final Value<double?> calfRight;
  final Value<double?> calfLeft;
  final Value<String> source;
  final Value<int> rowid;
  const BodyMeasurementsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.weight = const Value.absent(),
    this.neck = const Value.absent(),
    this.chest = const Value.absent(),
    this.waist = const Value.absent(),
    this.hip = const Value.absent(),
    this.armRight = const Value.absent(),
    this.armLeft = const Value.absent(),
    this.thighRight = const Value.absent(),
    this.thighLeft = const Value.absent(),
    this.calfRight = const Value.absent(),
    this.calfLeft = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BodyMeasurementsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.weight = const Value.absent(),
    this.neck = const Value.absent(),
    this.chest = const Value.absent(),
    this.waist = const Value.absent(),
    this.hip = const Value.absent(),
    this.armRight = const Value.absent(),
    this.armLeft = const Value.absent(),
    this.thighRight = const Value.absent(),
    this.thighLeft = const Value.absent(),
    this.calfRight = const Value.absent(),
    this.calfLeft = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<BodyMeasurement> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<double>? weight,
    Expression<double>? neck,
    Expression<double>? chest,
    Expression<double>? waist,
    Expression<double>? hip,
    Expression<double>? armRight,
    Expression<double>? armLeft,
    Expression<double>? thighRight,
    Expression<double>? thighLeft,
    Expression<double>? calfRight,
    Expression<double>? calfLeft,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (weight != null) 'weight': weight,
      if (neck != null) 'neck': neck,
      if (chest != null) 'chest': chest,
      if (waist != null) 'waist': waist,
      if (hip != null) 'hip': hip,
      if (armRight != null) 'arm_right': armRight,
      if (armLeft != null) 'arm_left': armLeft,
      if (thighRight != null) 'thigh_right': thighRight,
      if (thighLeft != null) 'thigh_left': thighLeft,
      if (calfRight != null) 'calf_right': calfRight,
      if (calfLeft != null) 'calf_left': calfLeft,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BodyMeasurementsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<double?>? weight,
    Value<double?>? neck,
    Value<double?>? chest,
    Value<double?>? waist,
    Value<double?>? hip,
    Value<double?>? armRight,
    Value<double?>? armLeft,
    Value<double?>? thighRight,
    Value<double?>? thighLeft,
    Value<double?>? calfRight,
    Value<double?>? calfLeft,
    Value<String>? source,
    Value<int>? rowid,
  }) {
    return BodyMeasurementsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      weight: weight ?? this.weight,
      neck: neck ?? this.neck,
      chest: chest ?? this.chest,
      waist: waist ?? this.waist,
      hip: hip ?? this.hip,
      armRight: armRight ?? this.armRight,
      armLeft: armLeft ?? this.armLeft,
      thighRight: thighRight ?? this.thighRight,
      thighLeft: thighLeft ?? this.thighLeft,
      calfRight: calfRight ?? this.calfRight,
      calfLeft: calfLeft ?? this.calfLeft,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (neck.present) {
      map['neck'] = Variable<double>(neck.value);
    }
    if (chest.present) {
      map['chest'] = Variable<double>(chest.value);
    }
    if (waist.present) {
      map['waist'] = Variable<double>(waist.value);
    }
    if (hip.present) {
      map['hip'] = Variable<double>(hip.value);
    }
    if (armRight.present) {
      map['arm_right'] = Variable<double>(armRight.value);
    }
    if (armLeft.present) {
      map['arm_left'] = Variable<double>(armLeft.value);
    }
    if (thighRight.present) {
      map['thigh_right'] = Variable<double>(thighRight.value);
    }
    if (thighLeft.present) {
      map['thigh_left'] = Variable<double>(thighLeft.value);
    }
    if (calfRight.present) {
      map['calf_right'] = Variable<double>(calfRight.value);
    }
    if (calfLeft.present) {
      map['calf_left'] = Variable<double>(calfLeft.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('weight: $weight, ')
          ..write('neck: $neck, ')
          ..write('chest: $chest, ')
          ..write('waist: $waist, ')
          ..write('hip: $hip, ')
          ..write('armRight: $armRight, ')
          ..write('armLeft: $armLeft, ')
          ..write('thighRight: $thighRight, ')
          ..write('thighLeft: $thighLeft, ')
          ..write('calfRight: $calfRight, ')
          ..write('calfLeft: $calfLeft, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyCheckinsTable extends DailyCheckins
    with TableInfo<$DailyCheckinsTable, DailyCheckin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyCheckinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleepMeta = const VerificationMeta('sleep');
  @override
  late final GeneratedColumn<int> sleep = GeneratedColumn<int>(
    'sleep',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<int> energy = GeneratedColumn<int>(
    'energy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _painMeta = const VerificationMeta('pain');
  @override
  late final GeneratedColumn<int> pain = GeneratedColumn<int>(
    'pain',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
    'mood',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainedStrengthMeta = const VerificationMeta(
    'trainedStrength',
  );
  @override
  late final GeneratedColumn<bool> trainedStrength = GeneratedColumn<bool>(
    'trained_strength',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("trained_strength" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _trainedCardioMeta = const VerificationMeta(
    'trainedCardio',
  );
  @override
  late final GeneratedColumn<bool> trainedCardio = GeneratedColumn<bool>(
    'trained_cardio',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("trained_cardio" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _nutritionMeta = const VerificationMeta(
    'nutrition',
  );
  @override
  late final GeneratedColumn<int> nutrition = GeneratedColumn<int>(
    'nutrition',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    weight,
    sleep,
    energy,
    pain,
    mood,
    trainedStrength,
    trainedCardio,
    nutrition,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_checkins';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyCheckin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('sleep')) {
      context.handle(
        _sleepMeta,
        sleep.isAcceptableOrUnknown(data['sleep']!, _sleepMeta),
      );
    }
    if (data.containsKey('energy')) {
      context.handle(
        _energyMeta,
        energy.isAcceptableOrUnknown(data['energy']!, _energyMeta),
      );
    }
    if (data.containsKey('pain')) {
      context.handle(
        _painMeta,
        pain.isAcceptableOrUnknown(data['pain']!, _painMeta),
      );
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('trained_strength')) {
      context.handle(
        _trainedStrengthMeta,
        trainedStrength.isAcceptableOrUnknown(
          data['trained_strength']!,
          _trainedStrengthMeta,
        ),
      );
    }
    if (data.containsKey('trained_cardio')) {
      context.handle(
        _trainedCardioMeta,
        trainedCardio.isAcceptableOrUnknown(
          data['trained_cardio']!,
          _trainedCardioMeta,
        ),
      );
    }
    if (data.containsKey('nutrition')) {
      context.handle(
        _nutritionMeta,
        nutrition.isAcceptableOrUnknown(data['nutrition']!, _nutritionMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyCheckin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyCheckin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      sleep: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep'],
      ),
      energy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}energy'],
      ),
      pain: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pain'],
      ),
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood'],
      ),
      trainedStrength: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}trained_strength'],
      )!,
      trainedCardio: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}trained_cardio'],
      )!,
      nutrition: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nutrition'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $DailyCheckinsTable createAlias(String alias) {
    return $DailyCheckinsTable(attachedDatabase, alias);
  }
}

class DailyCheckin extends DataClass implements Insertable<DailyCheckin> {
  final String id;
  final DateTime date;
  final double? weight;
  final int? sleep;
  final int? energy;
  final int? pain;
  final int? mood;
  final bool trainedStrength;
  final bool trainedCardio;
  final int? nutrition;
  final String? notes;
  const DailyCheckin({
    required this.id,
    required this.date,
    this.weight,
    this.sleep,
    this.energy,
    this.pain,
    this.mood,
    required this.trainedStrength,
    required this.trainedCardio,
    this.nutrition,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || sleep != null) {
      map['sleep'] = Variable<int>(sleep);
    }
    if (!nullToAbsent || energy != null) {
      map['energy'] = Variable<int>(energy);
    }
    if (!nullToAbsent || pain != null) {
      map['pain'] = Variable<int>(pain);
    }
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<int>(mood);
    }
    map['trained_strength'] = Variable<bool>(trainedStrength);
    map['trained_cardio'] = Variable<bool>(trainedCardio);
    if (!nullToAbsent || nutrition != null) {
      map['nutrition'] = Variable<int>(nutrition);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  DailyCheckinsCompanion toCompanion(bool nullToAbsent) {
    return DailyCheckinsCompanion(
      id: Value(id),
      date: Value(date),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      sleep: sleep == null && nullToAbsent
          ? const Value.absent()
          : Value(sleep),
      energy: energy == null && nullToAbsent
          ? const Value.absent()
          : Value(energy),
      pain: pain == null && nullToAbsent ? const Value.absent() : Value(pain),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      trainedStrength: Value(trainedStrength),
      trainedCardio: Value(trainedCardio),
      nutrition: nutrition == null && nullToAbsent
          ? const Value.absent()
          : Value(nutrition),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory DailyCheckin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyCheckin(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      weight: serializer.fromJson<double?>(json['weight']),
      sleep: serializer.fromJson<int?>(json['sleep']),
      energy: serializer.fromJson<int?>(json['energy']),
      pain: serializer.fromJson<int?>(json['pain']),
      mood: serializer.fromJson<int?>(json['mood']),
      trainedStrength: serializer.fromJson<bool>(json['trainedStrength']),
      trainedCardio: serializer.fromJson<bool>(json['trainedCardio']),
      nutrition: serializer.fromJson<int?>(json['nutrition']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'weight': serializer.toJson<double?>(weight),
      'sleep': serializer.toJson<int?>(sleep),
      'energy': serializer.toJson<int?>(energy),
      'pain': serializer.toJson<int?>(pain),
      'mood': serializer.toJson<int?>(mood),
      'trainedStrength': serializer.toJson<bool>(trainedStrength),
      'trainedCardio': serializer.toJson<bool>(trainedCardio),
      'nutrition': serializer.toJson<int?>(nutrition),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  DailyCheckin copyWith({
    String? id,
    DateTime? date,
    Value<double?> weight = const Value.absent(),
    Value<int?> sleep = const Value.absent(),
    Value<int?> energy = const Value.absent(),
    Value<int?> pain = const Value.absent(),
    Value<int?> mood = const Value.absent(),
    bool? trainedStrength,
    bool? trainedCardio,
    Value<int?> nutrition = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => DailyCheckin(
    id: id ?? this.id,
    date: date ?? this.date,
    weight: weight.present ? weight.value : this.weight,
    sleep: sleep.present ? sleep.value : this.sleep,
    energy: energy.present ? energy.value : this.energy,
    pain: pain.present ? pain.value : this.pain,
    mood: mood.present ? mood.value : this.mood,
    trainedStrength: trainedStrength ?? this.trainedStrength,
    trainedCardio: trainedCardio ?? this.trainedCardio,
    nutrition: nutrition.present ? nutrition.value : this.nutrition,
    notes: notes.present ? notes.value : this.notes,
  );
  DailyCheckin copyWithCompanion(DailyCheckinsCompanion data) {
    return DailyCheckin(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      weight: data.weight.present ? data.weight.value : this.weight,
      sleep: data.sleep.present ? data.sleep.value : this.sleep,
      energy: data.energy.present ? data.energy.value : this.energy,
      pain: data.pain.present ? data.pain.value : this.pain,
      mood: data.mood.present ? data.mood.value : this.mood,
      trainedStrength: data.trainedStrength.present
          ? data.trainedStrength.value
          : this.trainedStrength,
      trainedCardio: data.trainedCardio.present
          ? data.trainedCardio.value
          : this.trainedCardio,
      nutrition: data.nutrition.present ? data.nutrition.value : this.nutrition,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyCheckin(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('weight: $weight, ')
          ..write('sleep: $sleep, ')
          ..write('energy: $energy, ')
          ..write('pain: $pain, ')
          ..write('mood: $mood, ')
          ..write('trainedStrength: $trainedStrength, ')
          ..write('trainedCardio: $trainedCardio, ')
          ..write('nutrition: $nutrition, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    weight,
    sleep,
    energy,
    pain,
    mood,
    trainedStrength,
    trainedCardio,
    nutrition,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyCheckin &&
          other.id == this.id &&
          other.date == this.date &&
          other.weight == this.weight &&
          other.sleep == this.sleep &&
          other.energy == this.energy &&
          other.pain == this.pain &&
          other.mood == this.mood &&
          other.trainedStrength == this.trainedStrength &&
          other.trainedCardio == this.trainedCardio &&
          other.nutrition == this.nutrition &&
          other.notes == this.notes);
}

class DailyCheckinsCompanion extends UpdateCompanion<DailyCheckin> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<double?> weight;
  final Value<int?> sleep;
  final Value<int?> energy;
  final Value<int?> pain;
  final Value<int?> mood;
  final Value<bool> trainedStrength;
  final Value<bool> trainedCardio;
  final Value<int?> nutrition;
  final Value<String?> notes;
  final Value<int> rowid;
  const DailyCheckinsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.weight = const Value.absent(),
    this.sleep = const Value.absent(),
    this.energy = const Value.absent(),
    this.pain = const Value.absent(),
    this.mood = const Value.absent(),
    this.trainedStrength = const Value.absent(),
    this.trainedCardio = const Value.absent(),
    this.nutrition = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyCheckinsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.weight = const Value.absent(),
    this.sleep = const Value.absent(),
    this.energy = const Value.absent(),
    this.pain = const Value.absent(),
    this.mood = const Value.absent(),
    this.trainedStrength = const Value.absent(),
    this.trainedCardio = const Value.absent(),
    this.nutrition = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<DailyCheckin> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<double>? weight,
    Expression<int>? sleep,
    Expression<int>? energy,
    Expression<int>? pain,
    Expression<int>? mood,
    Expression<bool>? trainedStrength,
    Expression<bool>? trainedCardio,
    Expression<int>? nutrition,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (weight != null) 'weight': weight,
      if (sleep != null) 'sleep': sleep,
      if (energy != null) 'energy': energy,
      if (pain != null) 'pain': pain,
      if (mood != null) 'mood': mood,
      if (trainedStrength != null) 'trained_strength': trainedStrength,
      if (trainedCardio != null) 'trained_cardio': trainedCardio,
      if (nutrition != null) 'nutrition': nutrition,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyCheckinsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<double?>? weight,
    Value<int?>? sleep,
    Value<int?>? energy,
    Value<int?>? pain,
    Value<int?>? mood,
    Value<bool>? trainedStrength,
    Value<bool>? trainedCardio,
    Value<int?>? nutrition,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return DailyCheckinsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      weight: weight ?? this.weight,
      sleep: sleep ?? this.sleep,
      energy: energy ?? this.energy,
      pain: pain ?? this.pain,
      mood: mood ?? this.mood,
      trainedStrength: trainedStrength ?? this.trainedStrength,
      trainedCardio: trainedCardio ?? this.trainedCardio,
      nutrition: nutrition ?? this.nutrition,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (sleep.present) {
      map['sleep'] = Variable<int>(sleep.value);
    }
    if (energy.present) {
      map['energy'] = Variable<int>(energy.value);
    }
    if (pain.present) {
      map['pain'] = Variable<int>(pain.value);
    }
    if (mood.present) {
      map['mood'] = Variable<int>(mood.value);
    }
    if (trainedStrength.present) {
      map['trained_strength'] = Variable<bool>(trainedStrength.value);
    }
    if (trainedCardio.present) {
      map['trained_cardio'] = Variable<bool>(trainedCardio.value);
    }
    if (nutrition.present) {
      map['nutrition'] = Variable<int>(nutrition.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyCheckinsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('weight: $weight, ')
          ..write('sleep: $sleep, ')
          ..write('energy: $energy, ')
          ..write('pain: $pain, ')
          ..write('mood: $mood, ')
          ..write('trainedStrength: $trainedStrength, ')
          ..write('trainedCardio: $trainedCardio, ')
          ..write('nutrition: $nutrition, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTemplatesTable extends WorkoutTemplates
    with TableInfo<$WorkoutTemplatesTable, WorkoutTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusMeta = const VerificationMeta('focus');
  @override
  late final GeneratedColumn<String> focus = GeneratedColumn<String>(
    'focus',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, sortOrder, focus];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTemplate> instance, {
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
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('focus')) {
      context.handle(
        _focusMeta,
        focus.isAcceptableOrUnknown(data['focus']!, _focusMeta),
      );
    } else if (isInserting) {
      context.missing(_focusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      focus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}focus'],
      )!,
    );
  }

  @override
  $WorkoutTemplatesTable createAlias(String alias) {
    return $WorkoutTemplatesTable(attachedDatabase, alias);
  }
}

class WorkoutTemplate extends DataClass implements Insertable<WorkoutTemplate> {
  final String id;
  final String name;
  final int sortOrder;
  final String focus;
  const WorkoutTemplate({
    required this.id,
    required this.name,
    required this.sortOrder,
    required this.focus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sortOrder);
    map['focus'] = Variable<String>(focus);
    return map;
  }

  WorkoutTemplatesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      sortOrder: Value(sortOrder),
      focus: Value(focus),
    );
  }

  factory WorkoutTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTemplate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      focus: serializer.fromJson<String>(json['focus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'focus': serializer.toJson<String>(focus),
    };
  }

  WorkoutTemplate copyWith({
    String? id,
    String? name,
    int? sortOrder,
    String? focus,
  }) => WorkoutTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    sortOrder: sortOrder ?? this.sortOrder,
    focus: focus ?? this.focus,
  );
  WorkoutTemplate copyWithCompanion(WorkoutTemplatesCompanion data) {
    return WorkoutTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      focus: data.focus.present ? data.focus.value : this.focus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('focus: $focus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sortOrder, focus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.sortOrder == this.sortOrder &&
          other.focus == this.focus);
}

class WorkoutTemplatesCompanion extends UpdateCompanion<WorkoutTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> sortOrder;
  final Value<String> focus;
  final Value<int> rowid;
  const WorkoutTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.focus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int sortOrder,
    required String focus,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       sortOrder = Value(sortOrder),
       focus = Value(focus);
  static Insertable<WorkoutTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? sortOrder,
    Expression<String>? focus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (focus != null) 'focus': focus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? sortOrder,
    Value<String>? focus,
    Value<int>? rowid,
  }) {
    return WorkoutTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sortOrder: sortOrder ?? this.sortOrder,
      focus: focus ?? this.focus,
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
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (focus.present) {
      map['focus'] = Variable<String>(focus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('focus: $focus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTemplateExercisesTable extends WorkoutTemplateExercises
    with TableInfo<$WorkoutTemplateExercisesTable, WorkoutTemplateExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTemplateExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseMeta = const VerificationMeta(
    'exercise',
  );
  @override
  late final GeneratedColumn<String> exercise = GeneratedColumn<String>(
    'exercise',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cueMeta = const VerificationMeta('cue');
  @override
  late final GeneratedColumn<String> cue = GeneratedColumn<String>(
    'cue',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metricTypeMeta = const VerificationMeta(
    'metricType',
  );
  @override
  late final GeneratedColumn<String> metricType = GeneratedColumn<String>(
    'metric_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(MetricType.reps),
  );
  static const VerificationMeta _targetSetsMeta = const VerificationMeta(
    'targetSets',
  );
  @override
  late final GeneratedColumn<int> targetSets = GeneratedColumn<int>(
    'target_sets',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetRepsMeta = const VerificationMeta(
    'targetReps',
  );
  @override
  late final GeneratedColumn<int> targetReps = GeneratedColumn<int>(
    'target_reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetSecondsMeta = const VerificationMeta(
    'targetSeconds',
  );
  @override
  late final GeneratedColumn<int> targetSeconds = GeneratedColumn<int>(
    'target_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restSecondsMeta = const VerificationMeta(
    'restSeconds',
  );
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
    'rest_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(50),
  );
  static const VerificationMeta _demoImagePathMeta = const VerificationMeta(
    'demoImagePath',
  );
  @override
  late final GeneratedColumn<String> demoImagePath = GeneratedColumn<String>(
    'demo_image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    templateId,
    sortOrder,
    exercise,
    cue,
    category,
    metricType,
    targetSets,
    targetReps,
    targetSeconds,
    restSeconds,
    demoImagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_template_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTemplateExercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('exercise')) {
      context.handle(
        _exerciseMeta,
        exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    if (data.containsKey('cue')) {
      context.handle(
        _cueMeta,
        cue.isAcceptableOrUnknown(data['cue']!, _cueMeta),
      );
    } else if (isInserting) {
      context.missing(_cueMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('metric_type')) {
      context.handle(
        _metricTypeMeta,
        metricType.isAcceptableOrUnknown(data['metric_type']!, _metricTypeMeta),
      );
    }
    if (data.containsKey('target_sets')) {
      context.handle(
        _targetSetsMeta,
        targetSets.isAcceptableOrUnknown(data['target_sets']!, _targetSetsMeta),
      );
    }
    if (data.containsKey('target_reps')) {
      context.handle(
        _targetRepsMeta,
        targetReps.isAcceptableOrUnknown(data['target_reps']!, _targetRepsMeta),
      );
    }
    if (data.containsKey('target_seconds')) {
      context.handle(
        _targetSecondsMeta,
        targetSeconds.isAcceptableOrUnknown(
          data['target_seconds']!,
          _targetSecondsMeta,
        ),
      );
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
        _restSecondsMeta,
        restSeconds.isAcceptableOrUnknown(
          data['rest_seconds']!,
          _restSecondsMeta,
        ),
      );
    }
    if (data.containsKey('demo_image_path')) {
      context.handle(
        _demoImagePathMeta,
        demoImagePath.isAcceptableOrUnknown(
          data['demo_image_path']!,
          _demoImagePathMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTemplateExercise map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTemplateExercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      exercise: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise'],
      )!,
      cue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cue'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      metricType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metric_type'],
      )!,
      targetSets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_sets'],
      ),
      targetReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_reps'],
      ),
      targetSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_seconds'],
      ),
      restSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_seconds'],
      )!,
      demoImagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}demo_image_path'],
      ),
    );
  }

  @override
  $WorkoutTemplateExercisesTable createAlias(String alias) {
    return $WorkoutTemplateExercisesTable(attachedDatabase, alias);
  }
}

class WorkoutTemplateExercise extends DataClass
    implements Insertable<WorkoutTemplateExercise> {
  final String id;
  final String templateId;
  final int sortOrder;
  final String exercise;
  final String cue;
  final String category;
  final String metricType;
  final int? targetSets;
  final int? targetReps;
  final int? targetSeconds;
  final int restSeconds;
  final String? demoImagePath;
  const WorkoutTemplateExercise({
    required this.id,
    required this.templateId,
    required this.sortOrder,
    required this.exercise,
    required this.cue,
    required this.category,
    required this.metricType,
    this.targetSets,
    this.targetReps,
    this.targetSeconds,
    required this.restSeconds,
    this.demoImagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['template_id'] = Variable<String>(templateId);
    map['sort_order'] = Variable<int>(sortOrder);
    map['exercise'] = Variable<String>(exercise);
    map['cue'] = Variable<String>(cue);
    map['category'] = Variable<String>(category);
    map['metric_type'] = Variable<String>(metricType);
    if (!nullToAbsent || targetSets != null) {
      map['target_sets'] = Variable<int>(targetSets);
    }
    if (!nullToAbsent || targetReps != null) {
      map['target_reps'] = Variable<int>(targetReps);
    }
    if (!nullToAbsent || targetSeconds != null) {
      map['target_seconds'] = Variable<int>(targetSeconds);
    }
    map['rest_seconds'] = Variable<int>(restSeconds);
    if (!nullToAbsent || demoImagePath != null) {
      map['demo_image_path'] = Variable<String>(demoImagePath);
    }
    return map;
  }

  WorkoutTemplateExercisesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTemplateExercisesCompanion(
      id: Value(id),
      templateId: Value(templateId),
      sortOrder: Value(sortOrder),
      exercise: Value(exercise),
      cue: Value(cue),
      category: Value(category),
      metricType: Value(metricType),
      targetSets: targetSets == null && nullToAbsent
          ? const Value.absent()
          : Value(targetSets),
      targetReps: targetReps == null && nullToAbsent
          ? const Value.absent()
          : Value(targetReps),
      targetSeconds: targetSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(targetSeconds),
      restSeconds: Value(restSeconds),
      demoImagePath: demoImagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(demoImagePath),
    );
  }

  factory WorkoutTemplateExercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTemplateExercise(
      id: serializer.fromJson<String>(json['id']),
      templateId: serializer.fromJson<String>(json['templateId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      exercise: serializer.fromJson<String>(json['exercise']),
      cue: serializer.fromJson<String>(json['cue']),
      category: serializer.fromJson<String>(json['category']),
      metricType: serializer.fromJson<String>(json['metricType']),
      targetSets: serializer.fromJson<int?>(json['targetSets']),
      targetReps: serializer.fromJson<int?>(json['targetReps']),
      targetSeconds: serializer.fromJson<int?>(json['targetSeconds']),
      restSeconds: serializer.fromJson<int>(json['restSeconds']),
      demoImagePath: serializer.fromJson<String?>(json['demoImagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'templateId': serializer.toJson<String>(templateId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'exercise': serializer.toJson<String>(exercise),
      'cue': serializer.toJson<String>(cue),
      'category': serializer.toJson<String>(category),
      'metricType': serializer.toJson<String>(metricType),
      'targetSets': serializer.toJson<int?>(targetSets),
      'targetReps': serializer.toJson<int?>(targetReps),
      'targetSeconds': serializer.toJson<int?>(targetSeconds),
      'restSeconds': serializer.toJson<int>(restSeconds),
      'demoImagePath': serializer.toJson<String?>(demoImagePath),
    };
  }

  WorkoutTemplateExercise copyWith({
    String? id,
    String? templateId,
    int? sortOrder,
    String? exercise,
    String? cue,
    String? category,
    String? metricType,
    Value<int?> targetSets = const Value.absent(),
    Value<int?> targetReps = const Value.absent(),
    Value<int?> targetSeconds = const Value.absent(),
    int? restSeconds,
    Value<String?> demoImagePath = const Value.absent(),
  }) => WorkoutTemplateExercise(
    id: id ?? this.id,
    templateId: templateId ?? this.templateId,
    sortOrder: sortOrder ?? this.sortOrder,
    exercise: exercise ?? this.exercise,
    cue: cue ?? this.cue,
    category: category ?? this.category,
    metricType: metricType ?? this.metricType,
    targetSets: targetSets.present ? targetSets.value : this.targetSets,
    targetReps: targetReps.present ? targetReps.value : this.targetReps,
    targetSeconds: targetSeconds.present
        ? targetSeconds.value
        : this.targetSeconds,
    restSeconds: restSeconds ?? this.restSeconds,
    demoImagePath: demoImagePath.present
        ? demoImagePath.value
        : this.demoImagePath,
  );
  WorkoutTemplateExercise copyWithCompanion(
    WorkoutTemplateExercisesCompanion data,
  ) {
    return WorkoutTemplateExercise(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      cue: data.cue.present ? data.cue.value : this.cue,
      category: data.category.present ? data.category.value : this.category,
      metricType: data.metricType.present
          ? data.metricType.value
          : this.metricType,
      targetSets: data.targetSets.present
          ? data.targetSets.value
          : this.targetSets,
      targetReps: data.targetReps.present
          ? data.targetReps.value
          : this.targetReps,
      targetSeconds: data.targetSeconds.present
          ? data.targetSeconds.value
          : this.targetSeconds,
      restSeconds: data.restSeconds.present
          ? data.restSeconds.value
          : this.restSeconds,
      demoImagePath: data.demoImagePath.present
          ? data.demoImagePath.value
          : this.demoImagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplateExercise(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('exercise: $exercise, ')
          ..write('cue: $cue, ')
          ..write('category: $category, ')
          ..write('metricType: $metricType, ')
          ..write('targetSets: $targetSets, ')
          ..write('targetReps: $targetReps, ')
          ..write('targetSeconds: $targetSeconds, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('demoImagePath: $demoImagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    templateId,
    sortOrder,
    exercise,
    cue,
    category,
    metricType,
    targetSets,
    targetReps,
    targetSeconds,
    restSeconds,
    demoImagePath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTemplateExercise &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.sortOrder == this.sortOrder &&
          other.exercise == this.exercise &&
          other.cue == this.cue &&
          other.category == this.category &&
          other.metricType == this.metricType &&
          other.targetSets == this.targetSets &&
          other.targetReps == this.targetReps &&
          other.targetSeconds == this.targetSeconds &&
          other.restSeconds == this.restSeconds &&
          other.demoImagePath == this.demoImagePath);
}

class WorkoutTemplateExercisesCompanion
    extends UpdateCompanion<WorkoutTemplateExercise> {
  final Value<String> id;
  final Value<String> templateId;
  final Value<int> sortOrder;
  final Value<String> exercise;
  final Value<String> cue;
  final Value<String> category;
  final Value<String> metricType;
  final Value<int?> targetSets;
  final Value<int?> targetReps;
  final Value<int?> targetSeconds;
  final Value<int> restSeconds;
  final Value<String?> demoImagePath;
  final Value<int> rowid;
  const WorkoutTemplateExercisesCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.exercise = const Value.absent(),
    this.cue = const Value.absent(),
    this.category = const Value.absent(),
    this.metricType = const Value.absent(),
    this.targetSets = const Value.absent(),
    this.targetReps = const Value.absent(),
    this.targetSeconds = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.demoImagePath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutTemplateExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String templateId,
    required int sortOrder,
    required String exercise,
    required String cue,
    required String category,
    this.metricType = const Value.absent(),
    this.targetSets = const Value.absent(),
    this.targetReps = const Value.absent(),
    this.targetSeconds = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.demoImagePath = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : templateId = Value(templateId),
       sortOrder = Value(sortOrder),
       exercise = Value(exercise),
       cue = Value(cue),
       category = Value(category);
  static Insertable<WorkoutTemplateExercise> custom({
    Expression<String>? id,
    Expression<String>? templateId,
    Expression<int>? sortOrder,
    Expression<String>? exercise,
    Expression<String>? cue,
    Expression<String>? category,
    Expression<String>? metricType,
    Expression<int>? targetSets,
    Expression<int>? targetReps,
    Expression<int>? targetSeconds,
    Expression<int>? restSeconds,
    Expression<String>? demoImagePath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (exercise != null) 'exercise': exercise,
      if (cue != null) 'cue': cue,
      if (category != null) 'category': category,
      if (metricType != null) 'metric_type': metricType,
      if (targetSets != null) 'target_sets': targetSets,
      if (targetReps != null) 'target_reps': targetReps,
      if (targetSeconds != null) 'target_seconds': targetSeconds,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (demoImagePath != null) 'demo_image_path': demoImagePath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutTemplateExercisesCompanion copyWith({
    Value<String>? id,
    Value<String>? templateId,
    Value<int>? sortOrder,
    Value<String>? exercise,
    Value<String>? cue,
    Value<String>? category,
    Value<String>? metricType,
    Value<int?>? targetSets,
    Value<int?>? targetReps,
    Value<int?>? targetSeconds,
    Value<int>? restSeconds,
    Value<String?>? demoImagePath,
    Value<int>? rowid,
  }) {
    return WorkoutTemplateExercisesCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      sortOrder: sortOrder ?? this.sortOrder,
      exercise: exercise ?? this.exercise,
      cue: cue ?? this.cue,
      category: category ?? this.category,
      metricType: metricType ?? this.metricType,
      targetSets: targetSets ?? this.targetSets,
      targetReps: targetReps ?? this.targetReps,
      targetSeconds: targetSeconds ?? this.targetSeconds,
      restSeconds: restSeconds ?? this.restSeconds,
      demoImagePath: demoImagePath ?? this.demoImagePath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<String>(exercise.value);
    }
    if (cue.present) {
      map['cue'] = Variable<String>(cue.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (metricType.present) {
      map['metric_type'] = Variable<String>(metricType.value);
    }
    if (targetSets.present) {
      map['target_sets'] = Variable<int>(targetSets.value);
    }
    if (targetReps.present) {
      map['target_reps'] = Variable<int>(targetReps.value);
    }
    if (targetSeconds.present) {
      map['target_seconds'] = Variable<int>(targetSeconds.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (demoImagePath.present) {
      map['demo_image_path'] = Variable<String>(demoImagePath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplateExercisesCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('exercise: $exercise, ')
          ..write('cue: $cue, ')
          ..write('category: $category, ')
          ..write('metricType: $metricType, ')
          ..write('targetSets: $targetSets, ')
          ..write('targetReps: $targetReps, ')
          ..write('targetSeconds: $targetSeconds, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('demoImagePath: $demoImagePath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, templateId, date, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Workout> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Workout(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final String id;
  final String? templateId;
  final DateTime date;
  final String? notes;
  const Workout({
    required this.id,
    this.templateId,
    required this.date,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<String>(templateId);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
      date: Value(date),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Workout.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<String>(json['id']),
      templateId: serializer.fromJson<String?>(json['templateId']),
      date: serializer.fromJson<DateTime>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'templateId': serializer.toJson<String?>(templateId),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Workout copyWith({
    String? id,
    Value<String?> templateId = const Value.absent(),
    DateTime? date,
    Value<String?> notes = const Value.absent(),
  }) => Workout(
    id: id ?? this.id,
    templateId: templateId.present ? templateId.value : this.templateId,
    date: date ?? this.date,
    notes: notes.present ? notes.value : this.notes,
  );
  Workout copyWithCompanion(WorkoutsCompanion data) {
    return Workout(
      id: data.id.present ? data.id.value : this.id,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('date: $date, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, templateId, date, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout &&
          other.id == this.id &&
          other.templateId == this.templateId &&
          other.date == this.date &&
          other.notes == this.notes);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<String> id;
  final Value<String?> templateId;
  final Value<DateTime> date;
  final Value<String?> notes;
  final Value<int> rowid;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    this.id = const Value.absent(),
    this.templateId = const Value.absent(),
    required DateTime date,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<Workout> custom({
    Expression<String>? id,
    Expression<String>? templateId,
    Expression<DateTime>? date,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (templateId != null) 'template_id': templateId,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutsCompanion copyWith({
    Value<String>? id,
    Value<String?>? templateId,
    Value<DateTime>? date,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      templateId: templateId ?? this.templateId,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('templateId: $templateId, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StrengthLogsTable extends StrengthLogs
    with TableInfo<$StrengthLogsTable, StrengthLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StrengthLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _workoutIdMeta = const VerificationMeta(
    'workoutId',
  );
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
    'workout_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateExerciseIdMeta =
      const VerificationMeta('templateExerciseId');
  @override
  late final GeneratedColumn<String> templateExerciseId =
      GeneratedColumn<String>(
        'template_exercise_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _exerciseMeta = const VerificationMeta(
    'exercise',
  );
  @override
  late final GeneratedColumn<String> exercise = GeneratedColumn<String>(
    'exercise',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<int> rpe = GeneratedColumn<int>(
    'rpe',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workoutId,
    templateExerciseId,
    exercise,
    weight,
    reps,
    setNumber,
    rpe,
    loggedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'strength_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<StrengthLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('workout_id')) {
      context.handle(
        _workoutIdMeta,
        workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta),
      );
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('template_exercise_id')) {
      context.handle(
        _templateExerciseIdMeta,
        templateExerciseId.isAcceptableOrUnknown(
          data['template_exercise_id']!,
          _templateExerciseIdMeta,
        ),
      );
    }
    if (data.containsKey('exercise')) {
      context.handle(
        _exerciseMeta,
        exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    }
    if (data.containsKey('rpe')) {
      context.handle(
        _rpeMeta,
        rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StrengthLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StrengthLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      workoutId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_id'],
      )!,
      templateExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_exercise_id'],
      ),
      exercise: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      ),
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      rpe: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rpe'],
      ),
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $StrengthLogsTable createAlias(String alias) {
    return $StrengthLogsTable(attachedDatabase, alias);
  }
}

class StrengthLog extends DataClass implements Insertable<StrengthLog> {
  final String id;
  final String workoutId;
  final String? templateExerciseId;
  final String exercise;
  final double? weight;
  final int? reps;
  final int setNumber;
  final int? rpe;
  final DateTime loggedAt;
  const StrengthLog({
    required this.id,
    required this.workoutId,
    this.templateExerciseId,
    required this.exercise,
    this.weight,
    this.reps,
    required this.setNumber,
    this.rpe,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workout_id'] = Variable<String>(workoutId);
    if (!nullToAbsent || templateExerciseId != null) {
      map['template_exercise_id'] = Variable<String>(templateExerciseId);
    }
    map['exercise'] = Variable<String>(exercise);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    map['set_number'] = Variable<int>(setNumber);
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<int>(rpe);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  StrengthLogsCompanion toCompanion(bool nullToAbsent) {
    return StrengthLogsCompanion(
      id: Value(id),
      workoutId: Value(workoutId),
      templateExerciseId: templateExerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateExerciseId),
      exercise: Value(exercise),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      setNumber: Value(setNumber),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      loggedAt: Value(loggedAt),
    );
  }

  factory StrengthLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StrengthLog(
      id: serializer.fromJson<String>(json['id']),
      workoutId: serializer.fromJson<String>(json['workoutId']),
      templateExerciseId: serializer.fromJson<String?>(
        json['templateExerciseId'],
      ),
      exercise: serializer.fromJson<String>(json['exercise']),
      weight: serializer.fromJson<double?>(json['weight']),
      reps: serializer.fromJson<int?>(json['reps']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      rpe: serializer.fromJson<int?>(json['rpe']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workoutId': serializer.toJson<String>(workoutId),
      'templateExerciseId': serializer.toJson<String?>(templateExerciseId),
      'exercise': serializer.toJson<String>(exercise),
      'weight': serializer.toJson<double?>(weight),
      'reps': serializer.toJson<int?>(reps),
      'setNumber': serializer.toJson<int>(setNumber),
      'rpe': serializer.toJson<int?>(rpe),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  StrengthLog copyWith({
    String? id,
    String? workoutId,
    Value<String?> templateExerciseId = const Value.absent(),
    String? exercise,
    Value<double?> weight = const Value.absent(),
    Value<int?> reps = const Value.absent(),
    int? setNumber,
    Value<int?> rpe = const Value.absent(),
    DateTime? loggedAt,
  }) => StrengthLog(
    id: id ?? this.id,
    workoutId: workoutId ?? this.workoutId,
    templateExerciseId: templateExerciseId.present
        ? templateExerciseId.value
        : this.templateExerciseId,
    exercise: exercise ?? this.exercise,
    weight: weight.present ? weight.value : this.weight,
    reps: reps.present ? reps.value : this.reps,
    setNumber: setNumber ?? this.setNumber,
    rpe: rpe.present ? rpe.value : this.rpe,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  StrengthLog copyWithCompanion(StrengthLogsCompanion data) {
    return StrengthLog(
      id: data.id.present ? data.id.value : this.id,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      templateExerciseId: data.templateExerciseId.present
          ? data.templateExerciseId.value
          : this.templateExerciseId,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      weight: data.weight.present ? data.weight.value : this.weight,
      reps: data.reps.present ? data.reps.value : this.reps,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StrengthLog(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('templateExerciseId: $templateExerciseId, ')
          ..write('exercise: $exercise, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('setNumber: $setNumber, ')
          ..write('rpe: $rpe, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workoutId,
    templateExerciseId,
    exercise,
    weight,
    reps,
    setNumber,
    rpe,
    loggedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StrengthLog &&
          other.id == this.id &&
          other.workoutId == this.workoutId &&
          other.templateExerciseId == this.templateExerciseId &&
          other.exercise == this.exercise &&
          other.weight == this.weight &&
          other.reps == this.reps &&
          other.setNumber == this.setNumber &&
          other.rpe == this.rpe &&
          other.loggedAt == this.loggedAt);
}

class StrengthLogsCompanion extends UpdateCompanion<StrengthLog> {
  final Value<String> id;
  final Value<String> workoutId;
  final Value<String?> templateExerciseId;
  final Value<String> exercise;
  final Value<double?> weight;
  final Value<int?> reps;
  final Value<int> setNumber;
  final Value<int?> rpe;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const StrengthLogsCompanion({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.templateExerciseId = const Value.absent(),
    this.exercise = const Value.absent(),
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.rpe = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StrengthLogsCompanion.insert({
    this.id = const Value.absent(),
    required String workoutId,
    this.templateExerciseId = const Value.absent(),
    required String exercise,
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.rpe = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : workoutId = Value(workoutId),
       exercise = Value(exercise);
  static Insertable<StrengthLog> custom({
    Expression<String>? id,
    Expression<String>? workoutId,
    Expression<String>? templateExerciseId,
    Expression<String>? exercise,
    Expression<double>? weight,
    Expression<int>? reps,
    Expression<int>? setNumber,
    Expression<int>? rpe,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutId != null) 'workout_id': workoutId,
      if (templateExerciseId != null)
        'template_exercise_id': templateExerciseId,
      if (exercise != null) 'exercise': exercise,
      if (weight != null) 'weight': weight,
      if (reps != null) 'reps': reps,
      if (setNumber != null) 'set_number': setNumber,
      if (rpe != null) 'rpe': rpe,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StrengthLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? workoutId,
    Value<String?>? templateExerciseId,
    Value<String>? exercise,
    Value<double?>? weight,
    Value<int?>? reps,
    Value<int>? setNumber,
    Value<int?>? rpe,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return StrengthLogsCompanion(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      templateExerciseId: templateExerciseId ?? this.templateExerciseId,
      exercise: exercise ?? this.exercise,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      setNumber: setNumber ?? this.setNumber,
      rpe: rpe ?? this.rpe,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (templateExerciseId.present) {
      map['template_exercise_id'] = Variable<String>(templateExerciseId.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<String>(exercise.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<int>(rpe.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StrengthLogsCompanion(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('templateExerciseId: $templateExerciseId, ')
          ..write('exercise: $exercise, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('setNumber: $setNumber, ')
          ..write('rpe: $rpe, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _horizonMeta = const VerificationMeta(
    'horizon',
  );
  @override
  late final GeneratedColumn<String> horizon = GeneratedColumn<String>(
    'horizon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startValueMeta = const VerificationMeta(
    'startValue',
  );
  @override
  late final GeneratedColumn<double> startValue = GeneratedColumn<double>(
    'start_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetValueMeta = const VerificationMeta(
    'targetValue',
  );
  @override
  late final GeneratedColumn<double> targetValue = GeneratedColumn<double>(
    'target_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(GoalStatus.ativa),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    horizon,
    startValue,
    targetValue,
    deadline,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
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
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('horizon')) {
      context.handle(
        _horizonMeta,
        horizon.isAcceptableOrUnknown(data['horizon']!, _horizonMeta),
      );
    } else if (isInserting) {
      context.missing(_horizonMeta);
    }
    if (data.containsKey('start_value')) {
      context.handle(
        _startValueMeta,
        startValue.isAcceptableOrUnknown(data['start_value']!, _startValueMeta),
      );
    }
    if (data.containsKey('target_value')) {
      context.handle(
        _targetValueMeta,
        targetValue.isAcceptableOrUnknown(
          data['target_value']!,
          _targetValueMeta,
        ),
      );
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
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
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      horizon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}horizon'],
      )!,
      startValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}start_value'],
      ),
      targetValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_value'],
      ),
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final String id;
  final String name;
  final String category;
  final String horizon;
  final double? startValue;
  final double? targetValue;
  final DateTime? deadline;
  final String status;
  final DateTime createdAt;
  const Goal({
    required this.id,
    required this.name,
    required this.category,
    required this.horizon,
    this.startValue,
    this.targetValue,
    this.deadline,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['horizon'] = Variable<String>(horizon);
    if (!nullToAbsent || startValue != null) {
      map['start_value'] = Variable<double>(startValue);
    }
    if (!nullToAbsent || targetValue != null) {
      map['target_value'] = Variable<double>(targetValue);
    }
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      horizon: Value(horizon),
      startValue: startValue == null && nullToAbsent
          ? const Value.absent()
          : Value(startValue),
      targetValue: targetValue == null && nullToAbsent
          ? const Value.absent()
          : Value(targetValue),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      horizon: serializer.fromJson<String>(json['horizon']),
      startValue: serializer.fromJson<double?>(json['startValue']),
      targetValue: serializer.fromJson<double?>(json['targetValue']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'horizon': serializer.toJson<String>(horizon),
      'startValue': serializer.toJson<double?>(startValue),
      'targetValue': serializer.toJson<double?>(targetValue),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Goal copyWith({
    String? id,
    String? name,
    String? category,
    String? horizon,
    Value<double?> startValue = const Value.absent(),
    Value<double?> targetValue = const Value.absent(),
    Value<DateTime?> deadline = const Value.absent(),
    String? status,
    DateTime? createdAt,
  }) => Goal(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    horizon: horizon ?? this.horizon,
    startValue: startValue.present ? startValue.value : this.startValue,
    targetValue: targetValue.present ? targetValue.value : this.targetValue,
    deadline: deadline.present ? deadline.value : this.deadline,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      horizon: data.horizon.present ? data.horizon.value : this.horizon,
      startValue: data.startValue.present
          ? data.startValue.value
          : this.startValue,
      targetValue: data.targetValue.present
          ? data.targetValue.value
          : this.targetValue,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('horizon: $horizon, ')
          ..write('startValue: $startValue, ')
          ..write('targetValue: $targetValue, ')
          ..write('deadline: $deadline, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    horizon,
    startValue,
    targetValue,
    deadline,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.horizon == this.horizon &&
          other.startValue == this.startValue &&
          other.targetValue == this.targetValue &&
          other.deadline == this.deadline &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> horizon;
  final Value<double?> startValue;
  final Value<double?> targetValue;
  final Value<DateTime?> deadline;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.horizon = const Value.absent(),
    this.startValue = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.deadline = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    required String horizon,
    this.startValue = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.deadline = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       category = Value(category),
       horizon = Value(horizon);
  static Insertable<Goal> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? horizon,
    Expression<double>? startValue,
    Expression<double>? targetValue,
    Expression<DateTime>? deadline,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (horizon != null) 'horizon': horizon,
      if (startValue != null) 'start_value': startValue,
      if (targetValue != null) 'target_value': targetValue,
      if (deadline != null) 'deadline': deadline,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String>? horizon,
    Value<double?>? startValue,
    Value<double?>? targetValue,
    Value<DateTime?>? deadline,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      horizon: horizon ?? this.horizon,
      startValue: startValue ?? this.startValue,
      targetValue: targetValue ?? this.targetValue,
      deadline: deadline ?? this.deadline,
      status: status ?? this.status,
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
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (horizon.present) {
      map['horizon'] = Variable<String>(horizon.value);
    }
    if (startValue.present) {
      map['start_value'] = Variable<double>(startValue.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<double>(targetValue.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
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
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('horizon: $horizon, ')
          ..write('startValue: $startValue, ')
          ..write('targetValue: $targetValue, ')
          ..write('deadline: $deadline, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhotoCheckpointsTable extends PhotoCheckpoints
    with TableInfo<$PhotoCheckpointsTable, PhotoCheckpoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoCheckpointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => _uuid.v4(),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frontMeta = const VerificationMeta('front');
  @override
  late final GeneratedColumn<Uint8List> front = GeneratedColumn<Uint8List>(
    'front',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sideMeta = const VerificationMeta('side');
  @override
  late final GeneratedColumn<Uint8List> side = GeneratedColumn<Uint8List>(
    'side',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backMeta = const VerificationMeta('back');
  @override
  late final GeneratedColumn<Uint8List> back = GeneratedColumn<Uint8List>(
    'back',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, front, side, back, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_checkpoints';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoCheckpoint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('front')) {
      context.handle(
        _frontMeta,
        front.isAcceptableOrUnknown(data['front']!, _frontMeta),
      );
    }
    if (data.containsKey('side')) {
      context.handle(
        _sideMeta,
        side.isAcceptableOrUnknown(data['side']!, _sideMeta),
      );
    }
    if (data.containsKey('back')) {
      context.handle(
        _backMeta,
        back.isAcceptableOrUnknown(data['back']!, _backMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoCheckpoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoCheckpoint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      front: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}front'],
      ),
      side: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}side'],
      ),
      back: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}back'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $PhotoCheckpointsTable createAlias(String alias) {
    return $PhotoCheckpointsTable(attachedDatabase, alias);
  }
}

class PhotoCheckpoint extends DataClass implements Insertable<PhotoCheckpoint> {
  final String id;
  final DateTime date;
  final Uint8List? front;
  final Uint8List? side;
  final Uint8List? back;
  final String? notes;
  const PhotoCheckpoint({
    required this.id,
    required this.date,
    this.front,
    this.side,
    this.back,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || front != null) {
      map['front'] = Variable<Uint8List>(front);
    }
    if (!nullToAbsent || side != null) {
      map['side'] = Variable<Uint8List>(side);
    }
    if (!nullToAbsent || back != null) {
      map['back'] = Variable<Uint8List>(back);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PhotoCheckpointsCompanion toCompanion(bool nullToAbsent) {
    return PhotoCheckpointsCompanion(
      id: Value(id),
      date: Value(date),
      front: front == null && nullToAbsent
          ? const Value.absent()
          : Value(front),
      side: side == null && nullToAbsent ? const Value.absent() : Value(side),
      back: back == null && nullToAbsent ? const Value.absent() : Value(back),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory PhotoCheckpoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoCheckpoint(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      front: serializer.fromJson<Uint8List?>(json['front']),
      side: serializer.fromJson<Uint8List?>(json['side']),
      back: serializer.fromJson<Uint8List?>(json['back']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'front': serializer.toJson<Uint8List?>(front),
      'side': serializer.toJson<Uint8List?>(side),
      'back': serializer.toJson<Uint8List?>(back),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PhotoCheckpoint copyWith({
    String? id,
    DateTime? date,
    Value<Uint8List?> front = const Value.absent(),
    Value<Uint8List?> side = const Value.absent(),
    Value<Uint8List?> back = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => PhotoCheckpoint(
    id: id ?? this.id,
    date: date ?? this.date,
    front: front.present ? front.value : this.front,
    side: side.present ? side.value : this.side,
    back: back.present ? back.value : this.back,
    notes: notes.present ? notes.value : this.notes,
  );
  PhotoCheckpoint copyWithCompanion(PhotoCheckpointsCompanion data) {
    return PhotoCheckpoint(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      front: data.front.present ? data.front.value : this.front,
      side: data.side.present ? data.side.value : this.side,
      back: data.back.present ? data.back.value : this.back,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoCheckpoint(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('front: $front, ')
          ..write('side: $side, ')
          ..write('back: $back, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    $driftBlobEquality.hash(front),
    $driftBlobEquality.hash(side),
    $driftBlobEquality.hash(back),
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoCheckpoint &&
          other.id == this.id &&
          other.date == this.date &&
          $driftBlobEquality.equals(other.front, this.front) &&
          $driftBlobEquality.equals(other.side, this.side) &&
          $driftBlobEquality.equals(other.back, this.back) &&
          other.notes == this.notes);
}

class PhotoCheckpointsCompanion extends UpdateCompanion<PhotoCheckpoint> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<Uint8List?> front;
  final Value<Uint8List?> side;
  final Value<Uint8List?> back;
  final Value<String?> notes;
  final Value<int> rowid;
  const PhotoCheckpointsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.front = const Value.absent(),
    this.side = const Value.absent(),
    this.back = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotoCheckpointsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.front = const Value.absent(),
    this.side = const Value.absent(),
    this.back = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<PhotoCheckpoint> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<Uint8List>? front,
    Expression<Uint8List>? side,
    Expression<Uint8List>? back,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (front != null) 'front': front,
      if (side != null) 'side': side,
      if (back != null) 'back': back,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotoCheckpointsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<Uint8List?>? front,
    Value<Uint8List?>? side,
    Value<Uint8List?>? back,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return PhotoCheckpointsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      front: front ?? this.front,
      side: side ?? this.side,
      back: back ?? this.back,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (front.present) {
      map['front'] = Variable<Uint8List>(front.value);
    }
    if (side.present) {
      map['side'] = Variable<Uint8List>(side.value);
    }
    if (back.present) {
      map['back'] = Variable<Uint8List>(back.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoCheckpointsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('front: $front, ')
          ..write('side: $side, ')
          ..write('back: $back, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BodyMeasurementsTable bodyMeasurements = $BodyMeasurementsTable(
    this,
  );
  late final $DailyCheckinsTable dailyCheckins = $DailyCheckinsTable(this);
  late final $WorkoutTemplatesTable workoutTemplates = $WorkoutTemplatesTable(
    this,
  );
  late final $WorkoutTemplateExercisesTable workoutTemplateExercises =
      $WorkoutTemplateExercisesTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $StrengthLogsTable strengthLogs = $StrengthLogsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $PhotoCheckpointsTable photoCheckpoints = $PhotoCheckpointsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    bodyMeasurements,
    dailyCheckins,
    workoutTemplates,
    workoutTemplateExercises,
    workouts,
    strengthLogs,
    goals,
    photoCheckpoints,
  ];
}

typedef $$BodyMeasurementsTableCreateCompanionBuilder =
    BodyMeasurementsCompanion Function({
      Value<String> id,
      required DateTime date,
      Value<double?> weight,
      Value<double?> neck,
      Value<double?> chest,
      Value<double?> waist,
      Value<double?> hip,
      Value<double?> armRight,
      Value<double?> armLeft,
      Value<double?> thighRight,
      Value<double?> thighLeft,
      Value<double?> calfRight,
      Value<double?> calfLeft,
      Value<String> source,
      Value<int> rowid,
    });
typedef $$BodyMeasurementsTableUpdateCompanionBuilder =
    BodyMeasurementsCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<double?> weight,
      Value<double?> neck,
      Value<double?> chest,
      Value<double?> waist,
      Value<double?> hip,
      Value<double?> armRight,
      Value<double?> armLeft,
      Value<double?> thighRight,
      Value<double?> thighLeft,
      Value<double?> calfRight,
      Value<double?> calfLeft,
      Value<String> source,
      Value<int> rowid,
    });

class $$BodyMeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get neck => $composableBuilder(
    column: $table.neck,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get chest => $composableBuilder(
    column: $table.chest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get waist => $composableBuilder(
    column: $table.waist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hip => $composableBuilder(
    column: $table.hip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get armRight => $composableBuilder(
    column: $table.armRight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get armLeft => $composableBuilder(
    column: $table.armLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get thighRight => $composableBuilder(
    column: $table.thighRight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get thighLeft => $composableBuilder(
    column: $table.thighLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calfRight => $composableBuilder(
    column: $table.calfRight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calfLeft => $composableBuilder(
    column: $table.calfLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BodyMeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get neck => $composableBuilder(
    column: $table.neck,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get chest => $composableBuilder(
    column: $table.chest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get waist => $composableBuilder(
    column: $table.waist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hip => $composableBuilder(
    column: $table.hip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get armRight => $composableBuilder(
    column: $table.armRight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get armLeft => $composableBuilder(
    column: $table.armLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get thighRight => $composableBuilder(
    column: $table.thighRight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get thighLeft => $composableBuilder(
    column: $table.thighLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calfRight => $composableBuilder(
    column: $table.calfRight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calfLeft => $composableBuilder(
    column: $table.calfLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BodyMeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get neck =>
      $composableBuilder(column: $table.neck, builder: (column) => column);

  GeneratedColumn<double> get chest =>
      $composableBuilder(column: $table.chest, builder: (column) => column);

  GeneratedColumn<double> get waist =>
      $composableBuilder(column: $table.waist, builder: (column) => column);

  GeneratedColumn<double> get hip =>
      $composableBuilder(column: $table.hip, builder: (column) => column);

  GeneratedColumn<double> get armRight =>
      $composableBuilder(column: $table.armRight, builder: (column) => column);

  GeneratedColumn<double> get armLeft =>
      $composableBuilder(column: $table.armLeft, builder: (column) => column);

  GeneratedColumn<double> get thighRight => $composableBuilder(
    column: $table.thighRight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get thighLeft =>
      $composableBuilder(column: $table.thighLeft, builder: (column) => column);

  GeneratedColumn<double> get calfRight =>
      $composableBuilder(column: $table.calfRight, builder: (column) => column);

  GeneratedColumn<double> get calfLeft =>
      $composableBuilder(column: $table.calfLeft, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$BodyMeasurementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BodyMeasurementsTable,
          BodyMeasurement,
          $$BodyMeasurementsTableFilterComposer,
          $$BodyMeasurementsTableOrderingComposer,
          $$BodyMeasurementsTableAnnotationComposer,
          $$BodyMeasurementsTableCreateCompanionBuilder,
          $$BodyMeasurementsTableUpdateCompanionBuilder,
          (
            BodyMeasurement,
            BaseReferences<
              _$AppDatabase,
              $BodyMeasurementsTable,
              BodyMeasurement
            >,
          ),
          BodyMeasurement,
          PrefetchHooks Function()
        > {
  $$BodyMeasurementsTableTableManager(
    _$AppDatabase db,
    $BodyMeasurementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyMeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BodyMeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BodyMeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> neck = const Value.absent(),
                Value<double?> chest = const Value.absent(),
                Value<double?> waist = const Value.absent(),
                Value<double?> hip = const Value.absent(),
                Value<double?> armRight = const Value.absent(),
                Value<double?> armLeft = const Value.absent(),
                Value<double?> thighRight = const Value.absent(),
                Value<double?> thighLeft = const Value.absent(),
                Value<double?> calfRight = const Value.absent(),
                Value<double?> calfLeft = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BodyMeasurementsCompanion(
                id: id,
                date: date,
                weight: weight,
                neck: neck,
                chest: chest,
                waist: waist,
                hip: hip,
                armRight: armRight,
                armLeft: armLeft,
                thighRight: thighRight,
                thighLeft: thighLeft,
                calfRight: calfRight,
                calfLeft: calfLeft,
                source: source,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required DateTime date,
                Value<double?> weight = const Value.absent(),
                Value<double?> neck = const Value.absent(),
                Value<double?> chest = const Value.absent(),
                Value<double?> waist = const Value.absent(),
                Value<double?> hip = const Value.absent(),
                Value<double?> armRight = const Value.absent(),
                Value<double?> armLeft = const Value.absent(),
                Value<double?> thighRight = const Value.absent(),
                Value<double?> thighLeft = const Value.absent(),
                Value<double?> calfRight = const Value.absent(),
                Value<double?> calfLeft = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BodyMeasurementsCompanion.insert(
                id: id,
                date: date,
                weight: weight,
                neck: neck,
                chest: chest,
                waist: waist,
                hip: hip,
                armRight: armRight,
                armLeft: armLeft,
                thighRight: thighRight,
                thighLeft: thighLeft,
                calfRight: calfRight,
                calfLeft: calfLeft,
                source: source,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BodyMeasurementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BodyMeasurementsTable,
      BodyMeasurement,
      $$BodyMeasurementsTableFilterComposer,
      $$BodyMeasurementsTableOrderingComposer,
      $$BodyMeasurementsTableAnnotationComposer,
      $$BodyMeasurementsTableCreateCompanionBuilder,
      $$BodyMeasurementsTableUpdateCompanionBuilder,
      (
        BodyMeasurement,
        BaseReferences<_$AppDatabase, $BodyMeasurementsTable, BodyMeasurement>,
      ),
      BodyMeasurement,
      PrefetchHooks Function()
    >;
typedef $$DailyCheckinsTableCreateCompanionBuilder =
    DailyCheckinsCompanion Function({
      Value<String> id,
      required DateTime date,
      Value<double?> weight,
      Value<int?> sleep,
      Value<int?> energy,
      Value<int?> pain,
      Value<int?> mood,
      Value<bool> trainedStrength,
      Value<bool> trainedCardio,
      Value<int?> nutrition,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$DailyCheckinsTableUpdateCompanionBuilder =
    DailyCheckinsCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<double?> weight,
      Value<int?> sleep,
      Value<int?> energy,
      Value<int?> pain,
      Value<int?> mood,
      Value<bool> trainedStrength,
      Value<bool> trainedCardio,
      Value<int?> nutrition,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$DailyCheckinsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyCheckinsTable> {
  $$DailyCheckinsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleep => $composableBuilder(
    column: $table.sleep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pain => $composableBuilder(
    column: $table.pain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get trainedStrength => $composableBuilder(
    column: $table.trainedStrength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get trainedCardio => $composableBuilder(
    column: $table.trainedCardio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nutrition => $composableBuilder(
    column: $table.nutrition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyCheckinsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyCheckinsTable> {
  $$DailyCheckinsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleep => $composableBuilder(
    column: $table.sleep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pain => $composableBuilder(
    column: $table.pain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get trainedStrength => $composableBuilder(
    column: $table.trainedStrength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get trainedCardio => $composableBuilder(
    column: $table.trainedCardio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nutrition => $composableBuilder(
    column: $table.nutrition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyCheckinsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyCheckinsTable> {
  $$DailyCheckinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<int> get sleep =>
      $composableBuilder(column: $table.sleep, builder: (column) => column);

  GeneratedColumn<int> get energy =>
      $composableBuilder(column: $table.energy, builder: (column) => column);

  GeneratedColumn<int> get pain =>
      $composableBuilder(column: $table.pain, builder: (column) => column);

  GeneratedColumn<int> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<bool> get trainedStrength => $composableBuilder(
    column: $table.trainedStrength,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get trainedCardio => $composableBuilder(
    column: $table.trainedCardio,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nutrition =>
      $composableBuilder(column: $table.nutrition, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$DailyCheckinsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyCheckinsTable,
          DailyCheckin,
          $$DailyCheckinsTableFilterComposer,
          $$DailyCheckinsTableOrderingComposer,
          $$DailyCheckinsTableAnnotationComposer,
          $$DailyCheckinsTableCreateCompanionBuilder,
          $$DailyCheckinsTableUpdateCompanionBuilder,
          (
            DailyCheckin,
            BaseReferences<_$AppDatabase, $DailyCheckinsTable, DailyCheckin>,
          ),
          DailyCheckin,
          PrefetchHooks Function()
        > {
  $$DailyCheckinsTableTableManager(_$AppDatabase db, $DailyCheckinsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyCheckinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyCheckinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyCheckinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<int?> sleep = const Value.absent(),
                Value<int?> energy = const Value.absent(),
                Value<int?> pain = const Value.absent(),
                Value<int?> mood = const Value.absent(),
                Value<bool> trainedStrength = const Value.absent(),
                Value<bool> trainedCardio = const Value.absent(),
                Value<int?> nutrition = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyCheckinsCompanion(
                id: id,
                date: date,
                weight: weight,
                sleep: sleep,
                energy: energy,
                pain: pain,
                mood: mood,
                trainedStrength: trainedStrength,
                trainedCardio: trainedCardio,
                nutrition: nutrition,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required DateTime date,
                Value<double?> weight = const Value.absent(),
                Value<int?> sleep = const Value.absent(),
                Value<int?> energy = const Value.absent(),
                Value<int?> pain = const Value.absent(),
                Value<int?> mood = const Value.absent(),
                Value<bool> trainedStrength = const Value.absent(),
                Value<bool> trainedCardio = const Value.absent(),
                Value<int?> nutrition = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyCheckinsCompanion.insert(
                id: id,
                date: date,
                weight: weight,
                sleep: sleep,
                energy: energy,
                pain: pain,
                mood: mood,
                trainedStrength: trainedStrength,
                trainedCardio: trainedCardio,
                nutrition: nutrition,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyCheckinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyCheckinsTable,
      DailyCheckin,
      $$DailyCheckinsTableFilterComposer,
      $$DailyCheckinsTableOrderingComposer,
      $$DailyCheckinsTableAnnotationComposer,
      $$DailyCheckinsTableCreateCompanionBuilder,
      $$DailyCheckinsTableUpdateCompanionBuilder,
      (
        DailyCheckin,
        BaseReferences<_$AppDatabase, $DailyCheckinsTable, DailyCheckin>,
      ),
      DailyCheckin,
      PrefetchHooks Function()
    >;
typedef $$WorkoutTemplatesTableCreateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      Value<String> id,
      required String name,
      required int sortOrder,
      required String focus,
      Value<int> rowid,
    });
typedef $$WorkoutTemplatesTableUpdateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> sortOrder,
      Value<String> focus,
      Value<int> rowid,
    });

class $$WorkoutTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableFilterComposer({
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

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get focus => $composableBuilder(
    column: $table.focus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableOrderingComposer({
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

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get focus => $composableBuilder(
    column: $table.focus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableAnnotationComposer({
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

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get focus =>
      $composableBuilder(column: $table.focus, builder: (column) => column);
}

class $$WorkoutTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutTemplatesTable,
          WorkoutTemplate,
          $$WorkoutTemplatesTableFilterComposer,
          $$WorkoutTemplatesTableOrderingComposer,
          $$WorkoutTemplatesTableAnnotationComposer,
          $$WorkoutTemplatesTableCreateCompanionBuilder,
          $$WorkoutTemplatesTableUpdateCompanionBuilder,
          (
            WorkoutTemplate,
            BaseReferences<
              _$AppDatabase,
              $WorkoutTemplatesTable,
              WorkoutTemplate
            >,
          ),
          WorkoutTemplate,
          PrefetchHooks Function()
        > {
  $$WorkoutTemplatesTableTableManager(
    _$AppDatabase db,
    $WorkoutTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String> focus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion(
                id: id,
                name: name,
                sortOrder: sortOrder,
                focus: focus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                required int sortOrder,
                required String focus,
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion.insert(
                id: id,
                name: name,
                sortOrder: sortOrder,
                focus: focus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutTemplatesTable,
      WorkoutTemplate,
      $$WorkoutTemplatesTableFilterComposer,
      $$WorkoutTemplatesTableOrderingComposer,
      $$WorkoutTemplatesTableAnnotationComposer,
      $$WorkoutTemplatesTableCreateCompanionBuilder,
      $$WorkoutTemplatesTableUpdateCompanionBuilder,
      (
        WorkoutTemplate,
        BaseReferences<_$AppDatabase, $WorkoutTemplatesTable, WorkoutTemplate>,
      ),
      WorkoutTemplate,
      PrefetchHooks Function()
    >;
typedef $$WorkoutTemplateExercisesTableCreateCompanionBuilder =
    WorkoutTemplateExercisesCompanion Function({
      Value<String> id,
      required String templateId,
      required int sortOrder,
      required String exercise,
      required String cue,
      required String category,
      Value<String> metricType,
      Value<int?> targetSets,
      Value<int?> targetReps,
      Value<int?> targetSeconds,
      Value<int> restSeconds,
      Value<String?> demoImagePath,
      Value<int> rowid,
    });
typedef $$WorkoutTemplateExercisesTableUpdateCompanionBuilder =
    WorkoutTemplateExercisesCompanion Function({
      Value<String> id,
      Value<String> templateId,
      Value<int> sortOrder,
      Value<String> exercise,
      Value<String> cue,
      Value<String> category,
      Value<String> metricType,
      Value<int?> targetSets,
      Value<int?> targetReps,
      Value<int?> targetSeconds,
      Value<int> restSeconds,
      Value<String?> demoImagePath,
      Value<int> rowid,
    });

class $$WorkoutTemplateExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutTemplateExercisesTable> {
  $$WorkoutTemplateExercisesTableFilterComposer({
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

  ColumnFilters<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cue => $composableBuilder(
    column: $table.cue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetSets => $composableBuilder(
    column: $table.targetSets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetReps => $composableBuilder(
    column: $table.targetReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetSeconds => $composableBuilder(
    column: $table.targetSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get demoImagePath => $composableBuilder(
    column: $table.demoImagePath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutTemplateExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutTemplateExercisesTable> {
  $$WorkoutTemplateExercisesTableOrderingComposer({
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

  ColumnOrderings<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cue => $composableBuilder(
    column: $table.cue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetSets => $composableBuilder(
    column: $table.targetSets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetReps => $composableBuilder(
    column: $table.targetReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetSeconds => $composableBuilder(
    column: $table.targetSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get demoImagePath => $composableBuilder(
    column: $table.demoImagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutTemplateExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutTemplateExercisesTable> {
  $$WorkoutTemplateExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get exercise =>
      $composableBuilder(column: $table.exercise, builder: (column) => column);

  GeneratedColumn<String> get cue =>
      $composableBuilder(column: $table.cue, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetSets => $composableBuilder(
    column: $table.targetSets,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetReps => $composableBuilder(
    column: $table.targetReps,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetSeconds => $composableBuilder(
    column: $table.targetSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get demoImagePath => $composableBuilder(
    column: $table.demoImagePath,
    builder: (column) => column,
  );
}

class $$WorkoutTemplateExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutTemplateExercisesTable,
          WorkoutTemplateExercise,
          $$WorkoutTemplateExercisesTableFilterComposer,
          $$WorkoutTemplateExercisesTableOrderingComposer,
          $$WorkoutTemplateExercisesTableAnnotationComposer,
          $$WorkoutTemplateExercisesTableCreateCompanionBuilder,
          $$WorkoutTemplateExercisesTableUpdateCompanionBuilder,
          (
            WorkoutTemplateExercise,
            BaseReferences<
              _$AppDatabase,
              $WorkoutTemplateExercisesTable,
              WorkoutTemplateExercise
            >,
          ),
          WorkoutTemplateExercise,
          PrefetchHooks Function()
        > {
  $$WorkoutTemplateExercisesTableTableManager(
    _$AppDatabase db,
    $WorkoutTemplateExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTemplateExercisesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$WorkoutTemplateExercisesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkoutTemplateExercisesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> templateId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String> exercise = const Value.absent(),
                Value<String> cue = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> metricType = const Value.absent(),
                Value<int?> targetSets = const Value.absent(),
                Value<int?> targetReps = const Value.absent(),
                Value<int?> targetSeconds = const Value.absent(),
                Value<int> restSeconds = const Value.absent(),
                Value<String?> demoImagePath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplateExercisesCompanion(
                id: id,
                templateId: templateId,
                sortOrder: sortOrder,
                exercise: exercise,
                cue: cue,
                category: category,
                metricType: metricType,
                targetSets: targetSets,
                targetReps: targetReps,
                targetSeconds: targetSeconds,
                restSeconds: restSeconds,
                demoImagePath: demoImagePath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String templateId,
                required int sortOrder,
                required String exercise,
                required String cue,
                required String category,
                Value<String> metricType = const Value.absent(),
                Value<int?> targetSets = const Value.absent(),
                Value<int?> targetReps = const Value.absent(),
                Value<int?> targetSeconds = const Value.absent(),
                Value<int> restSeconds = const Value.absent(),
                Value<String?> demoImagePath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplateExercisesCompanion.insert(
                id: id,
                templateId: templateId,
                sortOrder: sortOrder,
                exercise: exercise,
                cue: cue,
                category: category,
                metricType: metricType,
                targetSets: targetSets,
                targetReps: targetReps,
                targetSeconds: targetSeconds,
                restSeconds: restSeconds,
                demoImagePath: demoImagePath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutTemplateExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutTemplateExercisesTable,
      WorkoutTemplateExercise,
      $$WorkoutTemplateExercisesTableFilterComposer,
      $$WorkoutTemplateExercisesTableOrderingComposer,
      $$WorkoutTemplateExercisesTableAnnotationComposer,
      $$WorkoutTemplateExercisesTableCreateCompanionBuilder,
      $$WorkoutTemplateExercisesTableUpdateCompanionBuilder,
      (
        WorkoutTemplateExercise,
        BaseReferences<
          _$AppDatabase,
          $WorkoutTemplateExercisesTable,
          WorkoutTemplateExercise
        >,
      ),
      WorkoutTemplateExercise,
      PrefetchHooks Function()
    >;
typedef $$WorkoutsTableCreateCompanionBuilder =
    WorkoutsCompanion Function({
      Value<String> id,
      Value<String?> templateId,
      required DateTime date,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$WorkoutsTableUpdateCompanionBuilder =
    WorkoutsCompanion Function({
      Value<String> id,
      Value<String?> templateId,
      Value<DateTime> date,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$WorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableFilterComposer({
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

  ColumnFilters<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableOrderingComposer({
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

  ColumnOrderings<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$WorkoutsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutsTable,
          Workout,
          $$WorkoutsTableFilterComposer,
          $$WorkoutsTableOrderingComposer,
          $$WorkoutsTableAnnotationComposer,
          $$WorkoutsTableCreateCompanionBuilder,
          $$WorkoutsTableUpdateCompanionBuilder,
          (Workout, BaseReferences<_$AppDatabase, $WorkoutsTable, Workout>),
          Workout,
          PrefetchHooks Function()
        > {
  $$WorkoutsTableTableManager(_$AppDatabase db, $WorkoutsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> templateId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutsCompanion(
                id: id,
                templateId: templateId,
                date: date,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> templateId = const Value.absent(),
                required DateTime date,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutsCompanion.insert(
                id: id,
                templateId: templateId,
                date: date,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutsTable,
      Workout,
      $$WorkoutsTableFilterComposer,
      $$WorkoutsTableOrderingComposer,
      $$WorkoutsTableAnnotationComposer,
      $$WorkoutsTableCreateCompanionBuilder,
      $$WorkoutsTableUpdateCompanionBuilder,
      (Workout, BaseReferences<_$AppDatabase, $WorkoutsTable, Workout>),
      Workout,
      PrefetchHooks Function()
    >;
typedef $$StrengthLogsTableCreateCompanionBuilder =
    StrengthLogsCompanion Function({
      Value<String> id,
      required String workoutId,
      Value<String?> templateExerciseId,
      required String exercise,
      Value<double?> weight,
      Value<int?> reps,
      Value<int> setNumber,
      Value<int?> rpe,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });
typedef $$StrengthLogsTableUpdateCompanionBuilder =
    StrengthLogsCompanion Function({
      Value<String> id,
      Value<String> workoutId,
      Value<String?> templateExerciseId,
      Value<String> exercise,
      Value<double?> weight,
      Value<int?> reps,
      Value<int> setNumber,
      Value<int?> rpe,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

class $$StrengthLogsTableFilterComposer
    extends Composer<_$AppDatabase, $StrengthLogsTable> {
  $$StrengthLogsTableFilterComposer({
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

  ColumnFilters<String> get workoutId => $composableBuilder(
    column: $table.workoutId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateExerciseId => $composableBuilder(
    column: $table.templateExerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StrengthLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $StrengthLogsTable> {
  $$StrengthLogsTableOrderingComposer({
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

  ColumnOrderings<String> get workoutId => $composableBuilder(
    column: $table.workoutId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateExerciseId => $composableBuilder(
    column: $table.templateExerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exercise => $composableBuilder(
    column: $table.exercise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StrengthLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StrengthLogsTable> {
  $$StrengthLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workoutId =>
      $composableBuilder(column: $table.workoutId, builder: (column) => column);

  GeneratedColumn<String> get templateExerciseId => $composableBuilder(
    column: $table.templateExerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exercise =>
      $composableBuilder(column: $table.exercise, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$StrengthLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StrengthLogsTable,
          StrengthLog,
          $$StrengthLogsTableFilterComposer,
          $$StrengthLogsTableOrderingComposer,
          $$StrengthLogsTableAnnotationComposer,
          $$StrengthLogsTableCreateCompanionBuilder,
          $$StrengthLogsTableUpdateCompanionBuilder,
          (
            StrengthLog,
            BaseReferences<_$AppDatabase, $StrengthLogsTable, StrengthLog>,
          ),
          StrengthLog,
          PrefetchHooks Function()
        > {
  $$StrengthLogsTableTableManager(_$AppDatabase db, $StrengthLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StrengthLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StrengthLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StrengthLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> workoutId = const Value.absent(),
                Value<String?> templateExerciseId = const Value.absent(),
                Value<String> exercise = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int?> rpe = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrengthLogsCompanion(
                id: id,
                workoutId: workoutId,
                templateExerciseId: templateExerciseId,
                exercise: exercise,
                weight: weight,
                reps: reps,
                setNumber: setNumber,
                rpe: rpe,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String workoutId,
                Value<String?> templateExerciseId = const Value.absent(),
                required String exercise,
                Value<double?> weight = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int?> rpe = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrengthLogsCompanion.insert(
                id: id,
                workoutId: workoutId,
                templateExerciseId: templateExerciseId,
                exercise: exercise,
                weight: weight,
                reps: reps,
                setNumber: setNumber,
                rpe: rpe,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StrengthLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StrengthLogsTable,
      StrengthLog,
      $$StrengthLogsTableFilterComposer,
      $$StrengthLogsTableOrderingComposer,
      $$StrengthLogsTableAnnotationComposer,
      $$StrengthLogsTableCreateCompanionBuilder,
      $$StrengthLogsTableUpdateCompanionBuilder,
      (
        StrengthLog,
        BaseReferences<_$AppDatabase, $StrengthLogsTable, StrengthLog>,
      ),
      StrengthLog,
      PrefetchHooks Function()
    >;
typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      Value<String> id,
      required String name,
      required String category,
      required String horizon,
      Value<double?> startValue,
      Value<double?> targetValue,
      Value<DateTime?> deadline,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<String> horizon,
      Value<double?> startValue,
      Value<double?> targetValue,
      Value<DateTime?> deadline,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
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

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get horizon => $composableBuilder(
    column: $table.horizon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get startValue => $composableBuilder(
    column: $table.startValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
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

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get horizon => $composableBuilder(
    column: $table.horizon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get startValue => $composableBuilder(
    column: $table.startValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
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

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get horizon =>
      $composableBuilder(column: $table.horizon, builder: (column) => column);

  GeneratedColumn<double> get startValue => $composableBuilder(
    column: $table.startValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
          Goal,
          PrefetchHooks Function()
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> horizon = const Value.absent(),
                Value<double?> startValue = const Value.absent(),
                Value<double?> targetValue = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                name: name,
                category: category,
                horizon: horizon,
                startValue: startValue,
                targetValue: targetValue,
                deadline: deadline,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                required String category,
                required String horizon,
                Value<double?> startValue = const Value.absent(),
                Value<double?> targetValue = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion.insert(
                id: id,
                name: name,
                category: category,
                horizon: horizon,
                startValue: startValue,
                targetValue: targetValue,
                deadline: deadline,
                status: status,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
      Goal,
      PrefetchHooks Function()
    >;
typedef $$PhotoCheckpointsTableCreateCompanionBuilder =
    PhotoCheckpointsCompanion Function({
      Value<String> id,
      required DateTime date,
      Value<Uint8List?> front,
      Value<Uint8List?> side,
      Value<Uint8List?> back,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$PhotoCheckpointsTableUpdateCompanionBuilder =
    PhotoCheckpointsCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<Uint8List?> front,
      Value<Uint8List?> side,
      Value<Uint8List?> back,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$PhotoCheckpointsTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoCheckpointsTable> {
  $$PhotoCheckpointsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get front => $composableBuilder(
    column: $table.front,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get back => $composableBuilder(
    column: $table.back,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhotoCheckpointsTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoCheckpointsTable> {
  $$PhotoCheckpointsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get front => $composableBuilder(
    column: $table.front,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get back => $composableBuilder(
    column: $table.back,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhotoCheckpointsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoCheckpointsTable> {
  $$PhotoCheckpointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<Uint8List> get front =>
      $composableBuilder(column: $table.front, builder: (column) => column);

  GeneratedColumn<Uint8List> get side =>
      $composableBuilder(column: $table.side, builder: (column) => column);

  GeneratedColumn<Uint8List> get back =>
      $composableBuilder(column: $table.back, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PhotoCheckpointsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotoCheckpointsTable,
          PhotoCheckpoint,
          $$PhotoCheckpointsTableFilterComposer,
          $$PhotoCheckpointsTableOrderingComposer,
          $$PhotoCheckpointsTableAnnotationComposer,
          $$PhotoCheckpointsTableCreateCompanionBuilder,
          $$PhotoCheckpointsTableUpdateCompanionBuilder,
          (
            PhotoCheckpoint,
            BaseReferences<
              _$AppDatabase,
              $PhotoCheckpointsTable,
              PhotoCheckpoint
            >,
          ),
          PhotoCheckpoint,
          PrefetchHooks Function()
        > {
  $$PhotoCheckpointsTableTableManager(
    _$AppDatabase db,
    $PhotoCheckpointsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotoCheckpointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotoCheckpointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotoCheckpointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<Uint8List?> front = const Value.absent(),
                Value<Uint8List?> side = const Value.absent(),
                Value<Uint8List?> back = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoCheckpointsCompanion(
                id: id,
                date: date,
                front: front,
                side: side,
                back: back,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required DateTime date,
                Value<Uint8List?> front = const Value.absent(),
                Value<Uint8List?> side = const Value.absent(),
                Value<Uint8List?> back = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoCheckpointsCompanion.insert(
                id: id,
                date: date,
                front: front,
                side: side,
                back: back,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhotoCheckpointsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotoCheckpointsTable,
      PhotoCheckpoint,
      $$PhotoCheckpointsTableFilterComposer,
      $$PhotoCheckpointsTableOrderingComposer,
      $$PhotoCheckpointsTableAnnotationComposer,
      $$PhotoCheckpointsTableCreateCompanionBuilder,
      $$PhotoCheckpointsTableUpdateCompanionBuilder,
      (
        PhotoCheckpoint,
        BaseReferences<_$AppDatabase, $PhotoCheckpointsTable, PhotoCheckpoint>,
      ),
      PhotoCheckpoint,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BodyMeasurementsTableTableManager get bodyMeasurements =>
      $$BodyMeasurementsTableTableManager(_db, _db.bodyMeasurements);
  $$DailyCheckinsTableTableManager get dailyCheckins =>
      $$DailyCheckinsTableTableManager(_db, _db.dailyCheckins);
  $$WorkoutTemplatesTableTableManager get workoutTemplates =>
      $$WorkoutTemplatesTableTableManager(_db, _db.workoutTemplates);
  $$WorkoutTemplateExercisesTableTableManager get workoutTemplateExercises =>
      $$WorkoutTemplateExercisesTableTableManager(
        _db,
        _db.workoutTemplateExercises,
      );
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db, _db.workouts);
  $$StrengthLogsTableTableManager get strengthLogs =>
      $$StrengthLogsTableTableManager(_db, _db.strengthLogs);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$PhotoCheckpointsTableTableManager get photoCheckpoints =>
      $$PhotoCheckpointsTableTableManager(_db, _db.photoCheckpoints);
}
