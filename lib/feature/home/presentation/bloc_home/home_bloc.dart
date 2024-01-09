import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:remy/common/models/page_state/page_state.dart';
import 'package:remy/core/use_case/use_case.dart';
import '../../../../common/models/page_state/bloc_status.dart';
import '../../../../core/api/result.dart';

import 'package:collection/collection.dart';

import '../../domain/usecase/add_product_to_cart.dart';
import '../../domain/usecase/city_usecase.dart';
import '../../domain/usecase/get_all_slider.dart';
import '../../domain/usecase/get_category.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCountryUsecase getAllCountryUsecase;
  final GetAllSliderUsecase getAllSliderUsecase;
  final GetAllCategoryUsecase getAllCategoryUsecase;
  final GetCityUsecase getCityUsecase;

  CartBloc(this.getAllCountryUsecase,this.getAllSliderUsecase, this.getAllCategoryUsecase, this.getCityUsecase)
      : super(const CartState()) {
    on<GetAllCountryEvent>(_onGetAllCountryEvent);
    on<GetAllSiderEvent>(_onGetAllSliderEvent);
    on<GetAllCategoryEvent>(_onGetAllCategoryEvent);
    on<GetAllCityEvent>(_onGetAllCiityEvent);
    ;
  }

  FutureOr<void> _onGetAllCountryEvent(GetAllCountryEvent event,
      Emitter<CartState> emit) async {
    emit(state.copyWith(getAllCountry: const PageState.loading()));
    final result = await getAllCountryUsecase(NoParams());
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
            getAllCountry: data.data.isEmpty
                ? const PageState.empty()
                : PageState.loaded(data: data.data)));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
            getAllCountry:
            PageState.error(exception: exception, message: message)));
    }
  }


  FutureOr<void> _onGetAllSliderEvent(GetAllSiderEvent event,
      Emitter<CartState> emit) async {
    emit(state.copyWith(getAllSlider: const PageState.loading()));
    final result = await getAllSliderUsecase(NoParams());
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
            getAllSlider: data.data.isEmpty
                ? const PageState.empty()
                : PageState.loaded(data: data.data)));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
            getAllSlider:
            PageState.error(exception: exception, message: message)));
    }
  }



  FutureOr<void> _onGetAllCategoryEvent(GetAllCategoryEvent event,
      Emitter<CartState> emit) async {
    emit(state.copyWith(getAllcategory: const PageState.loading()));
    final result = await getAllCategoryUsecase(event.params);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
            getAllcategory: data.data.isEmpty
                ? const PageState.empty()
                : PageState.loaded(data: data.data)));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
            getAllcategory:
            PageState.error(exception: exception, message: message)));
    }
  }


  FutureOr<void> _onGetAllCiityEvent(GetAllCityEvent event,
      Emitter<CartState> emit) async {
    emit(state.copyWith(getCity: const PageState.loading()));
    final result = await getCityUsecase(event.params);
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
            getCity: data.data.isEmpty
                ? const PageState.empty()
                : PageState.loaded(data: data.data)));
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
            getCity:
            PageState.error(exception: exception, message: message)));
    }
  }
}
