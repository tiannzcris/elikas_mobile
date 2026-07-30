// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $EvacuationCentersTable extends EvacuationCenters
    with TableInfo<$EvacuationCentersTable, EvacuationCenter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvacuationCentersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barangayMeta = const VerificationMeta(
    'barangay',
  );
  @override
  late final GeneratedColumn<String> barangay = GeneratedColumn<String>(
    'barangay',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _capacityPersonsMeta = const VerificationMeta(
    'capacityPersons',
  );
  @override
  late final GeneratedColumn<int> capacityPersons = GeneratedColumn<int>(
    'capacity_persons',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentOccupancyMeta = const VerificationMeta(
    'currentOccupancy',
  );
  @override
  late final GeneratedColumn<int> currentOccupancy = GeneratedColumn<int>(
    'current_occupancy',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occupancyPercentMeta = const VerificationMeta(
    'occupancyPercent',
  );
  @override
  late final GeneratedColumn<double> occupancyPercent = GeneratedColumn<double>(
    'occupancy_percent',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    address,
    barangay,
    latitude,
    longitude,
    capacityPersons,
    currentOccupancy,
    occupancyPercent,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evacuation_centers';
  @override
  VerificationContext validateIntegrity(
    Insertable<EvacuationCenter> instance, {
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
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('barangay')) {
      context.handle(
        _barangayMeta,
        barangay.isAcceptableOrUnknown(data['barangay']!, _barangayMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('capacity_persons')) {
      context.handle(
        _capacityPersonsMeta,
        capacityPersons.isAcceptableOrUnknown(
          data['capacity_persons']!,
          _capacityPersonsMeta,
        ),
      );
    }
    if (data.containsKey('current_occupancy')) {
      context.handle(
        _currentOccupancyMeta,
        currentOccupancy.isAcceptableOrUnknown(
          data['current_occupancy']!,
          _currentOccupancyMeta,
        ),
      );
    }
    if (data.containsKey('occupancy_percent')) {
      context.handle(
        _occupancyPercentMeta,
        occupancyPercent.isAcceptableOrUnknown(
          data['occupancy_percent']!,
          _occupancyPercentMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EvacuationCenter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EvacuationCenter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      barangay: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barangay'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      capacityPersons: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capacity_persons'],
      ),
      currentOccupancy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_occupancy'],
      ),
      occupancyPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}occupancy_percent'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $EvacuationCentersTable createAlias(String alias) {
    return $EvacuationCentersTable(attachedDatabase, alias);
  }
}

class EvacuationCenter extends DataClass
    implements Insertable<EvacuationCenter> {
  final int id;
  final String name;
  final String type;
  final String address;
  final String? barangay;
  final double latitude;
  final double longitude;
  final int? capacityPersons;
  final int? currentOccupancy;
  final double? occupancyPercent;
  final String status;
  const EvacuationCenter({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    this.barangay,
    required this.latitude,
    required this.longitude,
    this.capacityPersons,
    this.currentOccupancy,
    this.occupancyPercent,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || barangay != null) {
      map['barangay'] = Variable<String>(barangay);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || capacityPersons != null) {
      map['capacity_persons'] = Variable<int>(capacityPersons);
    }
    if (!nullToAbsent || currentOccupancy != null) {
      map['current_occupancy'] = Variable<int>(currentOccupancy);
    }
    if (!nullToAbsent || occupancyPercent != null) {
      map['occupancy_percent'] = Variable<double>(occupancyPercent);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  EvacuationCentersCompanion toCompanion(bool nullToAbsent) {
    return EvacuationCentersCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      address: Value(address),
      barangay: barangay == null && nullToAbsent
          ? const Value.absent()
          : Value(barangay),
      latitude: Value(latitude),
      longitude: Value(longitude),
      capacityPersons: capacityPersons == null && nullToAbsent
          ? const Value.absent()
          : Value(capacityPersons),
      currentOccupancy: currentOccupancy == null && nullToAbsent
          ? const Value.absent()
          : Value(currentOccupancy),
      occupancyPercent: occupancyPercent == null && nullToAbsent
          ? const Value.absent()
          : Value(occupancyPercent),
      status: Value(status),
    );
  }

  factory EvacuationCenter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EvacuationCenter(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      address: serializer.fromJson<String>(json['address']),
      barangay: serializer.fromJson<String?>(json['barangay']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      capacityPersons: serializer.fromJson<int?>(json['capacityPersons']),
      currentOccupancy: serializer.fromJson<int?>(json['currentOccupancy']),
      occupancyPercent: serializer.fromJson<double?>(json['occupancyPercent']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'address': serializer.toJson<String>(address),
      'barangay': serializer.toJson<String?>(barangay),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'capacityPersons': serializer.toJson<int?>(capacityPersons),
      'currentOccupancy': serializer.toJson<int?>(currentOccupancy),
      'occupancyPercent': serializer.toJson<double?>(occupancyPercent),
      'status': serializer.toJson<String>(status),
    };
  }

  EvacuationCenter copyWith({
    int? id,
    String? name,
    String? type,
    String? address,
    Value<String?> barangay = const Value.absent(),
    double? latitude,
    double? longitude,
    Value<int?> capacityPersons = const Value.absent(),
    Value<int?> currentOccupancy = const Value.absent(),
    Value<double?> occupancyPercent = const Value.absent(),
    String? status,
  }) => EvacuationCenter(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    address: address ?? this.address,
    barangay: barangay.present ? barangay.value : this.barangay,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    capacityPersons: capacityPersons.present
        ? capacityPersons.value
        : this.capacityPersons,
    currentOccupancy: currentOccupancy.present
        ? currentOccupancy.value
        : this.currentOccupancy,
    occupancyPercent: occupancyPercent.present
        ? occupancyPercent.value
        : this.occupancyPercent,
    status: status ?? this.status,
  );
  EvacuationCenter copyWithCompanion(EvacuationCentersCompanion data) {
    return EvacuationCenter(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      address: data.address.present ? data.address.value : this.address,
      barangay: data.barangay.present ? data.barangay.value : this.barangay,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      capacityPersons: data.capacityPersons.present
          ? data.capacityPersons.value
          : this.capacityPersons,
      currentOccupancy: data.currentOccupancy.present
          ? data.currentOccupancy.value
          : this.currentOccupancy,
      occupancyPercent: data.occupancyPercent.present
          ? data.occupancyPercent.value
          : this.occupancyPercent,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EvacuationCenter(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('address: $address, ')
          ..write('barangay: $barangay, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('capacityPersons: $capacityPersons, ')
          ..write('currentOccupancy: $currentOccupancy, ')
          ..write('occupancyPercent: $occupancyPercent, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    address,
    barangay,
    latitude,
    longitude,
    capacityPersons,
    currentOccupancy,
    occupancyPercent,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EvacuationCenter &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.address == this.address &&
          other.barangay == this.barangay &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.capacityPersons == this.capacityPersons &&
          other.currentOccupancy == this.currentOccupancy &&
          other.occupancyPercent == this.occupancyPercent &&
          other.status == this.status);
}

class EvacuationCentersCompanion extends UpdateCompanion<EvacuationCenter> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> address;
  final Value<String?> barangay;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int?> capacityPersons;
  final Value<int?> currentOccupancy;
  final Value<double?> occupancyPercent;
  final Value<String> status;
  const EvacuationCentersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.address = const Value.absent(),
    this.barangay = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.capacityPersons = const Value.absent(),
    this.currentOccupancy = const Value.absent(),
    this.occupancyPercent = const Value.absent(),
    this.status = const Value.absent(),
  });
  EvacuationCentersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    required String address,
    this.barangay = const Value.absent(),
    required double latitude,
    required double longitude,
    this.capacityPersons = const Value.absent(),
    this.currentOccupancy = const Value.absent(),
    this.occupancyPercent = const Value.absent(),
    required String status,
  }) : name = Value(name),
       type = Value(type),
       address = Value(address),
       latitude = Value(latitude),
       longitude = Value(longitude),
       status = Value(status);
  static Insertable<EvacuationCenter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? address,
    Expression<String>? barangay,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<int>? capacityPersons,
    Expression<int>? currentOccupancy,
    Expression<double>? occupancyPercent,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (address != null) 'address': address,
      if (barangay != null) 'barangay': barangay,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (capacityPersons != null) 'capacity_persons': capacityPersons,
      if (currentOccupancy != null) 'current_occupancy': currentOccupancy,
      if (occupancyPercent != null) 'occupancy_percent': occupancyPercent,
      if (status != null) 'status': status,
    });
  }

  EvacuationCentersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? type,
    Value<String>? address,
    Value<String?>? barangay,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<int?>? capacityPersons,
    Value<int?>? currentOccupancy,
    Value<double?>? occupancyPercent,
    Value<String>? status,
  }) {
    return EvacuationCentersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      address: address ?? this.address,
      barangay: barangay ?? this.barangay,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      capacityPersons: capacityPersons ?? this.capacityPersons,
      currentOccupancy: currentOccupancy ?? this.currentOccupancy,
      occupancyPercent: occupancyPercent ?? this.occupancyPercent,
      status: status ?? this.status,
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
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (barangay.present) {
      map['barangay'] = Variable<String>(barangay.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (capacityPersons.present) {
      map['capacity_persons'] = Variable<int>(capacityPersons.value);
    }
    if (currentOccupancy.present) {
      map['current_occupancy'] = Variable<int>(currentOccupancy.value);
    }
    if (occupancyPercent.present) {
      map['occupancy_percent'] = Variable<double>(occupancyPercent.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvacuationCentersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('address: $address, ')
          ..write('barangay: $barangay, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('capacityPersons: $capacityPersons, ')
          ..write('currentOccupancy: $currentOccupancy, ')
          ..write('occupancyPercent: $occupancyPercent, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $AlertsTable extends Alerts with TableInfo<$AlertsTable, Alert> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlertsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eventNameMeta = const VerificationMeta(
    'eventName',
  );
  @override
  late final GeneratedColumn<String> eventName = GeneratedColumn<String>(
    'event_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _senderNameMeta = const VerificationMeta(
    'senderName',
  );
  @override
  late final GeneratedColumn<String> senderName = GeneratedColumn<String>(
    'sender_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alertTypeMeta = const VerificationMeta(
    'alertType',
  );
  @override
  late final GeneratedColumn<String> alertType = GeneratedColumn<String>(
    'alert_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateSentMeta = const VerificationMeta(
    'dateSent',
  );
  @override
  late final GeneratedColumn<DateTime> dateSent = GeneratedColumn<DateTime>(
    'date_sent',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventName,
    senderName,
    title,
    message,
    alertType,
    severity,
    dateSent,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alerts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Alert> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(
        _eventNameMeta,
        eventName.isAcceptableOrUnknown(data['event_name']!, _eventNameMeta),
      );
    }
    if (data.containsKey('sender_name')) {
      context.handle(
        _senderNameMeta,
        senderName.isAcceptableOrUnknown(data['sender_name']!, _senderNameMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('alert_type')) {
      context.handle(
        _alertTypeMeta,
        alertType.isAcceptableOrUnknown(data['alert_type']!, _alertTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_alertTypeMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('date_sent')) {
      context.handle(
        _dateSentMeta,
        dateSent.isAcceptableOrUnknown(data['date_sent']!, _dateSentMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Alert map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alert(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      eventName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_name'],
      ),
      senderName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_name'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      alertType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alert_type'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity'],
      )!,
      dateSent: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_sent'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AlertsTable createAlias(String alias) {
    return $AlertsTable(attachedDatabase, alias);
  }
}

class Alert extends DataClass implements Insertable<Alert> {
  final int id;
  final String? eventName;
  final String? senderName;
  final String title;
  final String message;
  final String alertType;
  final String severity;
  final DateTime? dateSent;
  final DateTime createdAt;
  const Alert({
    required this.id,
    this.eventName,
    this.senderName,
    required this.title,
    required this.message,
    required this.alertType,
    required this.severity,
    this.dateSent,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String>(eventName);
    }
    if (!nullToAbsent || senderName != null) {
      map['sender_name'] = Variable<String>(senderName);
    }
    map['title'] = Variable<String>(title);
    map['message'] = Variable<String>(message);
    map['alert_type'] = Variable<String>(alertType);
    map['severity'] = Variable<String>(severity);
    if (!nullToAbsent || dateSent != null) {
      map['date_sent'] = Variable<DateTime>(dateSent);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AlertsCompanion toCompanion(bool nullToAbsent) {
    return AlertsCompanion(
      id: Value(id),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      senderName: senderName == null && nullToAbsent
          ? const Value.absent()
          : Value(senderName),
      title: Value(title),
      message: Value(message),
      alertType: Value(alertType),
      severity: Value(severity),
      dateSent: dateSent == null && nullToAbsent
          ? const Value.absent()
          : Value(dateSent),
      createdAt: Value(createdAt),
    );
  }

  factory Alert.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alert(
      id: serializer.fromJson<int>(json['id']),
      eventName: serializer.fromJson<String?>(json['eventName']),
      senderName: serializer.fromJson<String?>(json['senderName']),
      title: serializer.fromJson<String>(json['title']),
      message: serializer.fromJson<String>(json['message']),
      alertType: serializer.fromJson<String>(json['alertType']),
      severity: serializer.fromJson<String>(json['severity']),
      dateSent: serializer.fromJson<DateTime?>(json['dateSent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventName': serializer.toJson<String?>(eventName),
      'senderName': serializer.toJson<String?>(senderName),
      'title': serializer.toJson<String>(title),
      'message': serializer.toJson<String>(message),
      'alertType': serializer.toJson<String>(alertType),
      'severity': serializer.toJson<String>(severity),
      'dateSent': serializer.toJson<DateTime?>(dateSent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Alert copyWith({
    int? id,
    Value<String?> eventName = const Value.absent(),
    Value<String?> senderName = const Value.absent(),
    String? title,
    String? message,
    String? alertType,
    String? severity,
    Value<DateTime?> dateSent = const Value.absent(),
    DateTime? createdAt,
  }) => Alert(
    id: id ?? this.id,
    eventName: eventName.present ? eventName.value : this.eventName,
    senderName: senderName.present ? senderName.value : this.senderName,
    title: title ?? this.title,
    message: message ?? this.message,
    alertType: alertType ?? this.alertType,
    severity: severity ?? this.severity,
    dateSent: dateSent.present ? dateSent.value : this.dateSent,
    createdAt: createdAt ?? this.createdAt,
  );
  Alert copyWithCompanion(AlertsCompanion data) {
    return Alert(
      id: data.id.present ? data.id.value : this.id,
      eventName: data.eventName.present ? data.eventName.value : this.eventName,
      senderName: data.senderName.present
          ? data.senderName.value
          : this.senderName,
      title: data.title.present ? data.title.value : this.title,
      message: data.message.present ? data.message.value : this.message,
      alertType: data.alertType.present ? data.alertType.value : this.alertType,
      severity: data.severity.present ? data.severity.value : this.severity,
      dateSent: data.dateSent.present ? data.dateSent.value : this.dateSent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Alert(')
          ..write('id: $id, ')
          ..write('eventName: $eventName, ')
          ..write('senderName: $senderName, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('alertType: $alertType, ')
          ..write('severity: $severity, ')
          ..write('dateSent: $dateSent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    eventName,
    senderName,
    title,
    message,
    alertType,
    severity,
    dateSent,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alert &&
          other.id == this.id &&
          other.eventName == this.eventName &&
          other.senderName == this.senderName &&
          other.title == this.title &&
          other.message == this.message &&
          other.alertType == this.alertType &&
          other.severity == this.severity &&
          other.dateSent == this.dateSent &&
          other.createdAt == this.createdAt);
}

class AlertsCompanion extends UpdateCompanion<Alert> {
  final Value<int> id;
  final Value<String?> eventName;
  final Value<String?> senderName;
  final Value<String> title;
  final Value<String> message;
  final Value<String> alertType;
  final Value<String> severity;
  final Value<DateTime?> dateSent;
  final Value<DateTime> createdAt;
  const AlertsCompanion({
    this.id = const Value.absent(),
    this.eventName = const Value.absent(),
    this.senderName = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.alertType = const Value.absent(),
    this.severity = const Value.absent(),
    this.dateSent = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AlertsCompanion.insert({
    this.id = const Value.absent(),
    this.eventName = const Value.absent(),
    this.senderName = const Value.absent(),
    required String title,
    required String message,
    required String alertType,
    required String severity,
    this.dateSent = const Value.absent(),
    required DateTime createdAt,
  }) : title = Value(title),
       message = Value(message),
       alertType = Value(alertType),
       severity = Value(severity),
       createdAt = Value(createdAt);
  static Insertable<Alert> custom({
    Expression<int>? id,
    Expression<String>? eventName,
    Expression<String>? senderName,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? alertType,
    Expression<String>? severity,
    Expression<DateTime>? dateSent,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventName != null) 'event_name': eventName,
      if (senderName != null) 'sender_name': senderName,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (alertType != null) 'alert_type': alertType,
      if (severity != null) 'severity': severity,
      if (dateSent != null) 'date_sent': dateSent,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AlertsCompanion copyWith({
    Value<int>? id,
    Value<String?>? eventName,
    Value<String?>? senderName,
    Value<String>? title,
    Value<String>? message,
    Value<String>? alertType,
    Value<String>? severity,
    Value<DateTime?>? dateSent,
    Value<DateTime>? createdAt,
  }) {
    return AlertsCompanion(
      id: id ?? this.id,
      eventName: eventName ?? this.eventName,
      senderName: senderName ?? this.senderName,
      title: title ?? this.title,
      message: message ?? this.message,
      alertType: alertType ?? this.alertType,
      severity: severity ?? this.severity,
      dateSent: dateSent ?? this.dateSent,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    if (senderName.present) {
      map['sender_name'] = Variable<String>(senderName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (alertType.present) {
      map['alert_type'] = Variable<String>(alertType.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (dateSent.present) {
      map['date_sent'] = Variable<DateTime>(dateSent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlertsCompanion(')
          ..write('id: $id, ')
          ..write('eventName: $eventName, ')
          ..write('senderName: $senderName, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('alertType: $alertType, ')
          ..write('severity: $severity, ')
          ..write('dateSent: $dateSent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HazardAreasTable extends HazardAreas
    with TableInfo<$HazardAreasTable, HazardArea> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HazardAreasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaNameMeta = const VerificationMeta(
    'areaName',
  );
  @override
  late final GeneratedColumn<String> areaName = GeneratedColumn<String>(
    'area_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hazardTypeMeta = const VerificationMeta(
    'hazardType',
  );
  @override
  late final GeneratedColumn<String> hazardType = GeneratedColumn<String>(
    'hazard_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _geoJsonGeometryMeta = const VerificationMeta(
    'geoJsonGeometry',
  );
  @override
  late final GeneratedColumn<String> geoJsonGeometry = GeneratedColumn<String>(
    'geo_json_geometry',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    areaName,
    hazardType,
    description,
    geoJsonGeometry,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hazard_areas';
  @override
  VerificationContext validateIntegrity(
    Insertable<HazardArea> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('area_name')) {
      context.handle(
        _areaNameMeta,
        areaName.isAcceptableOrUnknown(data['area_name']!, _areaNameMeta),
      );
    } else if (isInserting) {
      context.missing(_areaNameMeta);
    }
    if (data.containsKey('hazard_type')) {
      context.handle(
        _hazardTypeMeta,
        hazardType.isAcceptableOrUnknown(data['hazard_type']!, _hazardTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_hazardTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('geo_json_geometry')) {
      context.handle(
        _geoJsonGeometryMeta,
        geoJsonGeometry.isAcceptableOrUnknown(
          data['geo_json_geometry']!,
          _geoJsonGeometryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_geoJsonGeometryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HazardArea map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HazardArea(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      areaName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_name'],
      )!,
      hazardType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hazard_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      geoJsonGeometry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geo_json_geometry'],
      )!,
    );
  }

  @override
  $HazardAreasTable createAlias(String alias) {
    return $HazardAreasTable(attachedDatabase, alias);
  }
}

class HazardArea extends DataClass implements Insertable<HazardArea> {
  final int id;
  final String areaName;
  final String hazardType;
  final String? description;
  final String geoJsonGeometry;
  const HazardArea({
    required this.id,
    required this.areaName,
    required this.hazardType,
    this.description,
    required this.geoJsonGeometry,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['area_name'] = Variable<String>(areaName);
    map['hazard_type'] = Variable<String>(hazardType);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['geo_json_geometry'] = Variable<String>(geoJsonGeometry);
    return map;
  }

  HazardAreasCompanion toCompanion(bool nullToAbsent) {
    return HazardAreasCompanion(
      id: Value(id),
      areaName: Value(areaName),
      hazardType: Value(hazardType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      geoJsonGeometry: Value(geoJsonGeometry),
    );
  }

  factory HazardArea.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HazardArea(
      id: serializer.fromJson<int>(json['id']),
      areaName: serializer.fromJson<String>(json['areaName']),
      hazardType: serializer.fromJson<String>(json['hazardType']),
      description: serializer.fromJson<String?>(json['description']),
      geoJsonGeometry: serializer.fromJson<String>(json['geoJsonGeometry']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'areaName': serializer.toJson<String>(areaName),
      'hazardType': serializer.toJson<String>(hazardType),
      'description': serializer.toJson<String?>(description),
      'geoJsonGeometry': serializer.toJson<String>(geoJsonGeometry),
    };
  }

  HazardArea copyWith({
    int? id,
    String? areaName,
    String? hazardType,
    Value<String?> description = const Value.absent(),
    String? geoJsonGeometry,
  }) => HazardArea(
    id: id ?? this.id,
    areaName: areaName ?? this.areaName,
    hazardType: hazardType ?? this.hazardType,
    description: description.present ? description.value : this.description,
    geoJsonGeometry: geoJsonGeometry ?? this.geoJsonGeometry,
  );
  HazardArea copyWithCompanion(HazardAreasCompanion data) {
    return HazardArea(
      id: data.id.present ? data.id.value : this.id,
      areaName: data.areaName.present ? data.areaName.value : this.areaName,
      hazardType: data.hazardType.present
          ? data.hazardType.value
          : this.hazardType,
      description: data.description.present
          ? data.description.value
          : this.description,
      geoJsonGeometry: data.geoJsonGeometry.present
          ? data.geoJsonGeometry.value
          : this.geoJsonGeometry,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HazardArea(')
          ..write('id: $id, ')
          ..write('areaName: $areaName, ')
          ..write('hazardType: $hazardType, ')
          ..write('description: $description, ')
          ..write('geoJsonGeometry: $geoJsonGeometry')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, areaName, hazardType, description, geoJsonGeometry);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HazardArea &&
          other.id == this.id &&
          other.areaName == this.areaName &&
          other.hazardType == this.hazardType &&
          other.description == this.description &&
          other.geoJsonGeometry == this.geoJsonGeometry);
}

class HazardAreasCompanion extends UpdateCompanion<HazardArea> {
  final Value<int> id;
  final Value<String> areaName;
  final Value<String> hazardType;
  final Value<String?> description;
  final Value<String> geoJsonGeometry;
  const HazardAreasCompanion({
    this.id = const Value.absent(),
    this.areaName = const Value.absent(),
    this.hazardType = const Value.absent(),
    this.description = const Value.absent(),
    this.geoJsonGeometry = const Value.absent(),
  });
  HazardAreasCompanion.insert({
    this.id = const Value.absent(),
    required String areaName,
    required String hazardType,
    this.description = const Value.absent(),
    required String geoJsonGeometry,
  }) : areaName = Value(areaName),
       hazardType = Value(hazardType),
       geoJsonGeometry = Value(geoJsonGeometry);
  static Insertable<HazardArea> custom({
    Expression<int>? id,
    Expression<String>? areaName,
    Expression<String>? hazardType,
    Expression<String>? description,
    Expression<String>? geoJsonGeometry,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (areaName != null) 'area_name': areaName,
      if (hazardType != null) 'hazard_type': hazardType,
      if (description != null) 'description': description,
      if (geoJsonGeometry != null) 'geo_json_geometry': geoJsonGeometry,
    });
  }

  HazardAreasCompanion copyWith({
    Value<int>? id,
    Value<String>? areaName,
    Value<String>? hazardType,
    Value<String?>? description,
    Value<String>? geoJsonGeometry,
  }) {
    return HazardAreasCompanion(
      id: id ?? this.id,
      areaName: areaName ?? this.areaName,
      hazardType: hazardType ?? this.hazardType,
      description: description ?? this.description,
      geoJsonGeometry: geoJsonGeometry ?? this.geoJsonGeometry,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (areaName.present) {
      map['area_name'] = Variable<String>(areaName.value);
    }
    if (hazardType.present) {
      map['hazard_type'] = Variable<String>(hazardType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (geoJsonGeometry.present) {
      map['geo_json_geometry'] = Variable<String>(geoJsonGeometry.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HazardAreasCompanion(')
          ..write('id: $id, ')
          ..write('areaName: $areaName, ')
          ..write('hazardType: $hazardType, ')
          ..write('description: $description, ')
          ..write('geoJsonGeometry: $geoJsonGeometry')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EvacuationCentersTable evacuationCenters =
      $EvacuationCentersTable(this);
  late final $AlertsTable alerts = $AlertsTable(this);
  late final $HazardAreasTable hazardAreas = $HazardAreasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    evacuationCenters,
    alerts,
    hazardAreas,
  ];
}

typedef $$EvacuationCentersTableCreateCompanionBuilder =
    EvacuationCentersCompanion Function({
      Value<int> id,
      required String name,
      required String type,
      required String address,
      Value<String?> barangay,
      required double latitude,
      required double longitude,
      Value<int?> capacityPersons,
      Value<int?> currentOccupancy,
      Value<double?> occupancyPercent,
      required String status,
    });
typedef $$EvacuationCentersTableUpdateCompanionBuilder =
    EvacuationCentersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> type,
      Value<String> address,
      Value<String?> barangay,
      Value<double> latitude,
      Value<double> longitude,
      Value<int?> capacityPersons,
      Value<int?> currentOccupancy,
      Value<double?> occupancyPercent,
      Value<String> status,
    });

class $$EvacuationCentersTableFilterComposer
    extends Composer<_$AppDatabase, $EvacuationCentersTable> {
  $$EvacuationCentersTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barangay => $composableBuilder(
    column: $table.barangay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacityPersons => $composableBuilder(
    column: $table.capacityPersons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentOccupancy => $composableBuilder(
    column: $table.currentOccupancy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get occupancyPercent => $composableBuilder(
    column: $table.occupancyPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EvacuationCentersTableOrderingComposer
    extends Composer<_$AppDatabase, $EvacuationCentersTable> {
  $$EvacuationCentersTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barangay => $composableBuilder(
    column: $table.barangay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacityPersons => $composableBuilder(
    column: $table.capacityPersons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentOccupancy => $composableBuilder(
    column: $table.currentOccupancy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get occupancyPercent => $composableBuilder(
    column: $table.occupancyPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EvacuationCentersTableAnnotationComposer
    extends Composer<_$AppDatabase, $EvacuationCentersTable> {
  $$EvacuationCentersTableAnnotationComposer({
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

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get barangay =>
      $composableBuilder(column: $table.barangay, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<int> get capacityPersons => $composableBuilder(
    column: $table.capacityPersons,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentOccupancy => $composableBuilder(
    column: $table.currentOccupancy,
    builder: (column) => column,
  );

  GeneratedColumn<double> get occupancyPercent => $composableBuilder(
    column: $table.occupancyPercent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$EvacuationCentersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EvacuationCentersTable,
          EvacuationCenter,
          $$EvacuationCentersTableFilterComposer,
          $$EvacuationCentersTableOrderingComposer,
          $$EvacuationCentersTableAnnotationComposer,
          $$EvacuationCentersTableCreateCompanionBuilder,
          $$EvacuationCentersTableUpdateCompanionBuilder,
          (
            EvacuationCenter,
            BaseReferences<
              _$AppDatabase,
              $EvacuationCentersTable,
              EvacuationCenter
            >,
          ),
          EvacuationCenter,
          PrefetchHooks Function()
        > {
  $$EvacuationCentersTableTableManager(
    _$AppDatabase db,
    $EvacuationCentersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvacuationCentersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvacuationCentersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvacuationCentersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String?> barangay = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<int?> capacityPersons = const Value.absent(),
                Value<int?> currentOccupancy = const Value.absent(),
                Value<double?> occupancyPercent = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => EvacuationCentersCompanion(
                id: id,
                name: name,
                type: type,
                address: address,
                barangay: barangay,
                latitude: latitude,
                longitude: longitude,
                capacityPersons: capacityPersons,
                currentOccupancy: currentOccupancy,
                occupancyPercent: occupancyPercent,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String type,
                required String address,
                Value<String?> barangay = const Value.absent(),
                required double latitude,
                required double longitude,
                Value<int?> capacityPersons = const Value.absent(),
                Value<int?> currentOccupancy = const Value.absent(),
                Value<double?> occupancyPercent = const Value.absent(),
                required String status,
              }) => EvacuationCentersCompanion.insert(
                id: id,
                name: name,
                type: type,
                address: address,
                barangay: barangay,
                latitude: latitude,
                longitude: longitude,
                capacityPersons: capacityPersons,
                currentOccupancy: currentOccupancy,
                occupancyPercent: occupancyPercent,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EvacuationCentersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EvacuationCentersTable,
      EvacuationCenter,
      $$EvacuationCentersTableFilterComposer,
      $$EvacuationCentersTableOrderingComposer,
      $$EvacuationCentersTableAnnotationComposer,
      $$EvacuationCentersTableCreateCompanionBuilder,
      $$EvacuationCentersTableUpdateCompanionBuilder,
      (
        EvacuationCenter,
        BaseReferences<
          _$AppDatabase,
          $EvacuationCentersTable,
          EvacuationCenter
        >,
      ),
      EvacuationCenter,
      PrefetchHooks Function()
    >;
typedef $$AlertsTableCreateCompanionBuilder =
    AlertsCompanion Function({
      Value<int> id,
      Value<String?> eventName,
      Value<String?> senderName,
      required String title,
      required String message,
      required String alertType,
      required String severity,
      Value<DateTime?> dateSent,
      required DateTime createdAt,
    });
typedef $$AlertsTableUpdateCompanionBuilder =
    AlertsCompanion Function({
      Value<int> id,
      Value<String?> eventName,
      Value<String?> senderName,
      Value<String> title,
      Value<String> message,
      Value<String> alertType,
      Value<String> severity,
      Value<DateTime?> dateSent,
      Value<DateTime> createdAt,
    });

class $$AlertsTableFilterComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableFilterComposer({
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

  ColumnFilters<String> get eventName => $composableBuilder(
    column: $table.eventName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alertType => $composableBuilder(
    column: $table.alertType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateSent => $composableBuilder(
    column: $table.dateSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AlertsTableOrderingComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableOrderingComposer({
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

  ColumnOrderings<String> get eventName => $composableBuilder(
    column: $table.eventName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alertType => $composableBuilder(
    column: $table.alertType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateSent => $composableBuilder(
    column: $table.dateSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlertsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get eventName =>
      $composableBuilder(column: $table.eventName, builder: (column) => column);

  GeneratedColumn<String> get senderName => $composableBuilder(
    column: $table.senderName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get alertType =>
      $composableBuilder(column: $table.alertType, builder: (column) => column);

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<DateTime> get dateSent =>
      $composableBuilder(column: $table.dateSent, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AlertsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlertsTable,
          Alert,
          $$AlertsTableFilterComposer,
          $$AlertsTableOrderingComposer,
          $$AlertsTableAnnotationComposer,
          $$AlertsTableCreateCompanionBuilder,
          $$AlertsTableUpdateCompanionBuilder,
          (Alert, BaseReferences<_$AppDatabase, $AlertsTable, Alert>),
          Alert,
          PrefetchHooks Function()
        > {
  $$AlertsTableTableManager(_$AppDatabase db, $AlertsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlertsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlertsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlertsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> eventName = const Value.absent(),
                Value<String?> senderName = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String> alertType = const Value.absent(),
                Value<String> severity = const Value.absent(),
                Value<DateTime?> dateSent = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AlertsCompanion(
                id: id,
                eventName: eventName,
                senderName: senderName,
                title: title,
                message: message,
                alertType: alertType,
                severity: severity,
                dateSent: dateSent,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> eventName = const Value.absent(),
                Value<String?> senderName = const Value.absent(),
                required String title,
                required String message,
                required String alertType,
                required String severity,
                Value<DateTime?> dateSent = const Value.absent(),
                required DateTime createdAt,
              }) => AlertsCompanion.insert(
                id: id,
                eventName: eventName,
                senderName: senderName,
                title: title,
                message: message,
                alertType: alertType,
                severity: severity,
                dateSent: dateSent,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AlertsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlertsTable,
      Alert,
      $$AlertsTableFilterComposer,
      $$AlertsTableOrderingComposer,
      $$AlertsTableAnnotationComposer,
      $$AlertsTableCreateCompanionBuilder,
      $$AlertsTableUpdateCompanionBuilder,
      (Alert, BaseReferences<_$AppDatabase, $AlertsTable, Alert>),
      Alert,
      PrefetchHooks Function()
    >;
typedef $$HazardAreasTableCreateCompanionBuilder =
    HazardAreasCompanion Function({
      Value<int> id,
      required String areaName,
      required String hazardType,
      Value<String?> description,
      required String geoJsonGeometry,
    });
typedef $$HazardAreasTableUpdateCompanionBuilder =
    HazardAreasCompanion Function({
      Value<int> id,
      Value<String> areaName,
      Value<String> hazardType,
      Value<String?> description,
      Value<String> geoJsonGeometry,
    });

class $$HazardAreasTableFilterComposer
    extends Composer<_$AppDatabase, $HazardAreasTable> {
  $$HazardAreasTableFilterComposer({
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

  ColumnFilters<String> get areaName => $composableBuilder(
    column: $table.areaName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hazardType => $composableBuilder(
    column: $table.hazardType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get geoJsonGeometry => $composableBuilder(
    column: $table.geoJsonGeometry,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HazardAreasTableOrderingComposer
    extends Composer<_$AppDatabase, $HazardAreasTable> {
  $$HazardAreasTableOrderingComposer({
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

  ColumnOrderings<String> get areaName => $composableBuilder(
    column: $table.areaName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hazardType => $composableBuilder(
    column: $table.hazardType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geoJsonGeometry => $composableBuilder(
    column: $table.geoJsonGeometry,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HazardAreasTableAnnotationComposer
    extends Composer<_$AppDatabase, $HazardAreasTable> {
  $$HazardAreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get areaName =>
      $composableBuilder(column: $table.areaName, builder: (column) => column);

  GeneratedColumn<String> get hazardType => $composableBuilder(
    column: $table.hazardType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get geoJsonGeometry => $composableBuilder(
    column: $table.geoJsonGeometry,
    builder: (column) => column,
  );
}

class $$HazardAreasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HazardAreasTable,
          HazardArea,
          $$HazardAreasTableFilterComposer,
          $$HazardAreasTableOrderingComposer,
          $$HazardAreasTableAnnotationComposer,
          $$HazardAreasTableCreateCompanionBuilder,
          $$HazardAreasTableUpdateCompanionBuilder,
          (
            HazardArea,
            BaseReferences<_$AppDatabase, $HazardAreasTable, HazardArea>,
          ),
          HazardArea,
          PrefetchHooks Function()
        > {
  $$HazardAreasTableTableManager(_$AppDatabase db, $HazardAreasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HazardAreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HazardAreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HazardAreasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> areaName = const Value.absent(),
                Value<String> hazardType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> geoJsonGeometry = const Value.absent(),
              }) => HazardAreasCompanion(
                id: id,
                areaName: areaName,
                hazardType: hazardType,
                description: description,
                geoJsonGeometry: geoJsonGeometry,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String areaName,
                required String hazardType,
                Value<String?> description = const Value.absent(),
                required String geoJsonGeometry,
              }) => HazardAreasCompanion.insert(
                id: id,
                areaName: areaName,
                hazardType: hazardType,
                description: description,
                geoJsonGeometry: geoJsonGeometry,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HazardAreasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HazardAreasTable,
      HazardArea,
      $$HazardAreasTableFilterComposer,
      $$HazardAreasTableOrderingComposer,
      $$HazardAreasTableAnnotationComposer,
      $$HazardAreasTableCreateCompanionBuilder,
      $$HazardAreasTableUpdateCompanionBuilder,
      (
        HazardArea,
        BaseReferences<_$AppDatabase, $HazardAreasTable, HazardArea>,
      ),
      HazardArea,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EvacuationCentersTableTableManager get evacuationCenters =>
      $$EvacuationCentersTableTableManager(_db, _db.evacuationCenters);
  $$AlertsTableTableManager get alerts =>
      $$AlertsTableTableManager(_db, _db.alerts);
  $$HazardAreasTableTableManager get hazardAreas =>
      $$HazardAreasTableTableManager(_db, _db.hazardAreas);
}
