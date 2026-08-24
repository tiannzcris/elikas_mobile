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
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
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
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
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
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
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
  final double? latitude;
  final double? longitude;
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
    this.latitude,
    this.longitude,
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
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
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
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
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
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
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
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
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
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
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
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
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
  final Value<double?> latitude;
  final Value<double?> longitude;
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
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.capacityPersons = const Value.absent(),
    this.currentOccupancy = const Value.absent(),
    this.occupancyPercent = const Value.absent(),
    required String status,
  }) : name = Value(name),
       type = Value(type),
       address = Value(address),
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
    Value<double?>? latitude,
    Value<double?>? longitude,
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
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<int> eventId = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    true,
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
    eventId,
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
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
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
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_id'],
      ),
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
  final int? eventId;
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
    this.eventId,
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
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<int>(eventId);
    }
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
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
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
      eventId: serializer.fromJson<int?>(json['eventId']),
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
      'eventId': serializer.toJson<int?>(eventId),
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
    Value<int?> eventId = const Value.absent(),
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
    eventId: eventId.present ? eventId.value : this.eventId,
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
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
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
          ..write('eventId: $eventId, ')
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
    eventId,
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
          other.eventId == this.eventId &&
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
  final Value<int?> eventId;
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
    this.eventId = const Value.absent(),
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
    this.eventId = const Value.absent(),
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
    Expression<int>? eventId,
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
      if (eventId != null) 'event_id': eventId,
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
    Value<int?>? eventId,
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
      eventId: eventId ?? this.eventId,
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
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
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
          ..write('eventId: $eventId, ')
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

class $BarangaysTable extends Barangays
    with TableInfo<$BarangaysTable, Barangay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarangaysTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'barangays';
  @override
  VerificationContext validateIntegrity(
    Insertable<Barangay> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Barangay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Barangay(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $BarangaysTable createAlias(String alias) {
    return $BarangaysTable(attachedDatabase, alias);
  }
}

class Barangay extends DataClass implements Insertable<Barangay> {
  final int id;
  final String name;
  const Barangay({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  BarangaysCompanion toCompanion(bool nullToAbsent) {
    return BarangaysCompanion(id: Value(id), name: Value(name));
  }

  factory Barangay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Barangay(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Barangay copyWith({int? id, String? name}) =>
      Barangay(id: id ?? this.id, name: name ?? this.name);
  Barangay copyWithCompanion(BarangaysCompanion data) {
    return Barangay(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Barangay(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Barangay && other.id == this.id && other.name == this.name);
}

class BarangaysCompanion extends UpdateCompanion<Barangay> {
  final Value<int> id;
  final Value<String> name;
  const BarangaysCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  BarangaysCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Barangay> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  BarangaysCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return BarangaysCompanion(id: id ?? this.id, name: name ?? this.name);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarangaysCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $EvacuationEventsTable extends EvacuationEvents
    with TableInfo<$EvacuationEventsTable, EvacuationEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvacuationEventsTable(this.attachedDatabase, [this._alias]);
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
  List<GeneratedColumn> get $columns => [id, name, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evacuation_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<EvacuationEvent> instance, {
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
  EvacuationEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EvacuationEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $EvacuationEventsTable createAlias(String alias) {
    return $EvacuationEventsTable(attachedDatabase, alias);
  }
}

class EvacuationEvent extends DataClass implements Insertable<EvacuationEvent> {
  final int id;
  final String name;
  final String status;
  const EvacuationEvent({
    required this.id,
    required this.name,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    return map;
  }

  EvacuationEventsCompanion toCompanion(bool nullToAbsent) {
    return EvacuationEventsCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
    );
  }

  factory EvacuationEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EvacuationEvent(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
    };
  }

  EvacuationEvent copyWith({int? id, String? name, String? status}) =>
      EvacuationEvent(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
      );
  EvacuationEvent copyWithCompanion(EvacuationEventsCompanion data) {
    return EvacuationEvent(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EvacuationEvent(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EvacuationEvent &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status);
}

class EvacuationEventsCompanion extends UpdateCompanion<EvacuationEvent> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> status;
  const EvacuationEventsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
  });
  EvacuationEventsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String status,
  }) : name = Value(name),
       status = Value(status);
  static Insertable<EvacuationEvent> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    });
  }

  EvacuationEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? status,
  }) {
    return EvacuationEventsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvacuationEventsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $PendingRegistrationsTable extends PendingRegistrations
    with TableInfo<$PendingRegistrationsTable, PendingRegistration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingRegistrationsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _headOfFamilyNameMeta = const VerificationMeta(
    'headOfFamilyName',
  );
  @override
  late final GeneratedColumn<String> headOfFamilyName = GeneratedColumn<String>(
    'head_of_family_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barangayNameMeta = const VerificationMeta(
    'barangayName',
  );
  @override
  late final GeneratedColumn<String> barangayName = GeneratedColumn<String>(
    'barangay_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _memberCountMeta = const VerificationMeta(
    'memberCount',
  );
  @override
  late final GeneratedColumn<int> memberCount = GeneratedColumn<int>(
    'member_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
    'synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _syncErrorMeta = const VerificationMeta(
    'syncError',
  );
  @override
  late final GeneratedColumn<String> syncError = GeneratedColumn<String>(
    'sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    payloadJson,
    headOfFamilyName,
    barangayName,
    memberCount,
    createdAt,
    synced,
    syncError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_registrations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingRegistration> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadJsonMeta);
    }
    if (data.containsKey('head_of_family_name')) {
      context.handle(
        _headOfFamilyNameMeta,
        headOfFamilyName.isAcceptableOrUnknown(
          data['head_of_family_name']!,
          _headOfFamilyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_headOfFamilyNameMeta);
    }
    if (data.containsKey('barangay_name')) {
      context.handle(
        _barangayNameMeta,
        barangayName.isAcceptableOrUnknown(
          data['barangay_name']!,
          _barangayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_barangayNameMeta);
    }
    if (data.containsKey('member_count')) {
      context.handle(
        _memberCountMeta,
        memberCount.isAcceptableOrUnknown(
          data['member_count']!,
          _memberCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_memberCountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(
        _syncedMeta,
        synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta),
      );
    }
    if (data.containsKey('sync_error')) {
      context.handle(
        _syncErrorMeta,
        syncError.isAcceptableOrUnknown(data['sync_error']!, _syncErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingRegistration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingRegistration(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      headOfFamilyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}head_of_family_name'],
      )!,
      barangayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barangay_name'],
      )!,
      memberCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      synced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced'],
      )!,
      syncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_error'],
      ),
    );
  }

  @override
  $PendingRegistrationsTable createAlias(String alias) {
    return $PendingRegistrationsTable(attachedDatabase, alias);
  }
}

