import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_slider.freezed.dart';
part 'get_slider.g.dart';

@freezed
abstract class SliderImageModel with _$SliderImageModel {
  factory SliderImageModel({
    final String ?image,
    final int? companyId,
    final int ?countryId,
  }) = _SliderImageModel;

  factory SliderImageModel.fromJson(Map<String, dynamic> json) =>
      _$SliderImageModelFromJson(json);
}