import 'package:chopper/chopper.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_repository_impl.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockBaseResponse extends Mock implements http.BaseResponse {}

class MockFlagCdnService extends Mock implements FlagCdnService {}

main() {
  late FlagCdnService mockFlagCdnFlagCdnService;
  late FlagCdnRepositoryImpl repository;

  setUp(() {
    mockFlagCdnFlagCdnService = MockFlagCdnService();
    repository = FlagCdnRepositoryImpl(flagCdnService: mockFlagCdnFlagCdnService);
  });

  final chopperResponse = Response(MockBaseResponse(), 'flag');

  group('FlagCdnRepositoryImpl', () {
    test('should return the country flag from the service', () async {
      // arrange
      when(() => mockFlagCdnFlagCdnService.getCountryFlag(countryCode: any(named: 'countryCode'))).thenAnswer(
        (_) async => chopperResponse,
      );

      // act
      final result = await repository.getCountryFlag(countryCode: 'US');
      // assert
      expect(result, 'flag');
      verify(() => mockFlagCdnFlagCdnService.getCountryFlag(countryCode: 'US'));
      verifyNoMoreInteractions(mockFlagCdnFlagCdnService);
    });
  });
}
