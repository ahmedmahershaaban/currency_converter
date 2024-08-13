import 'package:currency_converter/infrastructure/user_flow/conversion_history_model_dto/conversion_history_model_dto.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final paramMap = {"2024-08-06": 57.784993};
  final tConversionHistoryModelDto = ConversionHistoryModelDto(
    fromToConversionHistory: paramMap,
    toFromConversionHistory: paramMap,
  );

  test('should be a subclass of ConversionHistoryModelDto', () async {
    // assert
    expect(tConversionHistoryModelDto, isA<ConversionHistoryModelDto>());
  });
// Todo: will continue this after finishing the application testing for time begin.
  group('fromJson', () {
    test('should return valid model when the all the JSON data is valid', () {
      // final Map<String, dynamic> jsonMap = json.decode()
    });
  });
}
