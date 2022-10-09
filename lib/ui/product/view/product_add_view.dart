import 'package:fi_widget/fi_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  State<ProductAddView> createState() => _ProductAddViewState();
}

class _ProductAddViewState extends State<ProductAddView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const Text('title'),
          TextFormField(
            onChanged: (value) => value = widget.titleController.text,
            controller: widget.titleController,
          ),
          const Text('stock count'),
          TextFormField(
            onChanged: (value) => value = widget.stockCountController.text,
            controller: widget.stockCountController,
          ),
          const Text('size'),
          TextFormField(
            onChanged: (value) => value = widget.sizeController.text,
            controller: widget.sizeController,
          ),
          const Text('product name'),
          TextFormField(
            onChanged: (value) => value = widget.productNameController.text,
            controller: widget.productNameController,
          ),
          const Text('description'),
          TextFormField(
            onChanged: (value) => value = widget.descriptionController.text,
            controller: widget.descriptionController,
            maxLines: 5,
          ),
          const Text('trend product'),
          TextFormField(
            onChanged: (value) => value = widget.trendProductController.text,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: widget.trendProductController,
          ),
          const Text('unit price'),
          TextFormField(
            controller: widget.unitPriceController,
          ),
        ]),
      ),
    );
  }
}
