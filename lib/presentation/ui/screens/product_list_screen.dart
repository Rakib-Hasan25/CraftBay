import 'package:ecommerce/data/model/Product_Model.dart';
import 'package:ecommerce/presentation/state_holders/product_list_controller.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:ecommerce/presentation/ui/widgets/home/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key,this.categoryId,this.productModel});
  final int? categoryId;
  final ProductModel? productModel;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {

WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

  if(widget.categoryId !=null){
    Get.find<ProductListController>().getProductsByCategory(widget.categoryId!);
  }
  else if(widget.productModel!=null){
    Get.find<ProductListController>().setProducts(widget.productModel!);
  }

});

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black,
        ),
        title: const Text("Product list ",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<ProductListController>(
          builder: (controller) {
            if(controller.getProductListInProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(controller.ProductListModel.data?.isEmpty?? true){
              return const Center(
                child: Text("empty list")
              );
            }
            return GridView.builder(
                itemCount: controller.ProductListModel.data!.length ?? 0,


                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16
            ), itemBuilder: (context,index){
              return FittedBox(child: ProductCard(productData:controller.ProductListModel.data![index],));
            });
          }
        ),
      ),
    );
  }
}







// class ProductListScreen extends StatefulWidget {
//   const ProductListScreen({super.key,});
//
//
//   @override
//   State<ProductListScreen> createState() => _ProductListScreenState();
// }
//
// class _ProductListScreenState extends State<ProductListScreen> {
//   @override
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorPalette.primaryColor,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black,
//         ),
//         title: const Text("Product list ",style: TextStyle(color: Colors.black),),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: GetBuilder<PopularProductController>(
//             builder: (controller) {
//               return GridView.builder(
//                   itemCount: controller.PopularProductModel.data!.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16
//                   ), itemBuilder: (context,index){
//                 return FittedBox(child: ProductCard(productData:controller.PopularProductModel.data![index],));
//               });
//             }
//         ),
//       ),
//     );
//   }
// }

