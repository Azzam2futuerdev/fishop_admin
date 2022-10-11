import 'package:fishop_firebase/fishop_firebase.dart';

class ProductService {
  Future<void> addProduct(Product product) async {
    await productsRef.add(product);
  }
}
