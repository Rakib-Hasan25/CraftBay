import 'package:ecommerce/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce/presentation/ui/utlis/color_extension.dart';
import 'package:ecommerce/presentation/ui/widgets/custon_stepper.dart';
import 'package:ecommerce/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/model/product_details_data.dart';
import '../utlis/color_palette.dart';
import '../widgets/SizePicker.dart';
import '../widgets/color_picker.dart';
import '../widgets/product_details_addtocart_container.dart';

class ProductDetailsScreen extends StatefulWidget {

  final int productId;
   ProductDetailsScreen({super.key,required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [];

  List<String> sizes = ['S', 'L', 'M', 'XL', 'XXL'];

  int _selectedIColorndex = 0;
  int _selectedSizeIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
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
                  product_details_addtocart_container()
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
    convertStringToColor(controller.productDetailsData.color ?? "");
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
                  onChange: (newValue) {})
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
                  _selectedIColorndex = selectedColor;
                },
                colors: colors,
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
              onSelected: (int SelectedSize) {
                _selectedSizeIndex = SelectedSize;
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


  void convertStringToColor(String color) {
    final List<String>splittedColors = color.split(',');
    for (String c in splittedColors) {
      colors.add(HexColor.fromHex(c));
    }
  }

}











