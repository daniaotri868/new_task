import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_country_model.freezed.dart';
part 'get_all_country_model.g.dart';

@freezed
abstract class CountryModel with _$CountryModel {
  factory CountryModel({
    final int ?id,
    final String ?name,
    final String ?image,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}