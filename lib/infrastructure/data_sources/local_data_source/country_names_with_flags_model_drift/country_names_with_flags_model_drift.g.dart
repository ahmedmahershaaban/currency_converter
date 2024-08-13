// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_names_with_flags_model_drift.dart';

// ignore_for_file: type=lint
class $CountryNamesWithFlagsTable extends CountryNamesWithFlags
    with
        TableInfo<$CountryNamesWithFlagsTable,
            CountryNamesWithFlagsModelDrift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountryNamesWithFlagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _countryFullNameMeta =
      const VerificationMeta('countryFullName');
  @override
  late final GeneratedColumn<String> countryFullName = GeneratedColumn<String>(
      'country_full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _countryShortNameMeta =
      const VerificationMeta('countryShortName');
  @override
  late final GeneratedColumn<String> countryShortName = GeneratedColumn<String>(
      'country_short_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _currencyFlagSvgMeta =
      const VerificationMeta('currencyFlagSvg');
  @override
  late final GeneratedColumn<String> currencyFlagSvg = GeneratedColumn<String>(
      'currency_flag_svg', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryAlpha3Meta =
      const VerificationMeta('countryAlpha3');
  @override
  late final GeneratedColumn<String> countryAlpha3 = GeneratedColumn<String>(
      'country_alpha3', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _currencyFullNameMeta =
      const VerificationMeta('currencyFullName');
  @override
  late final GeneratedColumn<String> currencyFullName = GeneratedColumn<String>(
      'currency_full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<String> currencyId = GeneratedColumn<String>(
      'currency_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 7),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _currencySymbolMeta =
      const VerificationMeta('currencySymbol');
  @override
  late final GeneratedColumn<String> currencySymbol = GeneratedColumn<String>(
      'currency_symbol', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        countryFullName,
        countryShortName,
        currencyFlagSvg,
        countryAlpha3,
        currencyFullName,
        currencyId,
        currencySymbol
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'country_names_with_flags';
  @override
  VerificationContext validateIntegrity(
      Insertable<CountryNamesWithFlagsModelDrift> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('country_full_name')) {
      context.handle(
          _countryFullNameMeta,
          countryFullName.isAcceptableOrUnknown(
              data['country_full_name']!, _countryFullNameMeta));
    } else if (isInserting) {
      context.missing(_countryFullNameMeta);
    }
    if (data.containsKey('country_short_name')) {
      context.handle(
          _countryShortNameMeta,
          countryShortName.isAcceptableOrUnknown(
              data['country_short_name']!, _countryShortNameMeta));
    } else if (isInserting) {
      context.missing(_countryShortNameMeta);
    }
    if (data.containsKey('currency_flag_svg')) {
      context.handle(
          _currencyFlagSvgMeta,
          currencyFlagSvg.isAcceptableOrUnknown(
              data['currency_flag_svg']!, _currencyFlagSvgMeta));
    } else if (isInserting) {
      context.missing(_currencyFlagSvgMeta);
    }
    if (data.containsKey('country_alpha3')) {
      context.handle(
          _countryAlpha3Meta,
          countryAlpha3.isAcceptableOrUnknown(
              data['country_alpha3']!, _countryAlpha3Meta));
    } else if (isInserting) {
      context.missing(_countryAlpha3Meta);
    }
    if (data.containsKey('currency_full_name')) {
      context.handle(
          _currencyFullNameMeta,
          currencyFullName.isAcceptableOrUnknown(
              data['currency_full_name']!, _currencyFullNameMeta));
    } else if (isInserting) {
      context.missing(_currencyFullNameMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('currency_symbol')) {
      context.handle(
          _currencySymbolMeta,
          currencySymbol.isAcceptableOrUnknown(
              data['currency_symbol']!, _currencySymbolMeta));
    } else if (isInserting) {
      context.missing(_currencySymbolMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CountryNamesWithFlagsModelDrift map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryNamesWithFlagsModelDrift(
      countryFullName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}country_full_name'])!,
      countryShortName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}country_short_name'])!,
      currencyFlagSvg: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}currency_flag_svg'])!,
      countryAlpha3: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_alpha3'])!,
      currencyFullName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}currency_full_name'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency_id'])!,
      currencySymbol: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}currency_symbol'])!,
    );
  }

  @override
  $CountryNamesWithFlagsTable createAlias(String alias) {
    return $CountryNamesWithFlagsTable(attachedDatabase, alias);
  }
}

