// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flag_cdn_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$FlagCdnService extends FlagCdnService {
  _$FlagCdnService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = FlagCdnService;

  @override
  Future<Response<String>> getCountryFlag({required String countryCode}) {
    final Uri $url = Uri.parse('/${countryCode}.svg');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<String, String>($request);
  }
}
