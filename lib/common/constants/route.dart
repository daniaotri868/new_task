abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "https://ofrlk.com/api/";
  static const cart = _Cart();
}

class _Cart {
  const _Cart();

  final getAllCountry = 'get-all-countries';
  final getSlider = 'get-slider-image';
  final getCityCategory = 'get-city-categories';
  final getCityCity = 'country';
}


