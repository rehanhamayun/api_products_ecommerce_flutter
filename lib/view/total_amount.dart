import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_ecommerce/controller/product_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class TotalAmount extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  TotalAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Checkout Amount",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                productController.totalPrice.toString(),
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new_sharp),
                label: Text(""),
              )
            ],
          ),
        ),
      ),
    );
  }
}
