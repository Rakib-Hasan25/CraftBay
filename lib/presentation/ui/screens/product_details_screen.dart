import 'package:ecommerce/data/model/product_details_data.dart';
import 'package:ecommerce/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/custon_stepper.dart';
import 'package:ecommerce/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/add_to_cart_controller.dart';
import '../utlis/color_palette.dart';
import '../widgets/SizePicker.dart';
import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {

  final int productId;
   ProductDetailsScreen({super.key,required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  int _selectedSizeIndex =0;
  int _selectedColorindex =0;
  int quantity =1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (controller) {
            if (controller.productDetailsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ProductImageSlider(imageList: [
                                controller.productDetailsData.img1 ?? "",
                                controller.productDetailsData.img2 ?? "",
                                controller.productDetailsData.img3 ?? "",
                                controller.productDetailsData.img4 ?? "",
                              ],),
                              productDetailsAppBar,
                            ],
                          ),
                          productDetails(controller),
                        ],
                      ),
                    ),
                  ),
                  cartToCartBottomContainer(
                     controller.productDetailsData,
                     controller.availableSizes ,
                     controller.availableColors,

                  )

                ],
              ),
            );
          }
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Product Details",
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  Padding productDetails(ProductDetailsController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    controller.productDetailsData.product?.title ?? ' ',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5),
                  )),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newValue) {
                        quantity = newValue;
                  })
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star_border,
                    size: 20,
                    color: Colors.amber,
                  ),
                  Text(
                    '${controller.productDetailsData.product?.star ?? 0}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Review',
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Card(
                color: ColorPalette.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),


          // color choose pallete


          const Text(
            "Color",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          SizedBox(
              height: 25,
              child: ColorPicker(
                initialSelected: 0,
                onSelected: (int selectedColor) {
                  _selectedColorindex = selectedColor;
                },
                colors: controller.productDetailsData.color?.split(',') ?? [],
              )
          ),

          const SizedBox(height: 16),


          //Size choose pallete


          const Text(
            "Size",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 25,
            child: SizePicker(
              initialSelected: 0,
              onSelected: (int selectedSize) {
                _selectedSizeIndex = selectedSize;

              },
              sizes: controller.productDetailsData.size?.split(',') ?? [],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            controller.productDetailsData.des ?? ''
            ,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),

        ],
      ),
    );
  }


  Container cartToCartBottomContainer(ProductDetailsData productDetailsData,
      List<String>colors,List<String>sizes ){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54
              ),),
              SizedBox(height: 4,),
              Text('\$${productDetailsData.product?.price ?? 0}',
                  style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorPalette.primaryColor
              )
              ),
            ],
          ),
          SizedBox(
              width: 120,
              child: GetBuilder<AddToCartController>(
                  builder: (controller) {
                    if(controller.addToCartInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }


                    return ElevatedButton(
                        onPressed: ()async{
                      final result = await controller.addToCart(
                          productDetailsData.id!,
                          colors[_selectedColorindex],
                          sizes[_selectedSizeIndex],
                          quantity
                      ).then((result) {
                        Get.snackbar('Added to Cart',
                            "this product has been added to cart list",
                        snackPosition: SnackPosition.BOTTOM);

                      });
                    },
                        child:const Text('Add to cart'));
                  }
              )),
        ],

      ),
    );
  }


  // void convertStringToColor(String color) {
  //   final List<String>splittedColors = color.split(',');
  //   for (String c in splittedColors) {
  //     // colors.add(HexColor.fromHex(c));
  //     colors.add(c);
  //
  //   }
  // }

}











