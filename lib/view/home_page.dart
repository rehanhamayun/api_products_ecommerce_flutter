import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/instance_manager.dart';
import 'package:getx_ecommerce/controller/product_controller.dart';
import 'package:getx_ecommerce/view/selected_products.dart';
import 'package:getx_ecommerce/view/total_amount.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  // Dependency Injection
  ProductController productController = Get.put(ProductController());
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(productController.products);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        title: Center(child: GetX<ProductController>(builder: (controller) {
          return Text(
            "Total : ${productController.totalPrice.toString()}",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          );
        })),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              elevation: 0.0,
            ),
            onPressed: () {
              Get.to(() => SelectedProducts());
            },
            icon: Icon(CupertinoIcons.cart),
            label: GetX<ProductController>(
              builder: (controller) {
                return Text(
                  productController.cartItem.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 18,
          ),
        ],
      ),
      // Drawer design
      drawer: Drawer(
        backgroundColor: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 0, 0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 128.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://mir-s3-cdn-cf.behance.net/user/276/d33182930303257.608e93bbc497d.jpg"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Rehan Hamayun",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.home,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Home",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => TotalAmount());
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Checkout ",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Your Total:",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  GetX<ProductController>(builder: ((controller) {
                    return Text(
                      productController.totalPrice.toString(),
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    );
                  }))
                ],
              ),
            ),
          ),
        ),
      ),
      // Screen Designing

      body: Container(
        child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (BuildContext context, int index) {
              if (productController.loading.value) {
                return CircularProgressIndicator();
              }
              return Card(
                elevation: 0.0,
                child: Container(
                  height: 318,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  productController.products[index]['id']
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                productController.products[index]['title'],
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(60),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    " ${productController.products[index]['price']} \$ ",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            productController.products[index]['image'],
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                            onPressed: () {
                              Get.snackbar(
                                "Product Added",
                                productController.products[index]['title']
                                    .toString(),
                                duration: Duration(seconds: 1),
                              );

                              productController
                                  .addtoCart(productController.products[index]);
                            },
                            child: Icon(CupertinoIcons.cart),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
