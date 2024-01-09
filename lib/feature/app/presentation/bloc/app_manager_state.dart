part of 'app_manager_cubit.dart';

@immutable
class AppManagerState {
  const AppManagerState( {
    required this.lightThemeData,
  });

  final ThemeData lightThemeData;
  AppManagerState copyWith({
    ThemeData? lightThemeData,
  }) {
    return AppManagerState(

      lightThemeData: lightThemeData ?? this.lightThemeData,
    );
  }
}
