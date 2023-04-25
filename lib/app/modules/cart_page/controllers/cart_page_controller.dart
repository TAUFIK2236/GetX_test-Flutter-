import 'package:get/get.dart';
import 'package:get_learn/model/allproductModel.dart';

class CartPageController extends GetxController {

  var cartList = <Product>[].obs;
  int get count =>cartList.length;
  double get totalPrice => cartList.fold(0, (sum,item) =>sum + item.price!.toDouble());
  int get itemCount => cartList.length;
  RxBool testBool = false.obs;

  addtoCart(Product product){
    cartList.add(product);
  }
  RemoveCart(Product product){
    cartList.remove(product);
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
