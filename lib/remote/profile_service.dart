import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileService {
  final String uid;
  ProfileService({required this.uid});

  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profiles');

  Future<void> addProfile({
    required username,
    required age,
    required bio,
  }) async {
    DocumentReference documentReferencer = profileCollection.doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "age": age,
      "bio": bio
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("profile creadted"))
        .catchError((e) => print(e));
  }
}
