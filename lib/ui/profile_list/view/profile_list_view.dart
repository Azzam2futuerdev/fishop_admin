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
        "id": Text("id"),
        "addressBook": Text("addressBook"),
        "name": Text("name"),
        "surName": Text("surName"),
        "identity": Text("identity"),
        "phoneNumber": Text("phoneNumber"),
        "email": Text("email"),
        "giftCodes": Text('giftCodes')
      },
      query: productsRef.reference.withConverter<Profile>(
        fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) =>
            Profile.fromJson(snapshot.data()!),
        toFirestore: (profile, _) => profile.toJson(),
      ),
    );
  }
}
