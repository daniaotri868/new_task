import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../feature/app/presentation/bloc/app_manager_cubit.dart';
import '../feature/home/presentation/bloc_home/home_bloc.dart';



class ServiceProvider extends StatelessWidget {
  const ServiceProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<AppManagerCubit>()),
        BlocProvider(create: (_)=> GetIt.I<CartBloc>()),

      ],
      child: child,
    );
  }

  final Widget child;
}
