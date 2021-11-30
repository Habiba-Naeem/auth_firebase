import 'package:auth_firebase/domain/follow/followers.dart';
import 'package:auth_firebase/domain/follow/followings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FollowService {
  final String uid;
  FollowService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addFollower({
    required String followerUid,
    required String followerName,
  }) async {
    DocumentReference documentReferencer =
        userCollection.doc(uid).collection('followers').doc();

    Map<String, dynamic> data = {
      "followerUid": followerUid,
      "followerName": followerName,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes List added to the Song"))
        .catchError((e) => print(e));
  }

  Future<void> addFollowing({
    required String followingUid,
    required String followingName,
  }) async {
    DocumentReference documentReferencer =
        userCollection.doc(uid).collection('followings').doc();

    Map<String, dynamic> data = {
      "followerUid": followingUid,
      "followerName": followingName,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes List added to the Song"))
        .catchError((e) => print(e));
  }

  
  List<Follower> followerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot document) {
      print("in list");
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      print(data.length);
      return Follower(
        uid: data['uid'] ?? '',
        name: data['name'] ?? '',
        docID: document.reference.id,
      );
    }).toList();
  }

  Stream<List<Follower>> get followers {
    CollectionReference followerListFromCollection =
        userCollection.doc(uid).collection('followers');
    print(followerListFromCollection);
    return followerListFromCollection.snapshots().map(followerListFromSnapshot);
  }

  
  List<Following> followingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot document) {
      print("in list");
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      print(data.length);
      return Following(
        uid: data['uid'] ?? '',
        name: data['name'] ?? '',
        docID: document.reference.id,
      );
    }).toList();
  }

  Stream<List<Following>> get followings {
    CollectionReference followingListFromCollection =
        userCollection.doc(uid).collection('followings');
    print(followingListFromCollection);
    return followingListFromCollection.snapshots().map(followingListFromSnapshot);
  }
}
