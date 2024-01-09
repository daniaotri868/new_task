// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../feature/app/presentation/bloc/app_manager_cubit.dart' as _i3;
import '../../feature/home/data/data_source/home_data_source.dart' as _i8;
import '../../feature/home/data/repositry_imp/home_repositry_imp.dart' as _i10;
import '../../feature/home/domain/repositry/home_repositry.dart' as _i9;
import '../../feature/home/domain/usecase/add_product_to_cart.dart' as _i12;
import '../../feature/home/domain/usecase/city_usecase.dart' as _i14;
import '../../feature/home/domain/usecase/get_all_slider.dart' as _i13;
import '../../feature/home/domain/usecase/get_category.dart' as _i11;
import '../../feature/home/presentation/bloc_home/home_bloc.dart' as _i15;
import '../api/client.dart' as _i7;
import 'di_container.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AppManagerCubit>(() => _i3.AppManagerCubit());
  gh.factory<_i4.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i5.Logger>(appModule.logger);
  await gh.singletonAsync<_i6.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => appModule.dio(
        gh<_i4.BaseOptions>(),
        gh<_i5.Logger>(),
      ));
  gh.factory<_i7.ClientApi>(() => _i7.ClientApi(gh<_i4.Dio>()));
  gh.factory<_i8.HomeRemoteDataSource>(
      () => _i8.HomeRemoteDataSource(gh<_i7.ClientApi>()));
  gh.factory<_i9.HomeRepository>(() =>
      _i10.CartRepositoryImpl(datasource: gh<_i8.HomeRemoteDataSource>()));
  gh.factory<_i11.GetAllCategoryUsecase>(
      () => _i11.GetAllCategoryUsecase(gh<_i9.HomeRepository>()));
  gh.factory<_i12.GetAllCountryUsecase>(
      () => _i12.GetAllCountryUsecase(gh<_i9.HomeRepository>()));
  gh.factory<_i13.GetAllSliderUsecase>(
      () => _i13.GetAllSliderUsecase(gh<_i9.HomeRepository>()));
  gh.factory<_i14.GetCityUsecase>(
      () => _i14.GetCityUsecase(gh<_i9.HomeRepository>()));
  gh.factory<_i15.CartBloc>(() => _i15.CartBloc(
        gh<_i12.GetAllCountryUsecase>(),
        gh<_i13.GetAllSliderUsecase>(),
        gh<_i11.GetAllCategoryUsecase>(),
        gh<_i14.GetCityUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i16.AppModule {}