class CountryNamesWithFlagsModelDrift extends DataClass
    implements Insertable<CountryNamesWithFlagsModelDrift> {
  final String countryFullName;
  final String countryShortName;
  final String currencyFlagSvg;
  final String countryAlpha3;
  final String currencyFullName;
  final String currencyId;
  final String currencySymbol;
  const CountryNamesWithFlagsModelDrift(
      {required this.countryFullName,
      required this.countryShortName,
      required this.currencyFlagSvg,
      required this.countryAlpha3,
      required this.currencyFullName,
      required this.currencyId,
      required this.currencySymbol});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['country_full_name'] = Variable<String>(countryFullName);
    map['country_short_name'] = Variable<String>(countryShortName);
    map['currency_flag_svg'] = Variable<String>(currencyFlagSvg);
    map['country_alpha3'] = Variable<String>(countryAlpha3);
    map['currency_full_name'] = Variable<String>(currencyFullName);
    map['currency_id'] = Variable<String>(currencyId);
    map['currency_symbol'] = Variable<String>(currencySymbol);
    return map;
  }

  CountryNamesWithFlagsCompanion toCompanion(bool nullToAbsent) {
    return CountryNamesWithFlagsCompanion(
      countryFullName: Value(countryFullName),
      countryShortName: Value(countryShortName),
      currencyFlagSvg: Value(currencyFlagSvg),
      countryAlpha3: Value(countryAlpha3),
      currencyFullName: Value(currencyFullName),
      currencyId: Value(currencyId),
      currencySymbol: Value(currencySymbol),
    );
  }

  factory CountryNamesWithFlagsModelDrift.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountryNamesWithFlagsModelDrift(
      countryFullName: serializer.fromJson<String>(json['countryFullName']),
      countryShortName: serializer.fromJson<String>(json['countryShortName']),
      currencyFlagSvg: serializer.fromJson<String>(json['currencyFlagSvg']),
      countryAlpha3: serializer.fromJson<String>(json['countryAlpha3']),
      currencyFullName: serializer.fromJson<String>(json['currencyFullName']),
      currencyId: serializer.fromJson<String>(json['currencyId']),
      currencySymbol: serializer.fromJson<String>(json['currencySymbol']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'countryFullName': serializer.toJson<String>(countryFullName),
      'countryShortName': serializer.toJson<String>(countryShortName),
      'currencyFlagSvg': serializer.toJson<String>(currencyFlagSvg),
      'countryAlpha3': serializer.toJson<String>(countryAlpha3),
      'currencyFullName': serializer.toJson<String>(currencyFullName),
      'currencyId': serializer.toJson<String>(currencyId),
      'currencySymbol': serializer.toJson<String>(currencySymbol),
    };
  }

  CountryNamesWithFlagsModelDrift copyWith(
          {String? countryFullName,
          String? countryShortName,
          String? currencyFlagSvg,
          String? countryAlpha3,
          String? currencyFullName,
          String? currencyId,
          String? currencySymbol}) =>
      CountryNamesWithFlagsModelDrift(
        countryFullName: countryFullName ?? this.countryFullName,
        countryShortName: countryShortName ?? this.countryShortName,
        currencyFlagSvg: currencyFlagSvg ?? this.currencyFlagSvg,
        countryAlpha3: countryAlpha3 ?? this.countryAlpha3,
        currencyFullName: currencyFullName ?? this.currencyFullName,
        currencyId: currencyId ?? this.currencyId,
        currencySymbol: currencySymbol ?? this.currencySymbol,
      );
  CountryNamesWithFlagsModelDrift copyWithCompanion(
      CountryNamesWithFlagsCompanion data) {
    return CountryNamesWithFlagsModelDrift(
      countryFullName: data.countryFullName.present
          ? data.countryFullName.value
          : this.countryFullName,
      countryShortName: data.countryShortName.present
          ? data.countryShortName.value
          : this.countryShortName,
      currencyFlagSvg: data.currencyFlagSvg.present
          ? data.currencyFlagSvg.value
          : this.currencyFlagSvg,
      countryAlpha3: data.countryAlpha3.present
          ? data.countryAlpha3.value
          : this.countryAlpha3,
      currencyFullName: data.currencyFullName.present
          ? data.currencyFullName.value
          : this.currencyFullName,
      currencyId:
          data.currencyId.present ? data.currencyId.value : this.currencyId,
      currencySymbol: data.currencySymbol.present
          ? data.currencySymbol.value
          : this.currencySymbol,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountryNamesWithFlagsModelDrift(')
          ..write('countryFullName: $countryFullName, ')
          ..write('countryShortName: $countryShortName, ')
          ..write('currencyFlagSvg: $currencyFlagSvg, ')
          ..write('countryAlpha3: $countryAlpha3, ')
          ..write('currencyFullName: $currencyFullName, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencySymbol: $currencySymbol')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      countryFullName,
      countryShortName,
      currencyFlagSvg,
      countryAlpha3,
      currencyFullName,
      currencyId,
      currencySymbol);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryNamesWithFlagsModelDrift &&
          other.countryFullName == this.countryFullName &&
          other.countryShortName == this.countryShortName &&
          other.currencyFlagSvg == this.currencyFlagSvg &&
          other.countryAlpha3 == this.countryAlpha3 &&
          other.currencyFullName == this.currencyFullName &&
          other.currencyId == this.currencyId &&
          other.currencySymbol == this.currencySymbol);
}

