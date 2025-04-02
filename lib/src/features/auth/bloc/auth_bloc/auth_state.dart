part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String? message;

  AuthSuccess({this.message});
}

class AuthError extends AuthState {
  final String? error;
  AuthError({this.error});
}
