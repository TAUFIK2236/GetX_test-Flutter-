import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_learn/app/modules/cart_page/controllers/cart_page_controller.dart';
import 'package:get_learn/app/modules/cart_page/views/cart_page_view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => controller.testBool.value
              ? CircularProgressIndicator()
              : Stack(
                children: [
                  GetX<HomeController>(builder: (controller) {
                    return controller.testBool.value
                        ? CircularProgressIndicator()
                        : SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                  itemCount: controller.productsList.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                        elevation: 4.sp,
                                        child: ListTile(
                                          leading: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Container(
                                              width: 20.sp,
                                              decoration: BoxDecoration(
                                                  color: Colors.cyanAccent,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        controller
                                                            .productsList[index]
                                                            .images![0],
                                                      ),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          title: Text(
                                            controller.productsList[index].title
                                                .toString(),
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          subtitle: Text(controller
                                              .productsList[index].price
                                              .toString()),
                                          trailing: ElevatedButton(
                                            onPressed: () {
                                              cartController.addtoCart(
                                                  controller.productsList[index]);
                                            },
                                            child: Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 8.sp),
                                            ),
                                          ),
                                        ));
                                  }),
                              SizedBox(height: 50.sp,)
                            ],
                          ),
                        );
                  }),
                  Positioned(
                   bottom:10.sp,
                    left: 0.0,
                    right: 0.0,
                    child:  Padding(
                      padding: EdgeInsets.fromLTRB(10.sp,0,10.sp,0),
                      child: InkWell(
                        child: Container(
                          height: Get.width*0.1,
                         // width: Get.width*0.8,
                          decoration: BoxDecoration(
                              color: Colors.cyan
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetX<CartPageController>(
                                  builder: (controller) {
                                    return Text("Total amount: ${controller.totalPrice}  (",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w700,fontSize:15.sp),);
                                  }),
                              GetX<CartPageController>(
                                  builder: (controller) {
                                    return Text("${controller.itemCount}",style:TextStyle(color:Colors.red,fontWeight:FontWeight.w700,fontSize:15.sp),);
                                  }),
                        Text(")",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w700,fontSize:15.sp),)
                            ],
                          ),
                        ),
                        onTap: (){Get.to(CartPageView());},
                      ),
                    ),
                  ),

                ],
              ),
        ),
      ),
    );
  }
}
