import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelecomapp/src/features/home/data/model/product_model.dart';
import 'package:pixelecomapp/src/features/home/data/repo/product_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  final ProductRepo _repo = ProductRepo();

  List<Product>? productsList;

  fetchProducts() async {
    emit(HomeLoading());

    try {
      // Simulate network latency
      await Future.delayed(const Duration(seconds: 3));

      // Load products
      List<Product> products = await _repo.loadProducts();

      if (products.isNotEmpty) {
        productsList = products;
        emit(HomeSuccess(message: "successful"));
      } else {
        emit(HomeError(error: "No products found"));
      }
    } catch (e, stackTrace) {
      debugPrint("Load Error: $e");
      debugPrint("StackTrace: $stackTrace");
      emit(HomeError(error: "An unexpected error occurred"));
    }
  }
}
