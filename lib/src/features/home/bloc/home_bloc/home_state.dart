part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final String? message;

  HomeSuccess({this.message});
}

class HomeError extends HomeState {
  final String? error;
  HomeError({this.error});
}