class PendingRegistration extends DataClass
    implements Insertable<PendingRegistration> {
  final int id;
  final String payloadJson;
  final String headOfFamilyName;
  final String barangayName;
  final int memberCount;
  final DateTime createdAt;
  final bool synced;
  final String? syncError;
  const PendingRegistration({
    required this.id,
    required this.payloadJson,
    required this.headOfFamilyName,
    required this.barangayName,
    required this.memberCount,
    required this.createdAt,
    required this.synced,
    this.syncError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['payload_json'] = Variable<String>(payloadJson);
    map['head_of_family_name'] = Variable<String>(headOfFamilyName);
    map['barangay_name'] = Variable<String>(barangayName);
    map['member_count'] = Variable<int>(memberCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['synced'] = Variable<bool>(synced);
    if (!nullToAbsent || syncError != null) {
      map['sync_error'] = Variable<String>(syncError);
    }
    return map;
  }

  PendingRegistrationsCompanion toCompanion(bool nullToAbsent) {
    return PendingRegistrationsCompanion(
      id: Value(id),
      payloadJson: Value(payloadJson),
      headOfFamilyName: Value(headOfFamilyName),
      barangayName: Value(barangayName),
      memberCount: Value(memberCount),
      createdAt: Value(createdAt),
      synced: Value(synced),
      syncError: syncError == null && nullToAbsent
          ? const Value.absent()
          : Value(syncError),
    );
  }

  factory PendingRegistration.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingRegistration(
      id: serializer.fromJson<int>(json['id']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      headOfFamilyName: serializer.fromJson<String>(json['headOfFamilyName']),
      barangayName: serializer.fromJson<String>(json['barangayName']),
      memberCount: serializer.fromJson<int>(json['memberCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      synced: serializer.fromJson<bool>(json['synced']),
      syncError: serializer.fromJson<String?>(json['syncError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'headOfFamilyName': serializer.toJson<String>(headOfFamilyName),
      'barangayName': serializer.toJson<String>(barangayName),
      'memberCount': serializer.toJson<int>(memberCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'synced': serializer.toJson<bool>(synced),
      'syncError': serializer.toJson<String?>(syncError),
    };
  }

  PendingRegistration copyWith({
    int? id,
    String? payloadJson,
    String? headOfFamilyName,
    String? barangayName,
    int? memberCount,
    DateTime? createdAt,
    bool? synced,
    Value<String?> syncError = const Value.absent(),
  }) => PendingRegistration(
    id: id ?? this.id,
    payloadJson: payloadJson ?? this.payloadJson,
    headOfFamilyName: headOfFamilyName ?? this.headOfFamilyName,
    barangayName: barangayName ?? this.barangayName,
    memberCount: memberCount ?? this.memberCount,
    createdAt: createdAt ?? this.createdAt,
    synced: synced ?? this.synced,
    syncError: syncError.present ? syncError.value : this.syncError,
  );
  PendingRegistration copyWithCompanion(PendingRegistrationsCompanion data) {
    return PendingRegistration(
      id: data.id.present ? data.id.value : this.id,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      headOfFamilyName: data.headOfFamilyName.present
          ? data.headOfFamilyName.value
          : this.headOfFamilyName,
      barangayName: data.barangayName.present
          ? data.barangayName.value
          : this.barangayName,
      memberCount: data.memberCount.present
          ? data.memberCount.value
          : this.memberCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      synced: data.synced.present ? data.synced.value : this.synced,
      syncError: data.syncError.present ? data.syncError.value : this.syncError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingRegistration(')
          ..write('id: $id, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('headOfFamilyName: $headOfFamilyName, ')
          ..write('barangayName: $barangayName, ')
          ..write('memberCount: $memberCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('synced: $synced, ')
          ..write('syncError: $syncError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    payloadJson,
    headOfFamilyName,
    barangayName,
    memberCount,
    createdAt,
    synced,
    syncError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingRegistration &&
          other.id == this.id &&
          other.payloadJson == this.payloadJson &&
          other.headOfFamilyName == this.headOfFamilyName &&
          other.barangayName == this.barangayName &&
          other.memberCount == this.memberCount &&
          other.createdAt == this.createdAt &&
          other.synced == this.synced &&
          other.syncError == this.syncError);
}

class PendingRegistrationsCompanion
    extends UpdateCompanion<PendingRegistration> {
  final Value<int> id;
  final Value<String> payloadJson;
  final Value<String> headOfFamilyName;
  final Value<String> barangayName;
  final Value<int> memberCount;
  final Value<DateTime> createdAt;
  final Value<bool> synced;
  final Value<String?> syncError;
  const PendingRegistrationsCompanion({
    this.id = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.headOfFamilyName = const Value.absent(),
    this.barangayName = const Value.absent(),
    this.memberCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.synced = const Value.absent(),
    this.syncError = const Value.absent(),
  });
  PendingRegistrationsCompanion.insert({
    this.id = const Value.absent(),
    required String payloadJson,
    required String headOfFamilyName,
    required String barangayName,
    required int memberCount,
    required DateTime createdAt,
    this.synced = const Value.absent(),
    this.syncError = const Value.absent(),
  }) : payloadJson = Value(payloadJson),
       headOfFamilyName = Value(headOfFamilyName),
       barangayName = Value(barangayName),
       memberCount = Value(memberCount),
       createdAt = Value(createdAt);
  static Insertable<PendingRegistration> custom({
    Expression<int>? id,
    Expression<String>? payloadJson,
    Expression<String>? headOfFamilyName,
    Expression<String>? barangayName,
    Expression<int>? memberCount,
    Expression<DateTime>? createdAt,
    Expression<bool>? synced,
    Expression<String>? syncError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (headOfFamilyName != null) 'head_of_family_name': headOfFamilyName,
      if (barangayName != null) 'barangay_name': barangayName,
      if (memberCount != null) 'member_count': memberCount,
      if (createdAt != null) 'created_at': createdAt,
      if (synced != null) 'synced': synced,
      if (syncError != null) 'sync_error': syncError,
    });
  }

  PendingRegistrationsCompanion copyWith({
    Value<int>? id,
    Value<String>? payloadJson,
    Value<String>? headOfFamilyName,
    Value<String>? barangayName,
    Value<int>? memberCount,
    Value<DateTime>? createdAt,
    Value<bool>? synced,
    Value<String?>? syncError,
  }) {
    return PendingRegistrationsCompanion(
      id: id ?? this.id,
      payloadJson: payloadJson ?? this.payloadJson,
      headOfFamilyName: headOfFamilyName ?? this.headOfFamilyName,
      barangayName: barangayName ?? this.barangayName,
      memberCount: memberCount ?? this.memberCount,
      createdAt: createdAt ?? this.createdAt,
      synced: synced ?? this.synced,
      syncError: syncError ?? this.syncError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (headOfFamilyName.present) {
      map['head_of_family_name'] = Variable<String>(headOfFamilyName.value);
    }
    if (barangayName.present) {
      map['barangay_name'] = Variable<String>(barangayName.value);
    }
    if (memberCount.present) {
      map['member_count'] = Variable<int>(memberCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    if (syncError.present) {
      map['sync_error'] = Variable<String>(syncError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingRegistrationsCompanion(')
          ..write('id: $id, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('headOfFamilyName: $headOfFamilyName, ')
          ..write('barangayName: $barangayName, ')
          ..write('memberCount: $memberCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('synced: $synced, ')
          ..write('syncError: $syncError')
          ..write(')'))
        .toString();
  }
}

class $CachedFamiliesTable extends CachedFamilies
    with TableInfo<$CachedFamiliesTable, CachedFamily> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedFamiliesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _barangayIdMeta = const VerificationMeta(
    'barangayId',
  );
  @override
  late final GeneratedColumn<int> barangayId = GeneratedColumn<int>(
    'barangay_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barangayNameMeta = const VerificationMeta(
    'barangayName',
  );
  @override
  late final GeneratedColumn<String> barangayName = GeneratedColumn<String>(
    'barangay_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeAddressMeta = const VerificationMeta(
    'homeAddress',
  );
  @override
  late final GeneratedColumn<String> homeAddress = GeneratedColumn<String>(
    'home_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _evacuationEventIdMeta = const VerificationMeta(
    'evacuationEventId',
  );
  @override
  late final GeneratedColumn<int> evacuationEventId = GeneratedColumn<int>(
    'evacuation_event_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _evacuationEventNameMeta =
      const VerificationMeta('evacuationEventName');
  @override
  late final GeneratedColumn<String> evacuationEventName =
      GeneratedColumn<String>(
        'evacuation_event_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _evacuationCenterIdMeta =
      const VerificationMeta('evacuationCenterId');
  @override
  late final GeneratedColumn<int> evacuationCenterId = GeneratedColumn<int>(
    'evacuation_center_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _evacuationCenterNameMeta =
      const VerificationMeta('evacuationCenterName');
  @override
  late final GeneratedColumn<String> evacuationCenterName =
      GeneratedColumn<String>(
        'evacuation_center_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _is4psBeneficiaryMeta = const VerificationMeta(
    'is4psBeneficiary',
  );
  @override
  late final GeneratedColumn<bool> is4psBeneficiary = GeneratedColumn<bool>(
    'is4ps_beneficiary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is4ps_beneficiary" IN (0, 1))',
    ),
  );
  static const VerificationMeta _hasPwdMemberMeta = const VerificationMeta(
    'hasPwdMember',
  );
  @override
  late final GeneratedColumn<bool> hasPwdMember = GeneratedColumn<bool>(
    'has_pwd_member',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_pwd_member" IN (0, 1))',
    ),
  );
  static const VerificationMeta _hasSeniorMemberMeta = const VerificationMeta(
    'hasSeniorMember',
  );
  @override
  late final GeneratedColumn<bool> hasSeniorMember = GeneratedColumn<bool>(
    'has_senior_member',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_senior_member" IN (0, 1))',
    ),
  );
  static const VerificationMeta _hasLactatingMemberMeta =
      const VerificationMeta('hasLactatingMember');
  @override
  late final GeneratedColumn<bool> hasLactatingMember = GeneratedColumn<bool>(
    'has_lactating_member',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_lactating_member" IN (0, 1))',
    ),
  );
  static const VerificationMeta _memberCountMeta = const VerificationMeta(
    'memberCount',
  );
  @override
  late final GeneratedColumn<int> memberCount = GeneratedColumn<int>(
    'member_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _headOfFamilyEvacueeIdMeta =
      const VerificationMeta('headOfFamilyEvacueeId');
  @override
  late final GeneratedColumn<int> headOfFamilyEvacueeId = GeneratedColumn<int>(
    'head_of_family_evacuee_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _headOfFamilyNameMeta = const VerificationMeta(
    'headOfFamilyName',
  );
  @override
  late final GeneratedColumn<String> headOfFamilyName = GeneratedColumn<String>(
    'head_of_family_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _familyCreatedAtMeta = const VerificationMeta(
    'familyCreatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> familyCreatedAt =
      GeneratedColumn<DateTime>(
        'family_created_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    barangayId,
    barangayName,
    homeAddress,
    evacuationEventId,
    evacuationEventName,
    evacuationCenterId,
    evacuationCenterName,
    is4psBeneficiary,
    hasPwdMember,
    hasSeniorMember,
    hasLactatingMember,
    memberCount,
    headOfFamilyEvacueeId,
    headOfFamilyName,
    familyCreatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_families';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedFamily> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('barangay_id')) {
      context.handle(
        _barangayIdMeta,
        barangayId.isAcceptableOrUnknown(data['barangay_id']!, _barangayIdMeta),
      );
    } else if (isInserting) {
      context.missing(_barangayIdMeta);
    }
    if (data.containsKey('barangay_name')) {
      context.handle(
        _barangayNameMeta,
        barangayName.isAcceptableOrUnknown(
          data['barangay_name']!,
          _barangayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_barangayNameMeta);
    }
    if (data.containsKey('home_address')) {
      context.handle(
        _homeAddressMeta,
        homeAddress.isAcceptableOrUnknown(
          data['home_address']!,
          _homeAddressMeta,
        ),
      );
    }
    if (data.containsKey('evacuation_event_id')) {
      context.handle(
        _evacuationEventIdMeta,
        evacuationEventId.isAcceptableOrUnknown(
          data['evacuation_event_id']!,
          _evacuationEventIdMeta,
        ),
      );
    }
    if (data.containsKey('evacuation_event_name')) {
      context.handle(
        _evacuationEventNameMeta,
        evacuationEventName.isAcceptableOrUnknown(
          data['evacuation_event_name']!,
          _evacuationEventNameMeta,
        ),
      );
    }
    if (data.containsKey('evacuation_center_id')) {
      context.handle(
        _evacuationCenterIdMeta,
        evacuationCenterId.isAcceptableOrUnknown(
          data['evacuation_center_id']!,
          _evacuationCenterIdMeta,
        ),
      );
    }
    if (data.containsKey('evacuation_center_name')) {
      context.handle(
        _evacuationCenterNameMeta,
        evacuationCenterName.isAcceptableOrUnknown(
          data['evacuation_center_name']!,
          _evacuationCenterNameMeta,
        ),
      );
    }
    if (data.containsKey('is4ps_beneficiary')) {
      context.handle(
        _is4psBeneficiaryMeta,
        is4psBeneficiary.isAcceptableOrUnknown(
          data['is4ps_beneficiary']!,
          _is4psBeneficiaryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_is4psBeneficiaryMeta);
    }
    if (data.containsKey('has_pwd_member')) {
      context.handle(
        _hasPwdMemberMeta,
        hasPwdMember.isAcceptableOrUnknown(
          data['has_pwd_member']!,
          _hasPwdMemberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hasPwdMemberMeta);
    }
    if (data.containsKey('has_senior_member')) {
      context.handle(
        _hasSeniorMemberMeta,
        hasSeniorMember.isAcceptableOrUnknown(
          data['has_senior_member']!,
          _hasSeniorMemberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hasSeniorMemberMeta);
    }
    if (data.containsKey('has_lactating_member')) {
      context.handle(
        _hasLactatingMemberMeta,
        hasLactatingMember.isAcceptableOrUnknown(
          data['has_lactating_member']!,
          _hasLactatingMemberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hasLactatingMemberMeta);
    }
    if (data.containsKey('member_count')) {
      context.handle(
        _memberCountMeta,
        memberCount.isAcceptableOrUnknown(
          data['member_count']!,
          _memberCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_memberCountMeta);
    }
    if (data.containsKey('head_of_family_evacuee_id')) {
      context.handle(
        _headOfFamilyEvacueeIdMeta,
        headOfFamilyEvacueeId.isAcceptableOrUnknown(
          data['head_of_family_evacuee_id']!,
          _headOfFamilyEvacueeIdMeta,
        ),
      );
    }
    if (data.containsKey('head_of_family_name')) {
      context.handle(
        _headOfFamilyNameMeta,
        headOfFamilyName.isAcceptableOrUnknown(
          data['head_of_family_name']!,
          _headOfFamilyNameMeta,
        ),
      );
    }
    if (data.containsKey('family_created_at')) {
      context.handle(
        _familyCreatedAtMeta,
        familyCreatedAt.isAcceptableOrUnknown(
          data['family_created_at']!,
          _familyCreatedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedFamily map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedFamily(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      barangayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}barangay_id'],
      )!,
      barangayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barangay_name'],
      )!,
      homeAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_address'],
      ),
      evacuationEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}evacuation_event_id'],
      ),
      evacuationEventName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evacuation_event_name'],
      ),
      evacuationCenterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}evacuation_center_id'],
      ),
      evacuationCenterName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evacuation_center_name'],
      ),
      is4psBeneficiary: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is4ps_beneficiary'],
      )!,
      hasPwdMember: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_pwd_member'],
      )!,
      hasSeniorMember: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_senior_member'],
      )!,
      hasLactatingMember: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_lactating_member'],
      )!,
      memberCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_count'],
      )!,
      headOfFamilyEvacueeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}head_of_family_evacuee_id'],
      ),
      headOfFamilyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}head_of_family_name'],
      ),
      familyCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}family_created_at'],
      ),
    );
  }

  @override
  $CachedFamiliesTable createAlias(String alias) {
    return $CachedFamiliesTable(attachedDatabase, alias);
  }
}

class CachedFamily extends DataClass implements Insertable<CachedFamily> {
  final int id;
  final int barangayId;
  final String barangayName;
  final String? homeAddress;
  final int? evacuationEventId;
  final String? evacuationEventName;
  final int? evacuationCenterId;
  final String? evacuationCenterName;
  final bool is4psBeneficiary;
  final bool hasPwdMember;
  final bool hasSeniorMember;
  final bool hasLactatingMember;
  final int memberCount;
  final int? headOfFamilyEvacueeId;
  final String? headOfFamilyName;
  final DateTime? familyCreatedAt;
  const CachedFamily({
    required this.id,
    required this.barangayId,
    required this.barangayName,
    this.homeAddress,
    this.evacuationEventId,
    this.evacuationEventName,
    this.evacuationCenterId,
    this.evacuationCenterName,
    required this.is4psBeneficiary,
    required this.hasPwdMember,
    required this.hasSeniorMember,
    required this.hasLactatingMember,
    required this.memberCount,
    this.headOfFamilyEvacueeId,
    this.headOfFamilyName,
    this.familyCreatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['barangay_id'] = Variable<int>(barangayId);
    map['barangay_name'] = Variable<String>(barangayName);
    if (!nullToAbsent || homeAddress != null) {
      map['home_address'] = Variable<String>(homeAddress);
    }
    if (!nullToAbsent || evacuationEventId != null) {
      map['evacuation_event_id'] = Variable<int>(evacuationEventId);
    }
    if (!nullToAbsent || evacuationEventName != null) {
      map['evacuation_event_name'] = Variable<String>(evacuationEventName);
    }
    if (!nullToAbsent || evacuationCenterId != null) {
      map['evacuation_center_id'] = Variable<int>(evacuationCenterId);
    }
    if (!nullToAbsent || evacuationCenterName != null) {
      map['evacuation_center_name'] = Variable<String>(evacuationCenterName);
    }
    map['is4ps_beneficiary'] = Variable<bool>(is4psBeneficiary);
    map['has_pwd_member'] = Variable<bool>(hasPwdMember);
    map['has_senior_member'] = Variable<bool>(hasSeniorMember);
    map['has_lactating_member'] = Variable<bool>(hasLactatingMember);
    map['member_count'] = Variable<int>(memberCount);
    if (!nullToAbsent || headOfFamilyEvacueeId != null) {
      map['head_of_family_evacuee_id'] = Variable<int>(headOfFamilyEvacueeId);
    }
    if (!nullToAbsent || headOfFamilyName != null) {
      map['head_of_family_name'] = Variable<String>(headOfFamilyName);
    }
    if (!nullToAbsent || familyCreatedAt != null) {
      map['family_created_at'] = Variable<DateTime>(familyCreatedAt);
    }
    return map;
  }

  CachedFamiliesCompanion toCompanion(bool nullToAbsent) {
    return CachedFamiliesCompanion(
      id: Value(id),
      barangayId: Value(barangayId),
      barangayName: Value(barangayName),
      homeAddress: homeAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(homeAddress),
      evacuationEventId: evacuationEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(evacuationEventId),
      evacuationEventName: evacuationEventName == null && nullToAbsent
          ? const Value.absent()
          : Value(evacuationEventName),
      evacuationCenterId: evacuationCenterId == null && nullToAbsent
          ? const Value.absent()
          : Value(evacuationCenterId),
      evacuationCenterName: evacuationCenterName == null && nullToAbsent
          ? const Value.absent()
          : Value(evacuationCenterName),
      is4psBeneficiary: Value(is4psBeneficiary),
      hasPwdMember: Value(hasPwdMember),
      hasSeniorMember: Value(hasSeniorMember),
      hasLactatingMember: Value(hasLactatingMember),
      memberCount: Value(memberCount),
      headOfFamilyEvacueeId: headOfFamilyEvacueeId == null && nullToAbsent
          ? const Value.absent()
          : Value(headOfFamilyEvacueeId),
      headOfFamilyName: headOfFamilyName == null && nullToAbsent
          ? const Value.absent()
          : Value(headOfFamilyName),
      familyCreatedAt: familyCreatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(familyCreatedAt),
    );
  }

  factory CachedFamily.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedFamily(
      id: serializer.fromJson<int>(json['id']),
      barangayId: serializer.fromJson<int>(json['barangayId']),
      barangayName: serializer.fromJson<String>(json['barangayName']),
      homeAddress: serializer.fromJson<String?>(json['homeAddress']),
      evacuationEventId: serializer.fromJson<int?>(json['evacuationEventId']),
      evacuationEventName: serializer.fromJson<String?>(
        json['evacuationEventName'],
      ),
      evacuationCenterId: serializer.fromJson<int?>(json['evacuationCenterId']),
      evacuationCenterName: serializer.fromJson<String?>(
        json['evacuationCenterName'],
      ),
      is4psBeneficiary: serializer.fromJson<bool>(json['is4psBeneficiary']),
      hasPwdMember: serializer.fromJson<bool>(json['hasPwdMember']),
      hasSeniorMember: serializer.fromJson<bool>(json['hasSeniorMember']),
      hasLactatingMember: serializer.fromJson<bool>(json['hasLactatingMember']),
      memberCount: serializer.fromJson<int>(json['memberCount']),
      headOfFamilyEvacueeId: serializer.fromJson<int?>(
        json['headOfFamilyEvacueeId'],
      ),
      headOfFamilyName: serializer.fromJson<String?>(json['headOfFamilyName']),
      familyCreatedAt: serializer.fromJson<DateTime?>(json['familyCreatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'barangayId': serializer.toJson<int>(barangayId),
      'barangayName': serializer.toJson<String>(barangayName),
      'homeAddress': serializer.toJson<String?>(homeAddress),
      'evacuationEventId': serializer.toJson<int?>(evacuationEventId),
      'evacuationEventName': serializer.toJson<String?>(evacuationEventName),
      'evacuationCenterId': serializer.toJson<int?>(evacuationCenterId),
      'evacuationCenterName': serializer.toJson<String?>(evacuationCenterName),
      'is4psBeneficiary': serializer.toJson<bool>(is4psBeneficiary),
      'hasPwdMember': serializer.toJson<bool>(hasPwdMember),
      'hasSeniorMember': serializer.toJson<bool>(hasSeniorMember),
      'hasLactatingMember': serializer.toJson<bool>(hasLactatingMember),
      'memberCount': serializer.toJson<int>(memberCount),
      'headOfFamilyEvacueeId': serializer.toJson<int?>(headOfFamilyEvacueeId),
      'headOfFamilyName': serializer.toJson<String?>(headOfFamilyName),
      'familyCreatedAt': serializer.toJson<DateTime?>(familyCreatedAt),
    };
  }

  CachedFamily copyWith({
    int? id,
    int? barangayId,
    String? barangayName,
    Value<String?> homeAddress = const Value.absent(),
    Value<int?> evacuationEventId = const Value.absent(),
    Value<String?> evacuationEventName = const Value.absent(),
    Value<int?> evacuationCenterId = const Value.absent(),
    Value<String?> evacuationCenterName = const Value.absent(),
    bool? is4psBeneficiary,
    bool? hasPwdMember,
    bool? hasSeniorMember,
    bool? hasLactatingMember,
    int? memberCount,
    Value<int?> headOfFamilyEvacueeId = const Value.absent(),
    Value<String?> headOfFamilyName = const Value.absent(),
    Value<DateTime?> familyCreatedAt = const Value.absent(),
  }) => CachedFamily(
    id: id ?? this.id,
    barangayId: barangayId ?? this.barangayId,
    barangayName: barangayName ?? this.barangayName,
    homeAddress: homeAddress.present ? homeAddress.value : this.homeAddress,
    evacuationEventId: evacuationEventId.present
        ? evacuationEventId.value
        : this.evacuationEventId,
    evacuationEventName: evacuationEventName.present
        ? evacuationEventName.value
        : this.evacuationEventName,
    evacuationCenterId: evacuationCenterId.present
        ? evacuationCenterId.value
        : this.evacuationCenterId,
    evacuationCenterName: evacuationCenterName.present
        ? evacuationCenterName.value
        : this.evacuationCenterName,
    is4psBeneficiary: is4psBeneficiary ?? this.is4psBeneficiary,
    hasPwdMember: hasPwdMember ?? this.hasPwdMember,
    hasSeniorMember: hasSeniorMember ?? this.hasSeniorMember,
    hasLactatingMember: hasLactatingMember ?? this.hasLactatingMember,
    memberCount: memberCount ?? this.memberCount,
    headOfFamilyEvacueeId: headOfFamilyEvacueeId.present
        ? headOfFamilyEvacueeId.value
        : this.headOfFamilyEvacueeId,
    headOfFamilyName: headOfFamilyName.present
        ? headOfFamilyName.value
        : this.headOfFamilyName,
    familyCreatedAt: familyCreatedAt.present
        ? familyCreatedAt.value
        : this.familyCreatedAt,
  );
  CachedFamily copyWithCompanion(CachedFamiliesCompanion data) {
    return CachedFamily(
      id: data.id.present ? data.id.value : this.id,
      barangayId: data.barangayId.present
          ? data.barangayId.value
          : this.barangayId,
      barangayName: data.barangayName.present
          ? data.barangayName.value
          : this.barangayName,
      homeAddress: data.homeAddress.present
          ? data.homeAddress.value
          : this.homeAddress,
      evacuationEventId: data.evacuationEventId.present
          ? data.evacuationEventId.value
          : this.evacuationEventId,
      evacuationEventName: data.evacuationEventName.present
          ? data.evacuationEventName.value
          : this.evacuationEventName,
      evacuationCenterId: data.evacuationCenterId.present
          ? data.evacuationCenterId.value
          : this.evacuationCenterId,
      evacuationCenterName: data.evacuationCenterName.present
          ? data.evacuationCenterName.value
          : this.evacuationCenterName,
      is4psBeneficiary: data.is4psBeneficiary.present
          ? data.is4psBeneficiary.value
          : this.is4psBeneficiary,
      hasPwdMember: data.hasPwdMember.present
          ? data.hasPwdMember.value
          : this.hasPwdMember,
      hasSeniorMember: data.hasSeniorMember.present
          ? data.hasSeniorMember.value
          : this.hasSeniorMember,
      hasLactatingMember: data.hasLactatingMember.present
          ? data.hasLactatingMember.value
          : this.hasLactatingMember,
      memberCount: data.memberCount.present
          ? data.memberCount.value
          : this.memberCount,
      headOfFamilyEvacueeId: data.headOfFamilyEvacueeId.present
          ? data.headOfFamilyEvacueeId.value
          : this.headOfFamilyEvacueeId,
      headOfFamilyName: data.headOfFamilyName.present
          ? data.headOfFamilyName.value
          : this.headOfFamilyName,
      familyCreatedAt: data.familyCreatedAt.present
          ? data.familyCreatedAt.value
          : this.familyCreatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedFamily(')
          ..write('id: $id, ')
          ..write('barangayId: $barangayId, ')
          ..write('barangayName: $barangayName, ')
          ..write('homeAddress: $homeAddress, ')
          ..write('evacuationEventId: $evacuationEventId, ')
          ..write('evacuationEventName: $evacuationEventName, ')
          ..write('evacuationCenterId: $evacuationCenterId, ')
          ..write('evacuationCenterName: $evacuationCenterName, ')
          ..write('is4psBeneficiary: $is4psBeneficiary, ')
          ..write('hasPwdMember: $hasPwdMember, ')
          ..write('hasSeniorMember: $hasSeniorMember, ')
          ..write('hasLactatingMember: $hasLactatingMember, ')
          ..write('memberCount: $memberCount, ')
          ..write('headOfFamilyEvacueeId: $headOfFamilyEvacueeId, ')
          ..write('headOfFamilyName: $headOfFamilyName, ')
          ..write('familyCreatedAt: $familyCreatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    barangayId,
    barangayName,
    homeAddress,
    evacuationEventId,
    evacuationEventName,
    evacuationCenterId,
    evacuationCenterName,
    is4psBeneficiary,
    hasPwdMember,
    hasSeniorMember,
    hasLactatingMember,
    memberCount,
    headOfFamilyEvacueeId,
    headOfFamilyName,
    familyCreatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedFamily &&
          other.id == this.id &&
          other.barangayId == this.barangayId &&
          other.barangayName == this.barangayName &&
          other.homeAddress == this.homeAddress &&
          other.evacuationEventId == this.evacuationEventId &&
          other.evacuationEventName == this.evacuationEventName &&
          other.evacuationCenterId == this.evacuationCenterId &&
          other.evacuationCenterName == this.evacuationCenterName &&
          other.is4psBeneficiary == this.is4psBeneficiary &&
          other.hasPwdMember == this.hasPwdMember &&
          other.hasSeniorMember == this.hasSeniorMember &&
          other.hasLactatingMember == this.hasLactatingMember &&
          other.memberCount == this.memberCount &&
          other.headOfFamilyEvacueeId == this.headOfFamilyEvacueeId &&
          other.headOfFamilyName == this.headOfFamilyName &&
          other.familyCreatedAt == this.familyCreatedAt);
}

class CachedFamiliesCompanion extends UpdateCompanion<CachedFamily> {
  final Value<int> id;
  final Value<int> barangayId;
  final Value<String> barangayName;
  final Value<String?> homeAddress;
  final Value<int?> evacuationEventId;
  final Value<String?> evacuationEventName;
  final Value<int?> evacuationCenterId;
  final Value<String?> evacuationCenterName;
  final Value<bool> is4psBeneficiary;
  final Value<bool> hasPwdMember;
  final Value<bool> hasSeniorMember;
  final Value<bool> hasLactatingMember;
  final Value<int> memberCount;
  final Value<int?> headOfFamilyEvacueeId;
  final Value<String?> headOfFamilyName;
  final Value<DateTime?> familyCreatedAt;
  const CachedFamiliesCompanion({
    this.id = const Value.absent(),
    this.barangayId = const Value.absent(),
    this.barangayName = const Value.absent(),
    this.homeAddress = const Value.absent(),
    this.evacuationEventId = const Value.absent(),
    this.evacuationEventName = const Value.absent(),
    this.evacuationCenterId = const Value.absent(),
    this.evacuationCenterName = const Value.absent(),
    this.is4psBeneficiary = const Value.absent(),
    this.hasPwdMember = const Value.absent(),
    this.hasSeniorMember = const Value.absent(),
    this.hasLactatingMember = const Value.absent(),
    this.memberCount = const Value.absent(),
    this.headOfFamilyEvacueeId = const Value.absent(),
    this.headOfFamilyName = const Value.absent(),
    this.familyCreatedAt = const Value.absent(),
  });
  CachedFamiliesCompanion.insert({
    this.id = const Value.absent(),
    required int barangayId,
    required String barangayName,
    this.homeAddress = const Value.absent(),
    this.evacuationEventId = const Value.absent(),
    this.evacuationEventName = const Value.absent(),
    this.evacuationCenterId = const Value.absent(),
    this.evacuationCenterName = const Value.absent(),
    required bool is4psBeneficiary,
    required bool hasPwdMember,
    required bool hasSeniorMember,
    required bool hasLactatingMember,
    required int memberCount,
    this.headOfFamilyEvacueeId = const Value.absent(),
    this.headOfFamilyName = const Value.absent(),
    this.familyCreatedAt = const Value.absent(),
  }) : barangayId = Value(barangayId),
       barangayName = Value(barangayName),
       is4psBeneficiary = Value(is4psBeneficiary),
       hasPwdMember = Value(hasPwdMember),
       hasSeniorMember = Value(hasSeniorMember),
       hasLactatingMember = Value(hasLactatingMember),
       memberCount = Value(memberCount);
  static Insertable<CachedFamily> custom({
    Expression<int>? id,
    Expression<int>? barangayId,
    Expression<String>? barangayName,
    Expression<String>? homeAddress,
    Expression<int>? evacuationEventId,
    Expression<String>? evacuationEventName,
    Expression<int>? evacuationCenterId,
    Expression<String>? evacuationCenterName,
    Expression<bool>? is4psBeneficiary,
    Expression<bool>? hasPwdMember,
    Expression<bool>? hasSeniorMember,
    Expression<bool>? hasLactatingMember,
    Expression<int>? memberCount,
    Expression<int>? headOfFamilyEvacueeId,
    Expression<String>? headOfFamilyName,
    Expression<DateTime>? familyCreatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (barangayId != null) 'barangay_id': barangayId,
      if (barangayName != null) 'barangay_name': barangayName,
      if (homeAddress != null) 'home_address': homeAddress,
      if (evacuationEventId != null) 'evacuation_event_id': evacuationEventId,
      if (evacuationEventName != null)
        'evacuation_event_name': evacuationEventName,
      if (evacuationCenterId != null)
        'evacuation_center_id': evacuationCenterId,
      if (evacuationCenterName != null)
        'evacuation_center_name': evacuationCenterName,
      if (is4psBeneficiary != null) 'is4ps_beneficiary': is4psBeneficiary,
      if (hasPwdMember != null) 'has_pwd_member': hasPwdMember,
      if (hasSeniorMember != null) 'has_senior_member': hasSeniorMember,
      if (hasLactatingMember != null)
        'has_lactating_member': hasLactatingMember,
      if (memberCount != null) 'member_count': memberCount,
      if (headOfFamilyEvacueeId != null)
        'head_of_family_evacuee_id': headOfFamilyEvacueeId,
      if (headOfFamilyName != null) 'head_of_family_name': headOfFamilyName,
      if (familyCreatedAt != null) 'family_created_at': familyCreatedAt,
    });
  }

  CachedFamiliesCompanion copyWith({
    Value<int>? id,
    Value<int>? barangayId,
    Value<String>? barangayName,
    Value<String?>? homeAddress,
    Value<int?>? evacuationEventId,
    Value<String?>? evacuationEventName,
    Value<int?>? evacuationCenterId,
    Value<String?>? evacuationCenterName,
    Value<bool>? is4psBeneficiary,
    Value<bool>? hasPwdMember,
    Value<bool>? hasSeniorMember,
    Value<bool>? hasLactatingMember,
    Value<int>? memberCount,
    Value<int?>? headOfFamilyEvacueeId,
    Value<String?>? headOfFamilyName,
    Value<DateTime?>? familyCreatedAt,
  }) {
    return CachedFamiliesCompanion(
      id: id ?? this.id,
      barangayId: barangayId ?? this.barangayId,
      barangayName: barangayName ?? this.barangayName,
      homeAddress: homeAddress ?? this.homeAddress,
      evacuationEventId: evacuationEventId ?? this.evacuationEventId,
      evacuationEventName: evacuationEventName ?? this.evacuationEventName,
      evacuationCenterId: evacuationCenterId ?? this.evacuationCenterId,
      evacuationCenterName: evacuationCenterName ?? this.evacuationCenterName,
      is4psBeneficiary: is4psBeneficiary ?? this.is4psBeneficiary,
      hasPwdMember: hasPwdMember ?? this.hasPwdMember,
      hasSeniorMember: hasSeniorMember ?? this.hasSeniorMember,
      hasLactatingMember: hasLactatingMember ?? this.hasLactatingMember,
      memberCount: memberCount ?? this.memberCount,
      headOfFamilyEvacueeId:
          headOfFamilyEvacueeId ?? this.headOfFamilyEvacueeId,
      headOfFamilyName: headOfFamilyName ?? this.headOfFamilyName,
      familyCreatedAt: familyCreatedAt ?? this.familyCreatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (barangayId.present) {
      map['barangay_id'] = Variable<int>(barangayId.value);
    }
    if (barangayName.present) {
      map['barangay_name'] = Variable<String>(barangayName.value);
    }
    if (homeAddress.present) {
      map['home_address'] = Variable<String>(homeAddress.value);
    }
    if (evacuationEventId.present) {
      map['evacuation_event_id'] = Variable<int>(evacuationEventId.value);
    }
    if (evacuationEventName.present) {
      map['evacuation_event_name'] = Variable<String>(
        evacuationEventName.value,
      );
    }
    if (evacuationCenterId.present) {
      map['evacuation_center_id'] = Variable<int>(evacuationCenterId.value);
    }
    if (evacuationCenterName.present) {
      map['evacuation_center_name'] = Variable<String>(
        evacuationCenterName.value,
      );
    }
    if (is4psBeneficiary.present) {
      map['is4ps_beneficiary'] = Variable<bool>(is4psBeneficiary.value);
    }
    if (hasPwdMember.present) {
      map['has_pwd_member'] = Variable<bool>(hasPwdMember.value);
    }
    if (hasSeniorMember.present) {
      map['has_senior_member'] = Variable<bool>(hasSeniorMember.value);
    }
    if (hasLactatingMember.present) {
      map['has_lactating_member'] = Variable<bool>(hasLactatingMember.value);
    }
    if (memberCount.present) {
      map['member_count'] = Variable<int>(memberCount.value);
    }
    if (headOfFamilyEvacueeId.present) {
      map['head_of_family_evacuee_id'] = Variable<int>(
        headOfFamilyEvacueeId.value,
      );
    }
    if (headOfFamilyName.present) {
      map['head_of_family_name'] = Variable<String>(headOfFamilyName.value);
    }
    if (familyCreatedAt.present) {
      map['family_created_at'] = Variable<DateTime>(familyCreatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedFamiliesCompanion(')
          ..write('id: $id, ')
          ..write('barangayId: $barangayId, ')
          ..write('barangayName: $barangayName, ')
          ..write('homeAddress: $homeAddress, ')
          ..write('evacuationEventId: $evacuationEventId, ')
          ..write('evacuationEventName: $evacuationEventName, ')
          ..write('evacuationCenterId: $evacuationCenterId, ')
          ..write('evacuationCenterName: $evacuationCenterName, ')
          ..write('is4psBeneficiary: $is4psBeneficiary, ')
          ..write('hasPwdMember: $hasPwdMember, ')
          ..write('hasSeniorMember: $hasSeniorMember, ')
          ..write('hasLactatingMember: $hasLactatingMember, ')
          ..write('memberCount: $memberCount, ')
          ..write('headOfFamilyEvacueeId: $headOfFamilyEvacueeId, ')
          ..write('headOfFamilyName: $headOfFamilyName, ')
          ..write('familyCreatedAt: $familyCreatedAt')
          ..write(')'))
        .toString();
  }
}

class $CachedEvacueesTable extends CachedEvacuees
    with TableInfo<$CachedEvacueesTable, CachedEvacuee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedEvacueesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _familyIdMeta = const VerificationMeta(
    'familyId',
  );
  @override
  late final GeneratedColumn<int> familyId = GeneratedColumn<int>(
    'family_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _middleNameMeta = const VerificationMeta(
    'middleName',
  );
  @override
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
    'middle_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _suffixMeta = const VerificationMeta('suffix');
  @override
  late final GeneratedColumn<String> suffix = GeneratedColumn<String>(
    'suffix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _civilStatusMeta = const VerificationMeta(
    'civilStatus',
  );
  @override
  late final GeneratedColumn<String> civilStatus = GeneratedColumn<String>(
    'civil_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactNumberMeta = const VerificationMeta(
    'contactNumber',
  );
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
    'contact_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPwdMeta = const VerificationMeta('isPwd');
  @override
  late final GeneratedColumn<bool> isPwd = GeneratedColumn<bool>(
    'is_pwd',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pwd" IN (0, 1))',
    ),
  );
  static const VerificationMeta _pwdTypeMeta = const VerificationMeta(
    'pwdType',
  );
  @override
  late final GeneratedColumn<String> pwdType = GeneratedColumn<String>(
    'pwd_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPregnantMeta = const VerificationMeta(
    'isPregnant',
  );
  @override
  late final GeneratedColumn<bool> isPregnant = GeneratedColumn<bool>(
    'is_pregnant',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pregnant" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isLactatingMeta = const VerificationMeta(
    'isLactating',
  );
  @override
  late final GeneratedColumn<bool> isLactating = GeneratedColumn<bool>(
    'is_lactating',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_lactating" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isSoloParentMeta = const VerificationMeta(
    'isSoloParent',
  );
  @override
  late final GeneratedColumn<bool> isSoloParent = GeneratedColumn<bool>(
    'is_solo_parent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_solo_parent" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isIndigenousPersonMeta =
      const VerificationMeta('isIndigenousPerson');
  @override
  late final GeneratedColumn<bool> isIndigenousPerson = GeneratedColumn<bool>(
    'is_indigenous_person',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_indigenous_person" IN (0, 1))',
    ),
  );
  static const VerificationMeta _is4psBeneficiaryMeta = const VerificationMeta(
    'is4psBeneficiary',
  );
  @override
  late final GeneratedColumn<bool> is4psBeneficiary = GeneratedColumn<bool>(
    'is4ps_beneficiary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is4ps_beneficiary" IN (0, 1))',
    ),
  );
  static const VerificationMeta _barangayNameMeta = const VerificationMeta(
    'barangayName',
  );
  @override
  late final GeneratedColumn<String> barangayName = GeneratedColumn<String>(
    'barangay_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    familyId,
    fullName,
    firstName,
    middleName,
    lastName,
    suffix,
    sex,
    dateOfBirth,
    civilStatus,
    contactNumber,
    isPwd,
    pwdType,
    isPregnant,
    isLactating,
    isSoloParent,
    isIndigenousPerson,
    is4psBeneficiary,
    barangayName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_evacuees';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedEvacuee> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('family_id')) {
      context.handle(
        _familyIdMeta,
        familyId.isAcceptableOrUnknown(data['family_id']!, _familyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_familyIdMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('middle_name')) {
      context.handle(
        _middleNameMeta,
        middleName.isAcceptableOrUnknown(data['middle_name']!, _middleNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('suffix')) {
      context.handle(
        _suffixMeta,
        suffix.isAcceptableOrUnknown(data['suffix']!, _suffixMeta),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('civil_status')) {
      context.handle(
        _civilStatusMeta,
        civilStatus.isAcceptableOrUnknown(
          data['civil_status']!,
          _civilStatusMeta,
        ),
      );
    }
    if (data.containsKey('contact_number')) {
      context.handle(
        _contactNumberMeta,
        contactNumber.isAcceptableOrUnknown(
          data['contact_number']!,
          _contactNumberMeta,
        ),
      );
    }
    if (data.containsKey('is_pwd')) {
      context.handle(
        _isPwdMeta,
        isPwd.isAcceptableOrUnknown(data['is_pwd']!, _isPwdMeta),
      );
    } else if (isInserting) {
      context.missing(_isPwdMeta);
    }
    if (data.containsKey('pwd_type')) {
      context.handle(
        _pwdTypeMeta,
        pwdType.isAcceptableOrUnknown(data['pwd_type']!, _pwdTypeMeta),
      );
    }
    if (data.containsKey('is_pregnant')) {
      context.handle(
        _isPregnantMeta,
        isPregnant.isAcceptableOrUnknown(data['is_pregnant']!, _isPregnantMeta),
      );
    } else if (isInserting) {
      context.missing(_isPregnantMeta);
    }
    if (data.containsKey('is_lactating')) {
      context.handle(
        _isLactatingMeta,
        isLactating.isAcceptableOrUnknown(
          data['is_lactating']!,
          _isLactatingMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isLactatingMeta);
    }
    if (data.containsKey('is_solo_parent')) {
      context.handle(
        _isSoloParentMeta,
        isSoloParent.isAcceptableOrUnknown(
          data['is_solo_parent']!,
          _isSoloParentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isSoloParentMeta);
    }
    if (data.containsKey('is_indigenous_person')) {
      context.handle(
        _isIndigenousPersonMeta,
        isIndigenousPerson.isAcceptableOrUnknown(
          data['is_indigenous_person']!,
          _isIndigenousPersonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isIndigenousPersonMeta);
    }
    if (data.containsKey('is4ps_beneficiary')) {
      context.handle(
        _is4psBeneficiaryMeta,
        is4psBeneficiary.isAcceptableOrUnknown(
          data['is4ps_beneficiary']!,
          _is4psBeneficiaryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_is4psBeneficiaryMeta);
    }
    if (data.containsKey('barangay_name')) {
      context.handle(
        _barangayNameMeta,
        barangayName.isAcceptableOrUnknown(
          data['barangay_name']!,
          _barangayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_barangayNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedEvacuee map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedEvacuee(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      familyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}family_id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      middleName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}middle_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      suffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suffix'],
      ),
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_of_birth'],
      ),
      civilStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}civil_status'],
      ),
      contactNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_number'],
      ),
      isPwd: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pwd'],
      )!,
      pwdType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pwd_type'],
      ),
      isPregnant: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pregnant'],
      )!,
      isLactating: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_lactating'],
      )!,
      isSoloParent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_solo_parent'],
      )!,
      isIndigenousPerson: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_indigenous_person'],
      )!,
      is4psBeneficiary: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is4ps_beneficiary'],
      )!,
      barangayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barangay_name'],
      )!,
    );
  }

  @override
  $CachedEvacueesTable createAlias(String alias) {
    return $CachedEvacueesTable(attachedDatabase, alias);
  }
}

class CachedEvacuee extends DataClass implements Insertable<CachedEvacuee> {
  final int id;
  final int familyId;
  final String fullName;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? suffix;
  final String sex;
  final DateTime? dateOfBirth;
  final String? civilStatus;
  final String? contactNumber;
  final bool isPwd;
  final String? pwdType;
  final bool isPregnant;
  final bool isLactating;
  final bool isSoloParent;
  final bool isIndigenousPerson;
  final bool is4psBeneficiary;
  final String barangayName;
  const CachedEvacuee({
    required this.id,
    required this.familyId,
    required this.fullName,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.suffix,
    required this.sex,
    this.dateOfBirth,
    this.civilStatus,
    this.contactNumber,
    required this.isPwd,
    this.pwdType,
    required this.isPregnant,
    required this.isLactating,
    required this.isSoloParent,
    required this.isIndigenousPerson,
    required this.is4psBeneficiary,
    required this.barangayName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['family_id'] = Variable<int>(familyId);
    map['full_name'] = Variable<String>(fullName);
    map['first_name'] = Variable<String>(firstName);
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = Variable<String>(middleName);
    }
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || suffix != null) {
      map['suffix'] = Variable<String>(suffix);
    }
    map['sex'] = Variable<String>(sex);
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || civilStatus != null) {
      map['civil_status'] = Variable<String>(civilStatus);
    }
    if (!nullToAbsent || contactNumber != null) {
      map['contact_number'] = Variable<String>(contactNumber);
    }
    map['is_pwd'] = Variable<bool>(isPwd);
    if (!nullToAbsent || pwdType != null) {
      map['pwd_type'] = Variable<String>(pwdType);
    }
    map['is_pregnant'] = Variable<bool>(isPregnant);
    map['is_lactating'] = Variable<bool>(isLactating);
    map['is_solo_parent'] = Variable<bool>(isSoloParent);
    map['is_indigenous_person'] = Variable<bool>(isIndigenousPerson);
    map['is4ps_beneficiary'] = Variable<bool>(is4psBeneficiary);
    map['barangay_name'] = Variable<String>(barangayName);
    return map;
  }

  CachedEvacueesCompanion toCompanion(bool nullToAbsent) {
    return CachedEvacueesCompanion(
      id: Value(id),
      familyId: Value(familyId),
      fullName: Value(fullName),
      firstName: Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      lastName: Value(lastName),
      suffix: suffix == null && nullToAbsent
          ? const Value.absent()
          : Value(suffix),
      sex: Value(sex),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      civilStatus: civilStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(civilStatus),
      contactNumber: contactNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(contactNumber),
      isPwd: Value(isPwd),
      pwdType: pwdType == null && nullToAbsent
          ? const Value.absent()
          : Value(pwdType),
      isPregnant: Value(isPregnant),
      isLactating: Value(isLactating),
      isSoloParent: Value(isSoloParent),
      isIndigenousPerson: Value(isIndigenousPerson),
      is4psBeneficiary: Value(is4psBeneficiary),
      barangayName: Value(barangayName),
    );
  }

  factory CachedEvacuee.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedEvacuee(
      id: serializer.fromJson<int>(json['id']),
      familyId: serializer.fromJson<int>(json['familyId']),
      fullName: serializer.fromJson<String>(json['fullName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String?>(json['middleName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      suffix: serializer.fromJson<String?>(json['suffix']),
      sex: serializer.fromJson<String>(json['sex']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      civilStatus: serializer.fromJson<String?>(json['civilStatus']),
      contactNumber: serializer.fromJson<String?>(json['contactNumber']),
      isPwd: serializer.fromJson<bool>(json['isPwd']),
      pwdType: serializer.fromJson<String?>(json['pwdType']),
      isPregnant: serializer.fromJson<bool>(json['isPregnant']),
      isLactating: serializer.fromJson<bool>(json['isLactating']),
      isSoloParent: serializer.fromJson<bool>(json['isSoloParent']),
      isIndigenousPerson: serializer.fromJson<bool>(json['isIndigenousPerson']),
      is4psBeneficiary: serializer.fromJson<bool>(json['is4psBeneficiary']),
      barangayName: serializer.fromJson<String>(json['barangayName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'familyId': serializer.toJson<int>(familyId),
      'fullName': serializer.toJson<String>(fullName),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String?>(middleName),
      'lastName': serializer.toJson<String>(lastName),
      'suffix': serializer.toJson<String?>(suffix),
      'sex': serializer.toJson<String>(sex),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'civilStatus': serializer.toJson<String?>(civilStatus),
      'contactNumber': serializer.toJson<String?>(contactNumber),
      'isPwd': serializer.toJson<bool>(isPwd),
      'pwdType': serializer.toJson<String?>(pwdType),
      'isPregnant': serializer.toJson<bool>(isPregnant),
      'isLactating': serializer.toJson<bool>(isLactating),
      'isSoloParent': serializer.toJson<bool>(isSoloParent),
      'isIndigenousPerson': serializer.toJson<bool>(isIndigenousPerson),
      'is4psBeneficiary': serializer.toJson<bool>(is4psBeneficiary),
      'barangayName': serializer.toJson<String>(barangayName),
    };
  }

  CachedEvacuee copyWith({
    int? id,
    int? familyId,
    String? fullName,
    String? firstName,
    Value<String?> middleName = const Value.absent(),
    String? lastName,
    Value<String?> suffix = const Value.absent(),
    String? sex,
    Value<DateTime?> dateOfBirth = const Value.absent(),
    Value<String?> civilStatus = const Value.absent(),
    Value<String?> contactNumber = const Value.absent(),
    bool? isPwd,
    Value<String?> pwdType = const Value.absent(),
    bool? isPregnant,
    bool? isLactating,
    bool? isSoloParent,
    bool? isIndigenousPerson,
    bool? is4psBeneficiary,
    String? barangayName,
  }) => CachedEvacuee(
    id: id ?? this.id,
    familyId: familyId ?? this.familyId,
    fullName: fullName ?? this.fullName,
    firstName: firstName ?? this.firstName,
    middleName: middleName.present ? middleName.value : this.middleName,
    lastName: lastName ?? this.lastName,
    suffix: suffix.present ? suffix.value : this.suffix,
    sex: sex ?? this.sex,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    civilStatus: civilStatus.present ? civilStatus.value : this.civilStatus,
    contactNumber: contactNumber.present
        ? contactNumber.value
        : this.contactNumber,
    isPwd: isPwd ?? this.isPwd,
    pwdType: pwdType.present ? pwdType.value : this.pwdType,
    isPregnant: isPregnant ?? this.isPregnant,
    isLactating: isLactating ?? this.isLactating,
    isSoloParent: isSoloParent ?? this.isSoloParent,
    isIndigenousPerson: isIndigenousPerson ?? this.isIndigenousPerson,
    is4psBeneficiary: is4psBeneficiary ?? this.is4psBeneficiary,
    barangayName: barangayName ?? this.barangayName,
  );
  CachedEvacuee copyWithCompanion(CachedEvacueesCompanion data) {
    return CachedEvacuee(
      id: data.id.present ? data.id.value : this.id,
      familyId: data.familyId.present ? data.familyId.value : this.familyId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName: data.middleName.present
          ? data.middleName.value
          : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      suffix: data.suffix.present ? data.suffix.value : this.suffix,
      sex: data.sex.present ? data.sex.value : this.sex,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      civilStatus: data.civilStatus.present
          ? data.civilStatus.value
          : this.civilStatus,
      contactNumber: data.contactNumber.present
          ? data.contactNumber.value
          : this.contactNumber,
      isPwd: data.isPwd.present ? data.isPwd.value : this.isPwd,
      pwdType: data.pwdType.present ? data.pwdType.value : this.pwdType,
      isPregnant: data.isPregnant.present
          ? data.isPregnant.value
          : this.isPregnant,
      isLactating: data.isLactating.present
          ? data.isLactating.value
          : this.isLactating,
      isSoloParent: data.isSoloParent.present
          ? data.isSoloParent.value
          : this.isSoloParent,
      isIndigenousPerson: data.isIndigenousPerson.present
          ? data.isIndigenousPerson.value
          : this.isIndigenousPerson,
      is4psBeneficiary: data.is4psBeneficiary.present
          ? data.is4psBeneficiary.value
          : this.is4psBeneficiary,
      barangayName: data.barangayName.present
          ? data.barangayName.value
          : this.barangayName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedEvacuee(')
          ..write('id: $id, ')
          ..write('familyId: $familyId, ')
          ..write('fullName: $fullName, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('suffix: $suffix, ')
          ..write('sex: $sex, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('isPwd: $isPwd, ')
          ..write('pwdType: $pwdType, ')
          ..write('isPregnant: $isPregnant, ')
          ..write('isLactating: $isLactating, ')
          ..write('isSoloParent: $isSoloParent, ')
          ..write('isIndigenousPerson: $isIndigenousPerson, ')
          ..write('is4psBeneficiary: $is4psBeneficiary, ')
          ..write('barangayName: $barangayName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    familyId,
    fullName,
    firstName,
    middleName,
    lastName,
    suffix,
    sex,
    dateOfBirth,
    civilStatus,
    contactNumber,
    isPwd,
    pwdType,
    isPregnant,
    isLactating,
    isSoloParent,
    isIndigenousPerson,
    is4psBeneficiary,
    barangayName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedEvacuee &&
          other.id == this.id &&
          other.familyId == this.familyId &&
          other.fullName == this.fullName &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.suffix == this.suffix &&
          other.sex == this.sex &&
          other.dateOfBirth == this.dateOfBirth &&
          other.civilStatus == this.civilStatus &&
          other.contactNumber == this.contactNumber &&
          other.isPwd == this.isPwd &&
          other.pwdType == this.pwdType &&
          other.isPregnant == this.isPregnant &&
          other.isLactating == this.isLactating &&
          other.isSoloParent == this.isSoloParent &&
          other.isIndigenousPerson == this.isIndigenousPerson &&
          other.is4psBeneficiary == this.is4psBeneficiary &&
          other.barangayName == this.barangayName);
}

class CachedEvacueesCompanion extends UpdateCompanion<CachedEvacuee> {
  final Value<int> id;
  final Value<int> familyId;
  final Value<String> fullName;
  final Value<String> firstName;
  final Value<String?> middleName;
  final Value<String> lastName;
  final Value<String?> suffix;
  final Value<String> sex;
  final Value<DateTime?> dateOfBirth;
  final Value<String?> civilStatus;
  final Value<String?> contactNumber;
  final Value<bool> isPwd;
  final Value<String?> pwdType;
  final Value<bool> isPregnant;
  final Value<bool> isLactating;
  final Value<bool> isSoloParent;
  final Value<bool> isIndigenousPerson;
  final Value<bool> is4psBeneficiary;
  final Value<String> barangayName;
  const CachedEvacueesCompanion({
    this.id = const Value.absent(),
    this.familyId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.suffix = const Value.absent(),
    this.sex = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.civilStatus = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.isPwd = const Value.absent(),
    this.pwdType = const Value.absent(),
    this.isPregnant = const Value.absent(),
    this.isLactating = const Value.absent(),
    this.isSoloParent = const Value.absent(),
    this.isIndigenousPerson = const Value.absent(),
    this.is4psBeneficiary = const Value.absent(),
    this.barangayName = const Value.absent(),
  });
  CachedEvacueesCompanion.insert({
    this.id = const Value.absent(),
    required int familyId,
    required String fullName,
    required String firstName,
    this.middleName = const Value.absent(),
    required String lastName,
    this.suffix = const Value.absent(),
    required String sex,
    this.dateOfBirth = const Value.absent(),
    this.civilStatus = const Value.absent(),
    this.contactNumber = const Value.absent(),
    required bool isPwd,
    this.pwdType = const Value.absent(),
    required bool isPregnant,
    required bool isLactating,
    required bool isSoloParent,
    required bool isIndigenousPerson,
    required bool is4psBeneficiary,
    required String barangayName,
  }) : familyId = Value(familyId),
       fullName = Value(fullName),
       firstName = Value(firstName),
       lastName = Value(lastName),
       sex = Value(sex),
       isPwd = Value(isPwd),
       isPregnant = Value(isPregnant),
       isLactating = Value(isLactating),
       isSoloParent = Value(isSoloParent),
       isIndigenousPerson = Value(isIndigenousPerson),
       is4psBeneficiary = Value(is4psBeneficiary),
       barangayName = Value(barangayName);
  static Insertable<CachedEvacuee> custom({
    Expression<int>? id,
    Expression<int>? familyId,
    Expression<String>? fullName,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<String>? lastName,
    Expression<String>? suffix,
    Expression<String>? sex,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? civilStatus,
    Expression<String>? contactNumber,
    Expression<bool>? isPwd,
    Expression<String>? pwdType,
    Expression<bool>? isPregnant,
    Expression<bool>? isLactating,
    Expression<bool>? isSoloParent,
    Expression<bool>? isIndigenousPerson,
    Expression<bool>? is4psBeneficiary,
    Expression<String>? barangayName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (familyId != null) 'family_id': familyId,
      if (fullName != null) 'full_name': fullName,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (lastName != null) 'last_name': lastName,
      if (suffix != null) 'suffix': suffix,
      if (sex != null) 'sex': sex,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (civilStatus != null) 'civil_status': civilStatus,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (isPwd != null) 'is_pwd': isPwd,
      if (pwdType != null) 'pwd_type': pwdType,
      if (isPregnant != null) 'is_pregnant': isPregnant,
      if (isLactating != null) 'is_lactating': isLactating,
      if (isSoloParent != null) 'is_solo_parent': isSoloParent,
      if (isIndigenousPerson != null)
        'is_indigenous_person': isIndigenousPerson,
      if (is4psBeneficiary != null) 'is4ps_beneficiary': is4psBeneficiary,
      if (barangayName != null) 'barangay_name': barangayName,
    });
  }

  CachedEvacueesCompanion copyWith({
    Value<int>? id,
    Value<int>? familyId,
    Value<String>? fullName,
    Value<String>? firstName,
    Value<String?>? middleName,
    Value<String>? lastName,
    Value<String?>? suffix,
    Value<String>? sex,
    Value<DateTime?>? dateOfBirth,
    Value<String?>? civilStatus,
    Value<String?>? contactNumber,
    Value<bool>? isPwd,
    Value<String?>? pwdType,
    Value<bool>? isPregnant,
    Value<bool>? isLactating,
    Value<bool>? isSoloParent,
    Value<bool>? isIndigenousPerson,
    Value<bool>? is4psBeneficiary,
    Value<String>? barangayName,
  }) {
    return CachedEvacueesCompanion(
      id: id ?? this.id,
      familyId: familyId ?? this.familyId,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      suffix: suffix ?? this.suffix,
      sex: sex ?? this.sex,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      civilStatus: civilStatus ?? this.civilStatus,
      contactNumber: contactNumber ?? this.contactNumber,
      isPwd: isPwd ?? this.isPwd,
      pwdType: pwdType ?? this.pwdType,
      isPregnant: isPregnant ?? this.isPregnant,
      isLactating: isLactating ?? this.isLactating,
      isSoloParent: isSoloParent ?? this.isSoloParent,
      isIndigenousPerson: isIndigenousPerson ?? this.isIndigenousPerson,
      is4psBeneficiary: is4psBeneficiary ?? this.is4psBeneficiary,
      barangayName: barangayName ?? this.barangayName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (familyId.present) {
      map['family_id'] = Variable<int>(familyId.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (suffix.present) {
      map['suffix'] = Variable<String>(suffix.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (civilStatus.present) {
      map['civil_status'] = Variable<String>(civilStatus.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (isPwd.present) {
      map['is_pwd'] = Variable<bool>(isPwd.value);
    }
    if (pwdType.present) {
      map['pwd_type'] = Variable<String>(pwdType.value);
    }
    if (isPregnant.present) {
      map['is_pregnant'] = Variable<bool>(isPregnant.value);
    }
    if (isLactating.present) {
      map['is_lactating'] = Variable<bool>(isLactating.value);
    }
    if (isSoloParent.present) {
      map['is_solo_parent'] = Variable<bool>(isSoloParent.value);
    }
    if (isIndigenousPerson.present) {
      map['is_indigenous_person'] = Variable<bool>(isIndigenousPerson.value);
    }
    if (is4psBeneficiary.present) {
      map['is4ps_beneficiary'] = Variable<bool>(is4psBeneficiary.value);
    }
    if (barangayName.present) {
      map['barangay_name'] = Variable<String>(barangayName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedEvacueesCompanion(')
          ..write('id: $id, ')
          ..write('familyId: $familyId, ')
          ..write('fullName: $fullName, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('suffix: $suffix, ')
          ..write('sex: $sex, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('isPwd: $isPwd, ')
          ..write('pwdType: $pwdType, ')
          ..write('isPregnant: $isPregnant, ')
          ..write('isLactating: $isLactating, ')
          ..write('isSoloParent: $isSoloParent, ')
          ..write('isIndigenousPerson: $isIndigenousPerson, ')
          ..write('is4psBeneficiary: $is4psBeneficiary, ')
          ..write('barangayName: $barangayName')
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
  late final $BarangaysTable barangays = $BarangaysTable(this);
  late final $EvacuationEventsTable evacuationEvents = $EvacuationEventsTable(
    this,
  );
  late final $PendingRegistrationsTable pendingRegistrations =
      $PendingRegistrationsTable(this);
  late final $CachedFamiliesTable cachedFamilies = $CachedFamiliesTable(this);
  late final $CachedEvacueesTable cachedEvacuees = $CachedEvacueesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    evacuationCenters,
    alerts,
    hazardAreas,
    barangays,
    evacuationEvents,
    pendingRegistrations,
    cachedFamilies,
    cachedEvacuees,
  ];
}

typedef $$EvacuationCentersTableCreateCompanionBuilder =
    EvacuationCentersCompanion Function({
      Value<int> id,
      required String name,
      required String type,
      required String address,
      Value<String?> barangay,
      Value<double?> latitude,
      Value<double?> longitude,
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
      Value<double?> latitude,
      Value<double?> longitude,
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
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
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
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
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
      Value<int?> eventId,
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
      Value<int?> eventId,
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

  ColumnFilters<int> get eventId => $composableBuilder(
    column: $table.eventId,
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

  ColumnOrderings<int> get eventId => $composableBuilder(
    column: $table.eventId,
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

  GeneratedColumn<int> get eventId =>
      $composableBuilder(column: $table.eventId, builder: (column) => column);

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
                Value<int?> eventId = const Value.absent(),
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
                eventId: eventId,
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
                Value<int?> eventId = const Value.absent(),
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
                eventId: eventId,
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
typedef $$BarangaysTableCreateCompanionBuilder =
    BarangaysCompanion Function({Value<int> id, required String name});
typedef $$BarangaysTableUpdateCompanionBuilder =
    BarangaysCompanion Function({Value<int> id, Value<String> name});

class $$BarangaysTableFilterComposer
    extends Composer<_$AppDatabase, $BarangaysTable> {
  $$BarangaysTableFilterComposer({
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
}

class $$BarangaysTableOrderingComposer
    extends Composer<_$AppDatabase, $BarangaysTable> {
  $$BarangaysTableOrderingComposer({
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
}

class $$BarangaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $BarangaysTable> {
  $$BarangaysTableAnnotationComposer({
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
}

class $$BarangaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BarangaysTable,
          Barangay,
          $$BarangaysTableFilterComposer,
          $$BarangaysTableOrderingComposer,
          $$BarangaysTableAnnotationComposer,
          $$BarangaysTableCreateCompanionBuilder,
          $$BarangaysTableUpdateCompanionBuilder,
          (Barangay, BaseReferences<_$AppDatabase, $BarangaysTable, Barangay>),
          Barangay,
          PrefetchHooks Function()
        > {
  $$BarangaysTableTableManager(_$AppDatabase db, $BarangaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BarangaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BarangaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BarangaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => BarangaysCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  BarangaysCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BarangaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BarangaysTable,
      Barangay,
      $$BarangaysTableFilterComposer,
      $$BarangaysTableOrderingComposer,
      $$BarangaysTableAnnotationComposer,
      $$BarangaysTableCreateCompanionBuilder,
      $$BarangaysTableUpdateCompanionBuilder,
      (Barangay, BaseReferences<_$AppDatabase, $BarangaysTable, Barangay>),
      Barangay,
      PrefetchHooks Function()
    >;
typedef $$EvacuationEventsTableCreateCompanionBuilder =
    EvacuationEventsCompanion Function({
      Value<int> id,
      required String name,
      required String status,
    });
typedef $$EvacuationEventsTableUpdateCompanionBuilder =
    EvacuationEventsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> status,
    });

class $$EvacuationEventsTableFilterComposer
    extends Composer<_$AppDatabase, $EvacuationEventsTable> {
  $$EvacuationEventsTableFilterComposer({
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EvacuationEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EvacuationEventsTable> {
  $$EvacuationEventsTableOrderingComposer({
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EvacuationEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EvacuationEventsTable> {
  $$EvacuationEventsTableAnnotationComposer({
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

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$EvacuationEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EvacuationEventsTable,
          EvacuationEvent,
          $$EvacuationEventsTableFilterComposer,
          $$EvacuationEventsTableOrderingComposer,
          $$EvacuationEventsTableAnnotationComposer,
          $$EvacuationEventsTableCreateCompanionBuilder,
          $$EvacuationEventsTableUpdateCompanionBuilder,
          (
            EvacuationEvent,
            BaseReferences<
              _$AppDatabase,
              $EvacuationEventsTable,
              EvacuationEvent
            >,
          ),
          EvacuationEvent,
          PrefetchHooks Function()
        > {
  $$EvacuationEventsTableTableManager(
    _$AppDatabase db,
    $EvacuationEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvacuationEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvacuationEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvacuationEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) =>
                  EvacuationEventsCompanion(id: id, name: name, status: status),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String status,
              }) => EvacuationEventsCompanion.insert(
                id: id,
                name: name,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EvacuationEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EvacuationEventsTable,
      EvacuationEvent,
      $$EvacuationEventsTableFilterComposer,
      $$EvacuationEventsTableOrderingComposer,
      $$EvacuationEventsTableAnnotationComposer,
      $$EvacuationEventsTableCreateCompanionBuilder,
      $$EvacuationEventsTableUpdateCompanionBuilder,
      (
        EvacuationEvent,
        BaseReferences<_$AppDatabase, $EvacuationEventsTable, EvacuationEvent>,
      ),
      EvacuationEvent,
      PrefetchHooks Function()
    >;
typedef $$PendingRegistrationsTableCreateCompanionBuilder =
    PendingRegistrationsCompanion Function({
      Value<int> id,
      required String payloadJson,
      required String headOfFamilyName,
      required String barangayName,
      required int memberCount,
      required DateTime createdAt,
      Value<bool> synced,
      Value<String?> syncError,
    });
typedef $$PendingRegistrationsTableUpdateCompanionBuilder =
    PendingRegistrationsCompanion Function({
      Value<int> id,
      Value<String> payloadJson,
      Value<String> headOfFamilyName,
      Value<String> barangayName,
      Value<int> memberCount,
      Value<DateTime> createdAt,
      Value<bool> synced,
      Value<String?> syncError,
    });

class $$PendingRegistrationsTableFilterComposer
    extends Composer<_$AppDatabase, $PendingRegistrationsTable> {
  $$PendingRegistrationsTableFilterComposer({
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

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get headOfFamilyName => $composableBuilder(
    column: $table.headOfFamilyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingRegistrationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingRegistrationsTable> {
  $$PendingRegistrationsTableOrderingComposer({
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

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get headOfFamilyName => $composableBuilder(
    column: $table.headOfFamilyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get synced => $composableBuilder(
    column: $table.synced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncError => $composableBuilder(
    column: $table.syncError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingRegistrationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingRegistrationsTable> {
  $$PendingRegistrationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get headOfFamilyName => $composableBuilder(
    column: $table.headOfFamilyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);

  GeneratedColumn<String> get syncError =>
      $composableBuilder(column: $table.syncError, builder: (column) => column);
}

class $$PendingRegistrationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingRegistrationsTable,
          PendingRegistration,
          $$PendingRegistrationsTableFilterComposer,
          $$PendingRegistrationsTableOrderingComposer,
          $$PendingRegistrationsTableAnnotationComposer,
          $$PendingRegistrationsTableCreateCompanionBuilder,
          $$PendingRegistrationsTableUpdateCompanionBuilder,
          (
            PendingRegistration,
            BaseReferences<
              _$AppDatabase,
              $PendingRegistrationsTable,
              PendingRegistration
            >,
          ),
          PendingRegistration,
          PrefetchHooks Function()
        > {
  $$PendingRegistrationsTableTableManager(
    _$AppDatabase db,
    $PendingRegistrationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingRegistrationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingRegistrationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PendingRegistrationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String> headOfFamilyName = const Value.absent(),
                Value<String> barangayName = const Value.absent(),
                Value<int> memberCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> synced = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
              }) => PendingRegistrationsCompanion(
                id: id,
                payloadJson: payloadJson,
                headOfFamilyName: headOfFamilyName,
                barangayName: barangayName,
                memberCount: memberCount,
                createdAt: createdAt,
                synced: synced,
                syncError: syncError,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String payloadJson,
                required String headOfFamilyName,
                required String barangayName,
                required int memberCount,
                required DateTime createdAt,
                Value<bool> synced = const Value.absent(),
                Value<String?> syncError = const Value.absent(),
              }) => PendingRegistrationsCompanion.insert(
                id: id,
                payloadJson: payloadJson,
                headOfFamilyName: headOfFamilyName,
                barangayName: barangayName,
                memberCount: memberCount,
                createdAt: createdAt,
                synced: synced,
                syncError: syncError,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingRegistrationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingRegistrationsTable,
      PendingRegistration,
      $$PendingRegistrationsTableFilterComposer,
      $$PendingRegistrationsTableOrderingComposer,
      $$PendingRegistrationsTableAnnotationComposer,
      $$PendingRegistrationsTableCreateCompanionBuilder,
      $$PendingRegistrationsTableUpdateCompanionBuilder,
      (
        PendingRegistration,
        BaseReferences<
          _$AppDatabase,
          $PendingRegistrationsTable,
          PendingRegistration
        >,
      ),
      PendingRegistration,
      PrefetchHooks Function()
    >;
typedef $$CachedFamiliesTableCreateCompanionBuilder =
    CachedFamiliesCompanion Function({
      Value<int> id,
      required int barangayId,
      required String barangayName,
      Value<String?> homeAddress,
      Value<int?> evacuationEventId,
      Value<String?> evacuationEventName,
      Value<int?> evacuationCenterId,
      Value<String?> evacuationCenterName,
      required bool is4psBeneficiary,
      required bool hasPwdMember,
      required bool hasSeniorMember,
      required bool hasLactatingMember,
      required int memberCount,
      Value<int?> headOfFamilyEvacueeId,
      Value<String?> headOfFamilyName,
      Value<DateTime?> familyCreatedAt,
    });
typedef $$CachedFamiliesTableUpdateCompanionBuilder =
    CachedFamiliesCompanion Function({
      Value<int> id,
      Value<int> barangayId,
      Value<String> barangayName,
      Value<String?> homeAddress,
      Value<int?> evacuationEventId,
      Value<String?> evacuationEventName,
      Value<int?> evacuationCenterId,
      Value<String?> evacuationCenterName,
      Value<bool> is4psBeneficiary,
      Value<bool> hasPwdMember,
      Value<bool> hasSeniorMember,
      Value<bool> hasLactatingMember,
      Value<int> memberCount,
      Value<int?> headOfFamilyEvacueeId,
      Value<String?> headOfFamilyName,
      Value<DateTime?> familyCreatedAt,
    });

class $$CachedFamiliesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedFamiliesTable> {
  $$CachedFamiliesTableFilterComposer({
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

  ColumnFilters<int> get barangayId => $composableBuilder(
    column: $table.barangayId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeAddress => $composableBuilder(
    column: $table.homeAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get evacuationEventId => $composableBuilder(
    column: $table.evacuationEventId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get evacuationEventName => $composableBuilder(
    column: $table.evacuationEventName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get evacuationCenterId => $composableBuilder(
    column: $table.evacuationCenterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get evacuationCenterName => $composableBuilder(
    column: $table.evacuationCenterName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get is4psBeneficiary => $composableBuilder(
    column: $table.is4psBeneficiary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasPwdMember => $composableBuilder(
    column: $table.hasPwdMember,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasSeniorMember => $composableBuilder(
    column: $table.hasSeniorMember,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasLactatingMember => $composableBuilder(
    column: $table.hasLactatingMember,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get headOfFamilyEvacueeId => $composableBuilder(
    column: $table.headOfFamilyEvacueeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get headOfFamilyName => $composableBuilder(
    column: $table.headOfFamilyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get familyCreatedAt => $composableBuilder(
    column: $table.familyCreatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedFamiliesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedFamiliesTable> {
  $$CachedFamiliesTableOrderingComposer({
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

  ColumnOrderings<int> get barangayId => $composableBuilder(
    column: $table.barangayId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeAddress => $composableBuilder(
    column: $table.homeAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get evacuationEventId => $composableBuilder(
    column: $table.evacuationEventId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get evacuationEventName => $composableBuilder(
    column: $table.evacuationEventName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get evacuationCenterId => $composableBuilder(
    column: $table.evacuationCenterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get evacuationCenterName => $composableBuilder(
    column: $table.evacuationCenterName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get is4psBeneficiary => $composableBuilder(
    column: $table.is4psBeneficiary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasPwdMember => $composableBuilder(
    column: $table.hasPwdMember,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasSeniorMember => $composableBuilder(
    column: $table.hasSeniorMember,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasLactatingMember => $composableBuilder(
    column: $table.hasLactatingMember,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get headOfFamilyEvacueeId => $composableBuilder(
    column: $table.headOfFamilyEvacueeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get headOfFamilyName => $composableBuilder(
    column: $table.headOfFamilyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get familyCreatedAt => $composableBuilder(
    column: $table.familyCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedFamiliesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedFamiliesTable> {
  $$CachedFamiliesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get barangayId => $composableBuilder(
    column: $table.barangayId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get homeAddress => $composableBuilder(
    column: $table.homeAddress,
    builder: (column) => column,
  );

  GeneratedColumn<int> get evacuationEventId => $composableBuilder(
    column: $table.evacuationEventId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get evacuationEventName => $composableBuilder(
    column: $table.evacuationEventName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get evacuationCenterId => $composableBuilder(
    column: $table.evacuationCenterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get evacuationCenterName => $composableBuilder(
    column: $table.evacuationCenterName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get is4psBeneficiary => $composableBuilder(
    column: $table.is4psBeneficiary,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasPwdMember => $composableBuilder(
    column: $table.hasPwdMember,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasSeniorMember => $composableBuilder(
    column: $table.hasSeniorMember,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasLactatingMember => $composableBuilder(
    column: $table.hasLactatingMember,
    builder: (column) => column,
  );

  GeneratedColumn<int> get memberCount => $composableBuilder(
    column: $table.memberCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get headOfFamilyEvacueeId => $composableBuilder(
    column: $table.headOfFamilyEvacueeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get headOfFamilyName => $composableBuilder(
    column: $table.headOfFamilyName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get familyCreatedAt => $composableBuilder(
    column: $table.familyCreatedAt,
    builder: (column) => column,
  );
}

class $$CachedFamiliesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedFamiliesTable,
          CachedFamily,
          $$CachedFamiliesTableFilterComposer,
          $$CachedFamiliesTableOrderingComposer,
          $$CachedFamiliesTableAnnotationComposer,
          $$CachedFamiliesTableCreateCompanionBuilder,
          $$CachedFamiliesTableUpdateCompanionBuilder,
          (
            CachedFamily,
            BaseReferences<_$AppDatabase, $CachedFamiliesTable, CachedFamily>,
          ),
          CachedFamily,
          PrefetchHooks Function()
        > {
  $$CachedFamiliesTableTableManager(
    _$AppDatabase db,
    $CachedFamiliesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedFamiliesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedFamiliesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedFamiliesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> barangayId = const Value.absent(),
                Value<String> barangayName = const Value.absent(),
                Value<String?> homeAddress = const Value.absent(),
                Value<int?> evacuationEventId = const Value.absent(),
                Value<String?> evacuationEventName = const Value.absent(),
                Value<int?> evacuationCenterId = const Value.absent(),
                Value<String?> evacuationCenterName = const Value.absent(),
                Value<bool> is4psBeneficiary = const Value.absent(),
                Value<bool> hasPwdMember = const Value.absent(),
                Value<bool> hasSeniorMember = const Value.absent(),
                Value<bool> hasLactatingMember = const Value.absent(),
                Value<int> memberCount = const Value.absent(),
                Value<int?> headOfFamilyEvacueeId = const Value.absent(),
                Value<String?> headOfFamilyName = const Value.absent(),
                Value<DateTime?> familyCreatedAt = const Value.absent(),
              }) => CachedFamiliesCompanion(
                id: id,
                barangayId: barangayId,
                barangayName: barangayName,
                homeAddress: homeAddress,
                evacuationEventId: evacuationEventId,
                evacuationEventName: evacuationEventName,
                evacuationCenterId: evacuationCenterId,
                evacuationCenterName: evacuationCenterName,
                is4psBeneficiary: is4psBeneficiary,
                hasPwdMember: hasPwdMember,
                hasSeniorMember: hasSeniorMember,
                hasLactatingMember: hasLactatingMember,
                memberCount: memberCount,
                headOfFamilyEvacueeId: headOfFamilyEvacueeId,
                headOfFamilyName: headOfFamilyName,
                familyCreatedAt: familyCreatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int barangayId,
                required String barangayName,
                Value<String?> homeAddress = const Value.absent(),
                Value<int?> evacuationEventId = const Value.absent(),
                Value<String?> evacuationEventName = const Value.absent(),
                Value<int?> evacuationCenterId = const Value.absent(),
                Value<String?> evacuationCenterName = const Value.absent(),
                required bool is4psBeneficiary,
                required bool hasPwdMember,
                required bool hasSeniorMember,
                required bool hasLactatingMember,
                required int memberCount,
                Value<int?> headOfFamilyEvacueeId = const Value.absent(),
                Value<String?> headOfFamilyName = const Value.absent(),
                Value<DateTime?> familyCreatedAt = const Value.absent(),
              }) => CachedFamiliesCompanion.insert(
                id: id,
                barangayId: barangayId,
                barangayName: barangayName,
                homeAddress: homeAddress,
                evacuationEventId: evacuationEventId,
                evacuationEventName: evacuationEventName,
                evacuationCenterId: evacuationCenterId,
                evacuationCenterName: evacuationCenterName,
                is4psBeneficiary: is4psBeneficiary,
                hasPwdMember: hasPwdMember,
                hasSeniorMember: hasSeniorMember,
                hasLactatingMember: hasLactatingMember,
                memberCount: memberCount,
                headOfFamilyEvacueeId: headOfFamilyEvacueeId,
                headOfFamilyName: headOfFamilyName,
                familyCreatedAt: familyCreatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedFamiliesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedFamiliesTable,
      CachedFamily,
      $$CachedFamiliesTableFilterComposer,
      $$CachedFamiliesTableOrderingComposer,
      $$CachedFamiliesTableAnnotationComposer,
      $$CachedFamiliesTableCreateCompanionBuilder,
      $$CachedFamiliesTableUpdateCompanionBuilder,
      (
        CachedFamily,
        BaseReferences<_$AppDatabase, $CachedFamiliesTable, CachedFamily>,
      ),
      CachedFamily,
      PrefetchHooks Function()
    >;
typedef $$CachedEvacueesTableCreateCompanionBuilder =
    CachedEvacueesCompanion Function({
      Value<int> id,
      required int familyId,
      required String fullName,
      required String firstName,
      Value<String?> middleName,
      required String lastName,
      Value<String?> suffix,
      required String sex,
      Value<DateTime?> dateOfBirth,
      Value<String?> civilStatus,
      Value<String?> contactNumber,
      required bool isPwd,
      Value<String?> pwdType,
      required bool isPregnant,
      required bool isLactating,
      required bool isSoloParent,
      required bool isIndigenousPerson,
      required bool is4psBeneficiary,
      required String barangayName,
    });
typedef $$CachedEvacueesTableUpdateCompanionBuilder =
    CachedEvacueesCompanion Function({
      Value<int> id,
      Value<int> familyId,
      Value<String> fullName,
      Value<String> firstName,
      Value<String?> middleName,
      Value<String> lastName,
      Value<String?> suffix,
      Value<String> sex,
      Value<DateTime?> dateOfBirth,
      Value<String?> civilStatus,
      Value<String?> contactNumber,
      Value<bool> isPwd,
      Value<String?> pwdType,
      Value<bool> isPregnant,
      Value<bool> isLactating,
      Value<bool> isSoloParent,
      Value<bool> isIndigenousPerson,
      Value<bool> is4psBeneficiary,
      Value<String> barangayName,
    });

class $$CachedEvacueesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedEvacueesTable> {
  $$CachedEvacueesTableFilterComposer({
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

  ColumnFilters<int> get familyId => $composableBuilder(
    column: $table.familyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get middleName => $composableBuilder(
    column: $table.middleName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get suffix => $composableBuilder(
    column: $table.suffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get civilStatus => $composableBuilder(
    column: $table.civilStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPwd => $composableBuilder(
    column: $table.isPwd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pwdType => $composableBuilder(
    column: $table.pwdType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPregnant => $composableBuilder(
    column: $table.isPregnant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLactating => $composableBuilder(
    column: $table.isLactating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSoloParent => $composableBuilder(
    column: $table.isSoloParent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isIndigenousPerson => $composableBuilder(
    column: $table.isIndigenousPerson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get is4psBeneficiary => $composableBuilder(
    column: $table.is4psBeneficiary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedEvacueesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedEvacueesTable> {
  $$CachedEvacueesTableOrderingComposer({
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

  ColumnOrderings<int> get familyId => $composableBuilder(
    column: $table.familyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get middleName => $composableBuilder(
    column: $table.middleName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get suffix => $composableBuilder(
    column: $table.suffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get civilStatus => $composableBuilder(
    column: $table.civilStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPwd => $composableBuilder(
    column: $table.isPwd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pwdType => $composableBuilder(
    column: $table.pwdType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPregnant => $composableBuilder(
    column: $table.isPregnant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLactating => $composableBuilder(
    column: $table.isLactating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSoloParent => $composableBuilder(
    column: $table.isSoloParent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isIndigenousPerson => $composableBuilder(
    column: $table.isIndigenousPerson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get is4psBeneficiary => $composableBuilder(
    column: $table.is4psBeneficiary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedEvacueesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedEvacueesTable> {
  $$CachedEvacueesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get familyId =>
      $composableBuilder(column: $table.familyId, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get middleName => $composableBuilder(
    column: $table.middleName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get suffix =>
      $composableBuilder(column: $table.suffix, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get civilStatus => $composableBuilder(
    column: $table.civilStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPwd =>
      $composableBuilder(column: $table.isPwd, builder: (column) => column);

  GeneratedColumn<String> get pwdType =>
      $composableBuilder(column: $table.pwdType, builder: (column) => column);

  GeneratedColumn<bool> get isPregnant => $composableBuilder(
    column: $table.isPregnant,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLactating => $composableBuilder(
    column: $table.isLactating,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSoloParent => $composableBuilder(
    column: $table.isSoloParent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isIndigenousPerson => $composableBuilder(
    column: $table.isIndigenousPerson,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get is4psBeneficiary => $composableBuilder(
    column: $table.is4psBeneficiary,
    builder: (column) => column,
  );

  GeneratedColumn<String> get barangayName => $composableBuilder(
    column: $table.barangayName,
    builder: (column) => column,
  );
}

class $$CachedEvacueesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedEvacueesTable,
          CachedEvacuee,
          $$CachedEvacueesTableFilterComposer,
          $$CachedEvacueesTableOrderingComposer,
          $$CachedEvacueesTableAnnotationComposer,
          $$CachedEvacueesTableCreateCompanionBuilder,
          $$CachedEvacueesTableUpdateCompanionBuilder,
          (
            CachedEvacuee,
            BaseReferences<_$AppDatabase, $CachedEvacueesTable, CachedEvacuee>,
          ),
          CachedEvacuee,
          PrefetchHooks Function()
        > {
  $$CachedEvacueesTableTableManager(
    _$AppDatabase db,
    $CachedEvacueesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedEvacueesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedEvacueesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedEvacueesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> familyId = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String?> middleName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String?> suffix = const Value.absent(),
                Value<String> sex = const Value.absent(),
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> civilStatus = const Value.absent(),
                Value<String?> contactNumber = const Value.absent(),
                Value<bool> isPwd = const Value.absent(),
                Value<String?> pwdType = const Value.absent(),
                Value<bool> isPregnant = const Value.absent(),
                Value<bool> isLactating = const Value.absent(),
                Value<bool> isSoloParent = const Value.absent(),
                Value<bool> isIndigenousPerson = const Value.absent(),
                Value<bool> is4psBeneficiary = const Value.absent(),
                Value<String> barangayName = const Value.absent(),
              }) => CachedEvacueesCompanion(
                id: id,
                familyId: familyId,
                fullName: fullName,
                firstName: firstName,
                middleName: middleName,
                lastName: lastName,
                suffix: suffix,
                sex: sex,
                dateOfBirth: dateOfBirth,
                civilStatus: civilStatus,
                contactNumber: contactNumber,
                isPwd: isPwd,
                pwdType: pwdType,
                isPregnant: isPregnant,
                isLactating: isLactating,
                isSoloParent: isSoloParent,
                isIndigenousPerson: isIndigenousPerson,
                is4psBeneficiary: is4psBeneficiary,
                barangayName: barangayName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int familyId,
                required String fullName,
                required String firstName,
                Value<String?> middleName = const Value.absent(),
                required String lastName,
                Value<String?> suffix = const Value.absent(),
                required String sex,
                Value<DateTime?> dateOfBirth = const Value.absent(),
                Value<String?> civilStatus = const Value.absent(),
                Value<String?> contactNumber = const Value.absent(),
                required bool isPwd,
                Value<String?> pwdType = const Value.absent(),
                required bool isPregnant,
                required bool isLactating,
                required bool isSoloParent,
                required bool isIndigenousPerson,
                required bool is4psBeneficiary,
                required String barangayName,
              }) => CachedEvacueesCompanion.insert(
                id: id,
                familyId: familyId,
                fullName: fullName,
                firstName: firstName,
                middleName: middleName,
                lastName: lastName,
                suffix: suffix,
                sex: sex,
                dateOfBirth: dateOfBirth,
                civilStatus: civilStatus,
                contactNumber: contactNumber,
                isPwd: isPwd,
                pwdType: pwdType,
                isPregnant: isPregnant,
                isLactating: isLactating,
                isSoloParent: isSoloParent,
                isIndigenousPerson: isIndigenousPerson,
                is4psBeneficiary: is4psBeneficiary,
                barangayName: barangayName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedEvacueesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedEvacueesTable,
      CachedEvacuee,
      $$CachedEvacueesTableFilterComposer,
      $$CachedEvacueesTableOrderingComposer,
      $$CachedEvacueesTableAnnotationComposer,
      $$CachedEvacueesTableCreateCompanionBuilder,
      $$CachedEvacueesTableUpdateCompanionBuilder,
      (
        CachedEvacuee,
        BaseReferences<_$AppDatabase, $CachedEvacueesTable, CachedEvacuee>,
      ),
      CachedEvacuee,
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
  $$BarangaysTableTableManager get barangays =>
      $$BarangaysTableTableManager(_db, _db.barangays);
  $$EvacuationEventsTableTableManager get evacuationEvents =>
      $$EvacuationEventsTableTableManager(_db, _db.evacuationEvents);
  $$PendingRegistrationsTableTableManager get pendingRegistrations =>
      $$PendingRegistrationsTableTableManager(_db, _db.pendingRegistrations);
  $$CachedFamiliesTableTableManager get cachedFamilies =>
      $$CachedFamiliesTableTableManager(_db, _db.cachedFamilies);
  $$CachedEvacueesTableTableManager get cachedEvacuees =>
      $$CachedEvacueesTableTableManager(_db, _db.cachedEvacuees);
}
