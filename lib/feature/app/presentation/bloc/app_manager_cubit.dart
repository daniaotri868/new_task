import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


part 'app_manager_state.dart';

@lazySingleton
class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit()
      : super(
          AppManagerState(
            lightThemeData: ThemeData.light(),
          ),
        );


}
