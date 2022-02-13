//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_ecommerce/controller/product_repository.dart';

class ProductController extends GetxController {
  ProductRepository productRepository = ProductRepository();

  RxBool loading = false.obs;
  List products = [];

  ProductController() {
    loadProductsfromRepo();
  }
  //

// Product store
  List cartItem = List.empty().obs;

  // Add to cart Controller
  addtoCart(item) {
    cartItem.add(item);
  }

  // Total Amount Controller
  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item['price']);
  int get count => cartItem.length;

  // Empty List used to store clicked add to cart values
  // List<ProductController> cartItem = List<ProductController>.empty().obs;

  ///
  loadProductsfromRepo() async {
    loading(true);
    final finalproducts = await productRepository.fetchProducts();
    loading(false);

    // Used to parsed values to products that was empty list before

    products.assignAll(finalproducts);

    // return products;
    // rehan.assignAll(products);
  }
}
