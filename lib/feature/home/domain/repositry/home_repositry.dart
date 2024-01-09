

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../data/models/category_model.dart';
import '../../data/models/city_model.dart';
import '../../data/models/get_all_country_model.dart';
import '../../data/models/get_slider.dart';


abstract class HomeRepository {
  Future<Result<ResponseWrapper<List<CountryModel>>>> GetAllCountry();
  Future<Result<ResponseWrapper<List<SliderImageModel>>>> GetAllSlider();
  Future<Result<ResponseWrapper<List<CategoryModel>>>> GetCategory(String param);
  Future<Result<ResponseWrapper<List<CityModel>>>> GetCity(String param);
}
