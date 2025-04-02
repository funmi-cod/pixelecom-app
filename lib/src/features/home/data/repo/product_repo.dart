import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:pixelecomapp/src/features/home/data/model/product_model.dart';

class ProductRepo {
  Future<String> loadJson(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<List<Product>> loadProducts() async {
    final String response = await loadJson('assets/products.json');
    final Map<String, dynamic> data = json.decode(response);

    // Extract products and map them to a list of ProductModel
    return (data['products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }
}
