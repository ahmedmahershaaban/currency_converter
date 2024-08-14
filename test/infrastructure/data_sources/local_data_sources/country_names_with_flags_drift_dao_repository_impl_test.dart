import 'dart:convert';

import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_drift_dao_repository_impl.dart';
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class FakeInsertable extends Fake implements Insertable<CountryNamesWithFlagsModelDrift> {}

class MockCountryNamesWithFlagsModelDriftDao extends Mock implements CountryNamesWithFlagsModelDriftDao {}

main() {
  late MockCountryNamesWithFlagsModelDriftDao dao;
  late CountryNamesWithFlagsDriftDaoRepositoryImpl repository;

  setUp(() {
    dao = MockCountryNamesWithFlagsModelDriftDao();
    repository = CountryNamesWithFlagsDriftDaoRepositoryImpl(countryNamesWithFlagsModelDriftDao: dao);
    registerFallbackValue(FakeInsertable());
  });

  final tCountryNamesWithFlagsModelDrift = CountryNamesWithFlagsModelDrift.fromJson(
    json.decode(fixtureCorrectModelForCountryNamesWithFlagModelDto()),
  );

  group('CountryNamesWithFlagsDriftDaoRepositoryImpl', () {
    test('should get all countries with flags from the local DB', () async {
      // Arrange
      final expectedCountries = <CountryNamesWithFlagsModelDrift>[tCountryNamesWithFlagsModelDrift];

      when(() => dao.getAllCountriesWithFlags()).thenAnswer((_) async => expectedCountries);

      // Act
      final result = await repository.getAllCountriesWithFlags();

      // Assert
      expect(result, expectedCountries);
      verify(() => dao.getAllCountriesWithFlags()).called(1);
      verifyNoMoreInteractions(dao);
    });

    test('should insert a country with flags in the local DB', () async {
      // Arrange
      when(() => dao.insertCountryWithFlags(any())).thenAnswer((_) async => 1);

      // Act
      final result = await repository.insertCountryWithFlags(tCountryNamesWithFlagsModelDrift);

      // Assert
      expect(result, 1);
      verify(() => dao.insertCountryWithFlags(tCountryNamesWithFlagsModelDrift)).called(1);
      verifyNoMoreInteractions(dao);
    });

    test('should update a country with flags in the local DB', () async {
      // Arrange
      when(() => dao.updateCountryWithFlags(any())).thenAnswer((_) async => true);

      // Act
      final result = await repository.updateCountryWithFlags(tCountryNamesWithFlagsModelDrift);

      // Assert
      expect(result, true);
      verify(() => dao.updateCountryWithFlags(tCountryNamesWithFlagsModelDrift)).called(1);
      verifyNoMoreInteractions(dao);
    });

    test('should delete a country with flags from the local DB', () async {
      // Arrange
      when(() => dao.deleteCountryWithFlags(any())).thenAnswer((_) async => 1);

      // Act
      final result = await repository.deleteCountryWithFlags(tCountryNamesWithFlagsModelDrift);

      // Assert
      expect(result, 1);
      verify(() => dao.deleteCountryWithFlags(tCountryNamesWithFlagsModelDrift)).called(1);
      verifyNoMoreInteractions(dao);
    });
  });
}