class CountryNamesWithFlagsCompanion
    extends UpdateCompanion<CountryNamesWithFlagsModelDrift> {
  final Value<String> countryFullName;
  final Value<String> countryShortName;
  final Value<String> currencyFlagSvg;
  final Value<String> countryAlpha3;
  final Value<String> currencyFullName;
  final Value<String> currencyId;
  final Value<String> currencySymbol;
  final Value<int> rowid;
  const CountryNamesWithFlagsCompanion({
    this.countryFullName = const Value.absent(),
    this.countryShortName = const Value.absent(),
    this.currencyFlagSvg = const Value.absent(),
    this.countryAlpha3 = const Value.absent(),
    this.currencyFullName = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountryNamesWithFlagsCompanion.insert({
    required String countryFullName,
    required String countryShortName,
    required String currencyFlagSvg,
    required String countryAlpha3,
    required String currencyFullName,
    required String currencyId,
    required String currencySymbol,
    this.rowid = const Value.absent(),
  })  : countryFullName = Value(countryFullName),
        countryShortName = Value(countryShortName),
        currencyFlagSvg = Value(currencyFlagSvg),
        countryAlpha3 = Value(countryAlpha3),
        currencyFullName = Value(currencyFullName),
        currencyId = Value(currencyId),
        currencySymbol = Value(currencySymbol);
  static Insertable<CountryNamesWithFlagsModelDrift> custom({
    Expression<String>? countryFullName,
    Expression<String>? countryShortName,
    Expression<String>? currencyFlagSvg,
    Expression<String>? countryAlpha3,
    Expression<String>? currencyFullName,
    Expression<String>? currencyId,
    Expression<String>? currencySymbol,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (countryFullName != null) 'country_full_name': countryFullName,
      if (countryShortName != null) 'country_short_name': countryShortName,
      if (currencyFlagSvg != null) 'currency_flag_svg': currencyFlagSvg,
      if (countryAlpha3 != null) 'country_alpha3': countryAlpha3,
      if (currencyFullName != null) 'currency_full_name': currencyFullName,
      if (currencyId != null) 'currency_id': currencyId,
      if (currencySymbol != null) 'currency_symbol': currencySymbol,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountryNamesWithFlagsCompanion copyWith(
      {Value<String>? countryFullName,
      Value<String>? countryShortName,
      Value<String>? currencyFlagSvg,
      Value<String>? countryAlpha3,
      Value<String>? currencyFullName,
      Value<String>? currencyId,
      Value<String>? currencySymbol,
      Value<int>? rowid}) {
    return CountryNamesWithFlagsCompanion(
      countryFullName: countryFullName ?? this.countryFullName,
      countryShortName: countryShortName ?? this.countryShortName,
      currencyFlagSvg: currencyFlagSvg ?? this.currencyFlagSvg,
      countryAlpha3: countryAlpha3 ?? this.countryAlpha3,
      currencyFullName: currencyFullName ?? this.currencyFullName,
      currencyId: currencyId ?? this.currencyId,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (countryFullName.present) {
      map['country_full_name'] = Variable<String>(countryFullName.value);
    }
    if (countryShortName.present) {
      map['country_short_name'] = Variable<String>(countryShortName.value);
    }
    if (currencyFlagSvg.present) {
      map['currency_flag_svg'] = Variable<String>(currencyFlagSvg.value);
    }
    if (countryAlpha3.present) {
      map['country_alpha3'] = Variable<String>(countryAlpha3.value);
    }
    if (currencyFullName.present) {
      map['currency_full_name'] = Variable<String>(currencyFullName.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<String>(currencyId.value);
    }
    if (currencySymbol.present) {
      map['currency_symbol'] = Variable<String>(currencySymbol.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryNamesWithFlagsCompanion(')
          ..write('countryFullName: $countryFullName, ')
          ..write('countryShortName: $countryShortName, ')
          ..write('currencyFlagSvg: $currencyFlagSvg, ')
          ..write('countryAlpha3: $countryAlpha3, ')
          ..write('currencyFullName: $currencyFullName, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CountryNamesWithFlagsTable countryNamesWithFlags =
      $CountryNamesWithFlagsTable(this);
  late final CountryNamesWithFlagsModelDriftDao
      countryNamesWithFlagsModelDriftDao =
      CountryNamesWithFlagsModelDriftDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [countryNamesWithFlags];
}

typedef $$CountryNamesWithFlagsTableCreateCompanionBuilder
    = CountryNamesWithFlagsCompanion Function({
  required String countryFullName,
  required String countryShortName,
  required String currencyFlagSvg,
  required String countryAlpha3,
  required String currencyFullName,
  required String currencyId,
  required String currencySymbol,
  Value<int> rowid,
});
typedef $$CountryNamesWithFlagsTableUpdateCompanionBuilder
    = CountryNamesWithFlagsCompanion Function({
  Value<String> countryFullName,
  Value<String> countryShortName,
  Value<String> currencyFlagSvg,
  Value<String> countryAlpha3,
  Value<String> currencyFullName,
  Value<String> currencyId,
  Value<String> currencySymbol,
  Value<int> rowid,
});

class $$CountryNamesWithFlagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CountryNamesWithFlagsTable,
    CountryNamesWithFlagsModelDrift,
    $$CountryNamesWithFlagsTableFilterComposer,
    $$CountryNamesWithFlagsTableOrderingComposer,
    $$CountryNamesWithFlagsTableCreateCompanionBuilder,
    $$CountryNamesWithFlagsTableUpdateCompanionBuilder> {
  $$CountryNamesWithFlagsTableTableManager(
      _$AppDatabase db, $CountryNamesWithFlagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$CountryNamesWithFlagsTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$CountryNamesWithFlagsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> countryFullName = const Value.absent(),
            Value<String> countryShortName = const Value.absent(),
            Value<String> currencyFlagSvg = const Value.absent(),
            Value<String> countryAlpha3 = const Value.absent(),
            Value<String> currencyFullName = const Value.absent(),
            Value<String> currencyId = const Value.absent(),
            Value<String> currencySymbol = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CountryNamesWithFlagsCompanion(
            countryFullName: countryFullName,
            countryShortName: countryShortName,
            currencyFlagSvg: currencyFlagSvg,
            countryAlpha3: countryAlpha3,
            currencyFullName: currencyFullName,
            currencyId: currencyId,
            currencySymbol: currencySymbol,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String countryFullName,
            required String countryShortName,
            required String currencyFlagSvg,
            required String countryAlpha3,
            required String currencyFullName,
            required String currencyId,
            required String currencySymbol,
            Value<int> rowid = const Value.absent(),
          }) =>
              CountryNamesWithFlagsCompanion.insert(
            countryFullName: countryFullName,
            countryShortName: countryShortName,
            currencyFlagSvg: currencyFlagSvg,
            countryAlpha3: countryAlpha3,
            currencyFullName: currencyFullName,
            currencyId: currencyId,
            currencySymbol: currencySymbol,
            rowid: rowid,
          ),
        ));
}

class $$CountryNamesWithFlagsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CountryNamesWithFlagsTable> {
  $$CountryNamesWithFlagsTableFilterComposer(super.$state);
  ColumnFilters<String> get countryFullName => $state.composableBuilder(
      column: $state.table.countryFullName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get countryShortName => $state.composableBuilder(
      column: $state.table.countryShortName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currencyFlagSvg => $state.composableBuilder(
      column: $state.table.currencyFlagSvg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get countryAlpha3 => $state.composableBuilder(
      column: $state.table.countryAlpha3,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currencyFullName => $state.composableBuilder(
      column: $state.table.currencyFullName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currencySymbol => $state.composableBuilder(
      column: $state.table.currencySymbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CountryNamesWithFlagsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CountryNamesWithFlagsTable> {
  $$CountryNamesWithFlagsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get countryFullName => $state.composableBuilder(
      column: $state.table.countryFullName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get countryShortName => $state.composableBuilder(
      column: $state.table.countryShortName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currencyFlagSvg => $state.composableBuilder(
      column: $state.table.currencyFlagSvg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get countryAlpha3 => $state.composableBuilder(
      column: $state.table.countryAlpha3,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currencyFullName => $state.composableBuilder(
      column: $state.table.currencyFullName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currencyId => $state.composableBuilder(
      column: $state.table.currencyId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currencySymbol => $state.composableBuilder(
      column: $state.table.currencySymbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CountryNamesWithFlagsTableTableManager get countryNamesWithFlags =>
      $$CountryNamesWithFlagsTableTableManager(_db, _db.countryNamesWithFlags);
}

mixin _$CountryNamesWithFlagsModelDriftDaoMixin
    on DatabaseAccessor<AppDatabase> {
  $CountryNamesWithFlagsTable get countryNamesWithFlags =>
      attachedDatabase.countryNamesWithFlags;
}
