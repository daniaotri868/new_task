
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/result.dart';
import '../../domain/repositry/home_repositry.dart';
import '../data_source/home_data_source.dart';
import '../models/category_model.dart';
import '../models/city_model.dart';
import '../models/get_all_country_model.dart';
import '../models/get_slider.dart';



@Injectable(as: HomeRepository)
class CartRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource datasource;

  CartRepositoryImpl({required this.datasource});

  @override
  Future<Result<ResponseWrapper<List<CountryModel>>>> GetAllCountry() {
    return toApiResult(() async {
      final result = datasource.GetAllCountry();
      return result;
    });
  }


  @override
  Future<Result<ResponseWrapper<List<SliderImageModel>>>> GetAllSlider() {
    return toApiResult(() async {
      final result = datasource.GetAllSlider();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<List<CategoryModel>>>> GetCategory(String param) {
    return toApiResult(() async {
      final result = datasource.GetAlCategory(param);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<List<CityModel>>>> GetCity(String param) {
    return toApiResult(() async {
      final result = datasource.GetAlCity(param);
      return result;
    });
  }


}
