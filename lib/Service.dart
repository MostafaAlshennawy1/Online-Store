import 'package:dio/dio.dart';
import 'package:online_store/Model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://dummyjson.com/';

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('${_baseUrl}products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'];
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}

Future<List<Product>> getProductsByCategory (String category) async{
  final response = await Dio().get('https://dummyjson.com/products/category/$category');
  if (response.statusCode == 200) {
    final List<dynamic> data = response.data['products'];
    List<Product> products = data.map((json) => Product.fromJson(json)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}
