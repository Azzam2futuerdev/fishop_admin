import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:fishop_firebase/fishop_firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductService {
  final ImagePicker picker = ImagePicker();
  String? imageName;
  Future<Uint8List> imageRead() async {
    XFile? result = await picker.pickImage(source: ImageSource.gallery);
    imageName = result!.name;
    return result.readAsBytes();
  }

  Future<void> addProduct(Product product) async {
    final storageRef = FirebaseStorage.instance.ref();
    String? result =
        await storageRef.child("images/$imageName").getDownloadURL();
    product.imgUrl = result;
    await productsRef.add(product);
  }

  Future<void> uploadFromGallery() async {
    final metadata = SettableMetadata(contentType: "image/jpeg");

    final storageRef = FirebaseStorage.instance.ref();

    final uploadTask = storageRef
        .child("images/$imageName")
        .putData(await imageRead(), metadata);
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);

          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
          break;
        case TaskState.success:
          break;
      }
    });
  }
}
