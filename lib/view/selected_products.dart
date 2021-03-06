import 'package:flutter/material.dart';

import 'package:getx_ecommerce/controller/product_controller.dart';
import 'package:getx_ecommerce/view/total_amount.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SelectedProducts extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  SelectedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text(
          "Selected Products",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productController.cartItem.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0.0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: GetX<ProductController>(
                                builder: (controller) {
                                  return Text(
                                    productController.cartItem[index]['title']
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              ),
              onPressed: () {
                Get.to(() => TotalAmount());
              },
              child: Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
