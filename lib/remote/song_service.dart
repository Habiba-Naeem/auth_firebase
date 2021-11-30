import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:auth_firebase/domain/songs/song.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/users_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongService {
  final String uid;
  SongService({required this.uid});

  //final user = UserService(uid: AuthService().getUser().uid).getUser();
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addSongs({
    required String name,
    required String albumName,
  }) async {
    DocumentReference documentReferencer =
        userCollection.doc(uid).collection('songs').doc();

    Map<String, dynamic> data = {
      "name": name,
      "albumName": albumName,
      // "uid": uid,
      // "username": user.username
      //"songID": songID
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes List added to the Song"))
        .catchError((e) => print(e));
  }

  Future<void> updateSong({
    required String name,
    required String albumName,
    // required int songID,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        userCollection.doc(uid).collection('songs').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "albumName": albumName,

      ///"songID": songID,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note List updated in the Song"))
        .catchError((e) => print(e));
  }

  Future<void> deleteList({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        userCollection.doc(uid).collection('songs').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note List deleted from the Song'))
        .catchError((e) => print(e));
  }

  List<Song> songListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot document) {
      print("in list");
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      print(data.length);
      return Song(
        album: data['album'] ?? '',
        name: data['name'] ?? '',
        // uid: data['uid'] ?? '',
        // username: data['username'] ?? '',
        // songID: data['songId'] ?? 0,
        docID: document.reference.id,
      );
    }).toList();
  }

  Stream<List<Song>> get songs {
    CollectionReference songListCollection =
        userCollection.doc(uid).collection('songs');
    print(songListCollection);
    return songListCollection.snapshots().map(songListFromSnapshot);
  }
}
