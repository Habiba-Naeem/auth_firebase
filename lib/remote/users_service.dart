import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final String uid;
  UserService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser({
    required username,
    required age,
    required bio,
  }) async {
    DocumentReference documentReferencer = userCollection.doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "age": age,
      "bio": bio
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => {print("User creadted")})
        .catchError((e) => print(e));
  }

  Future<UserModel> getUser() {
    DocumentReference documentReferencer = userCollection.doc(uid);
    return documentReferencer.get().then((DocumentSnapshot snapshot) {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      return UserModel(
          uid: uid,
          username: data['username'],
          bio: data['bio'],
          age: data['age'],
          docId: snapshot.reference.id);
    });
  }

  Stream<List<UserModel>> get usersList{
    return userCollection.snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return UserModel(
            age: data['age'],
            bio: data['bio'],
            uid: data['uid'],
            username: data['username'],
            docId: document.reference.id);
      }).toList();
    });
  }
}

// class UserService {
//   final String uid;
//   UserService({required this.uid});

//   final CollectionReference userCollection =
//       FirebaseFirestore.instance.collection('users');

// //  Future<bool> usernameCheck(String username) async {
// //     final result = await UserCollection.where('username', isEqualTo: username).get();
// //     return result.docs.isNotEmpty;
// //   }

//   Future<void> addUser({
//     required username,
//     required age,
//     required bio,
//   }) async {
//     DocumentReference documentReferencer = userCollection.doc(uid).collection('list').doc();

//     Map<String, dynamic> data = <String, dynamic>{
//       "username": username,
//       "age": age,
//       "bio": bio
//     };
//     await documentReferencer
//         .set(data)
//         .whenComplete(() => {print("User creadted")})
//         .catchError((e) => print(e));
//   }

//   UserModel getUserProfileFromSnapshot(DocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
//     return UserModel(
//       uid: uid,
//       username: data['username'],
//       bio: data['bio'],
//       age: data['age'],
//       docId: snapshot.reference.id
//     );
//   }

//   getuserProfile() {
//     DocumentReference documentReferencer = userCollection.doc(uid);
//     return documentReferencer.get().then((DocumentSnapshot snapshot) {
//       return getUserProfileFromSnapshot(snapshot);
//     });
//   }

//   List<UserModel> userListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.docs.map(
//       (DocumentSnapshot document) {

//         Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//         return UserModel(
//             age: data['age'],
//             bio: data['bio'],
//             uid: data['uid'],
//             username: data['username'],
//             docId: document.reference.id
//             );
//       }
//     ).toList();
//   }

//   Stream<List<UserModel>> get userList {
//     CollectionReference usersListCollection = userCollection.doc(uid).collection('list');
//     print(userCollection.snapshots().length);
//     return usersListCollection.snapshots().map(userListFromSnapshot);
//   }
// }
