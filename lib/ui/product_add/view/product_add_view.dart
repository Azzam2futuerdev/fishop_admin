import 'package:fi_widget/fi_widget.dart';
import 'package:fishop_admin/ui/product_add/service/product_service.dart';
import 'package:fishop_firebase/fishop_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddView extends StatefulWidget {
  ProductAddView({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController stockCountController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController trendProductController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final ProductService productService = ProductService();
  @override
  State<ProductAddView> createState() => _ProductAddViewState();
}

class _ProductAddViewState extends State<ProductAddView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => widget.productService.uploadFromGallery(),
          ),
        ]),
        body: Column(children: [
          const Text('title'),
          TextField(
            onChanged: (value) => value = widget.titleController.text,
            controller: widget.titleController,
          ),
          const Text('stock count'),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => value = widget.stockCountController.text,
            controller: widget.stockCountController,
          ),
          const Text('size'),
          TextField(
            onChanged: (value) => value = widget.sizeController.text,
            controller: widget.sizeController,
          ),
          const Text('product name'),
          TextField(
            onChanged: (value) => value = widget.productNameController.text,
            controller: widget.productNameController,
          ),
          const Text('description'),
          TextField(
            onChanged: (value) => value = widget.descriptionController.text,
            controller: widget.descriptionController,
            maxLines: 5,
          ),
          const Text('unit price'),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => value = widget.unitPriceController.text,
            controller: widget.unitPriceController,
          ),
          const Text('Category'),
          TextField(
            controller: widget.categoryController,
            onChanged: (value) => value = widget.categoryController.text,
          ),
          ElevatedButton(
            onPressed: () async {
              await widget.productService.addProduct(
                Product(
                  id: AuthenticationRepository().currentUser.id,
                  category: widget.categoryController.text,
                  description: widget.descriptionController.text,
                  productName: widget.productNameController.text,
                  size: widget.sizeController.text,
                  stockCount: int.parse(widget.stockCountController.text),
                  title: widget.titleController.text,
                  unitPrice: int.parse(widget.unitPriceController.text),
                ),
              );
            },
            child: const Text('add to product'),
          )
        ]),
      ),
    );
  }
}
