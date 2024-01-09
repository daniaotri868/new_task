import 'package:flutter/cupertino.dart';
import 'package:remy/common/models/page_state/bloc_status.dart';

import '../../../../common/models/page_state/page_state.dart';
import '../../data/models/category_model.dart';
import '../../data/models/city_model.dart';
import '../../data/models/get_all_country_model.dart';
import '../../data/models/get_slider.dart';


@immutable
class CartState {

  final PageState<List<CountryModel>> getAllCountry;
  final PageState<List<SliderImageModel>> getAllSlider;
  final PageState<List<CategoryModel>> getAllcategory;
  final PageState<List<CityModel>> getCity;

  const CartState({
    this.getAllCountry = const PageState.init(),
    this.getAllSlider = const PageState.init(),
    this.getAllcategory = const PageState.init(),
    this.getCity = const PageState.init(),
  });

  CartState copyWith({
    final PageState<List<CountryModel>>? getAllCountry,
    final PageState<List<SliderImageModel>>? getAllSlider,
    final PageState<List<CategoryModel>>? getAllcategory,
    final PageState<List<CityModel>>? getCity,
  }) {
    return CartState(
        getAllCountry: getAllCountry ?? this.getAllCountry,
      getAllSlider: getAllSlider ?? this.getAllSlider,
      getAllcategory: getAllcategory ?? this.getAllcategory,
      getCity: getCity ?? this.getCity,
       );
  }
}
