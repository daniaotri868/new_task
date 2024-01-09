
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/category_model.dart';
import '../../data/models/city_model.dart';
import '../../data/models/get_all_country_model.dart';
import '../repositry/home_repositry.dart';



@injectable
class GetCityUsecase extends UseCase<Result<ResponseWrapper<List<CityModel>>>, String> {
  GetCityUsecase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<List<CityModel>>>> call(String params) {
    return repository.GetCity(params);
  }
}

