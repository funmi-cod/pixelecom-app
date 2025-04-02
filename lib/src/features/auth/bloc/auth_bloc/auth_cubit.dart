import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelecomapp/src/features/auth/data/model/user_model.dart';
import 'package:pixelecomapp/src/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitState());

  final AuthRepo _repo = AuthRepo();

  login(String email, String password) async {
    emit(AuthLoading());
    debugPrint("Dataa:::: $email");

    try {
      //  a delay to simulate network latency
      await Future.delayed(const Duration(seconds: 3));
      var res = await _repo.login(email: email, password: password);
      UserModel response = UserModel.fromJson(res);
      debugPrint("Res:::: ${response.email}");
      if (response.email.isNotEmpty) {
        emit(AuthSuccess(message: "Login successful"));
      } else {
        emit(AuthError(error: "Error occurred"));
      }
    } catch (e, stackTrace) {
      debugPrint("Login Error: $e");
      debugPrint("StackTrace: $stackTrace");
      emit(AuthError(error: "An unexpected error occurred"));
    }
  }
}
