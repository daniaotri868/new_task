import 'package:flutter/cupertino.dart';

import '../../domain/usecase/add_product_to_cart.dart';

@immutable
class CartEvent {}
///use this in details product
class GetAllCountryEvent extends CartEvent {
  final VoidCallback onSuccess;

  GetAllCountryEvent({ required this.onSuccess});
}

class GetAllSiderEvent extends CartEvent {
  final VoidCallback onSuccess;

  GetAllSiderEvent({ required this.onSuccess});
}




class GetAllCategoryEvent extends CartEvent {
  final String params;
  final VoidCallback onSuccess;

  GetAllCategoryEvent({required this.params,  required this.onSuccess});
}

class GetAllCityEvent extends CartEvent {
  final String params;
  final VoidCallback onSuccess;

  GetAllCityEvent({required this.params,  required this.onSuccess});
}

