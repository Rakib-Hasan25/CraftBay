import 'package:ecommerce/data/model/PaymentMethod.dart';
import 'package:ecommerce/presentation/state_holders/create_invoice_controller.dart';
import 'package:ecommerce/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:ecommerce/presentation/ui/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool isCompleted = false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice().then((value) {
        isCompleted = value;
        if (mounted) {
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Check out"),
        ),
        body: GetBuilder<CreateInvoiceController>(builder: (controller) {
          if (controller.inProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!isCompleted) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Please complete your profile'),
                ElevatedButton(
                    onPressed: () {
                      Get.to(CompleteProfileScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Go to Complete your profile screen"),
                    ))
              ],
            ));
          }
          return ListView.separated(
            itemCount:
                controller.invoiceCreateResponseModel?.paymentMethod?.length ??
                    0,
            itemBuilder: (context, index) {
              final PaymentMethod paymentMethod = controller
                  .invoiceCreateResponseModel!
                  .paymentMethod![index]; //kokono null hobe na
              return ListTile(
                leading: Image.network(
                  paymentMethod.logo ?? '',
                  width: 60,
                ),
                title: Text(paymentMethod.name ?? ''),
                onTap: () {
                  Get.off(() => WebView(
                        paymentUrl: paymentMethod.redirectGatewayURL!,
                      ));
                },
              );
            },
            separatorBuilder: (_, __) {
              return const Divider();
            },
          );
        }));
  }
}
