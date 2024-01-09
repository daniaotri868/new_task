
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/get_all_country_model.dart';
import '../repositry/home_repositry.dart';



@injectable
class GetAllCountryUsecase extends UseCase<Result<ResponseWrapper<List<CountryModel>>>, NoParams> {
  GetAllCountryUsecase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<List<CountryModel>>>> call(NoParams params) {
    return repository.GetAllCountry();
  }
}

class AddToCartParams {
  final String productId;
  final int amount;
  final List<String> variantValueIds;

  AddToCartParams({
    required this.productId,
    required this.amount,
    required this.variantValueIds,
  });

  Map<String, dynamic> toMap() {
    return {
      "productId": productId,
      "amount": amount.toString(),
      "variantValueIds":variantValueIds
    };
  }
}
