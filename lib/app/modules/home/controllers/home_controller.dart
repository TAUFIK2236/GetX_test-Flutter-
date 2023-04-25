import 'package:get/get.dart';
import 'package:get_learn/model/allproductModel.dart' ;
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  final dio = Dio();
  RxBool testBool = true.obs;
  List productsList = <Product>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

void fetchProducts()async{
  await Future.delayed(Duration(seconds:1));
  var response = await dio.get('https://dummyjson.com/products');
  final result = allProductModelFromJson(response.toString());
  print(result.products![0].title);
 productsList = result.products!;
 testBool.value = false;
}
}
