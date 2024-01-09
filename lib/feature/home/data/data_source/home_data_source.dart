
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';

import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../models/category_model.dart';
import '../models/city_model.dart';
import '../models/get_all_country_model.dart';
import '../models/get_slider.dart';


@injectable
class HomeRemoteDataSource {
  final ClientApi clientApi;

  HomeRemoteDataSource(this.clientApi);

  Future<ResponseWrapper<List<CountryModel>>> GetAllCountry() async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.cart.getAllCountry,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
            (json) {
              final list = List<dynamic>.of(response.data['data'])
                  .map<CountryModel>((e) => CountryModel.fromJson(e))
                  .toList();
              return list;
        },
      );
    });
  }



  Future<ResponseWrapper<List<SliderImageModel>>> GetAllSlider() async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.cart.getSlider,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
            (json) {
          final list = List<dynamic>.of(response.data['data'])
              .map<SliderImageModel>((e) => SliderImageModel.fromJson(e))
              .toList();
          return list;
        },
      );
    });
  }


  Future<ResponseWrapper<List<CategoryModel>>> GetAlCategory(String param) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: "${EndPoints.cart.getCityCategory}/${param}",
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
            (json) {
          final list = List<dynamic>.of(response.data['data'])
              .map<CategoryModel>((e) => CategoryModel.fromJson(e))
              .toList();
          return list;
        },
      );
    });
  }


  Future<ResponseWrapper<List<CityModel>>> GetAlCity(String param) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: "${EndPoints.cart.getCityCity}/${param}",
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
            (json) {
          final list = List<dynamic>.of(response.data['data'])
              .map<CityModel>((e) => CityModel.fromJson(e))
              .toList();
          return list;
        },
      );
    });
  }







}
