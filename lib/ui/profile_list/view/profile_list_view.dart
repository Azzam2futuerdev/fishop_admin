import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishop_firebase/fishop_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreDataTable(
      onSelectedRows: (items) => print(items),
      columnLabels: const {
        'id': Text('id'),
        'title': Text('title'),
        'rating': Text('rating'),
        'type': Text('type'),
        'stockCount': Text('stockCount'),
        'size': Text('size'),
        'productName': Text('productName'),
        'description': Text('description'),
        'customerReview': Text('customerReview'),
        'trendProduct': Text('trendProduct'),
        'unitPrice': Text('unitPrice'),
        'category': Text('category'),
        'storeName': Text('storeName'),
        'storeId': Text('storeId')
      },
      query: productsRef.reference.withConverter<Product>(
        fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) =>
            Product.fromJson(snapshot.data()!),
        toFirestore: (product, _) => product.toJson(),
      ),
    );
  }
}
