import 'package:auth_firebase/remote/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('songs');

  // Future updateUserData(String name, String album, int songId) async {
  //   return await songCollection.doc(uid).set({
  //     'name': name,
  //     'album': album,
  //     'songId': songId,
  //   });
  // }

  Future<void> addSongs(
      {required String name,
      required String albumName,
      required int songID}) async {
    DocumentReference documentReferencer =
        songCollection.doc(uid).collection('list').doc();

    Map<String, dynamic> data = {
      "name": name,
      "albumName": albumName,
      "songID": songID
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes List added to the database"))
        .catchError((e) => print(e));
  }

  Future<void> updateSong({
    required String name,
    required String albumName,
    required int songID,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        songCollection.doc(uid).collection('list').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "albumName": albumName,
      "songID": songID,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note List updated in the database"))
        .catchError((e) => print(e));
  }

  Future<void> deleteList({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        songCollection.doc(uid).collection('list').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note List deleted from the database'))
        .catchError((e) => print(e));
  }

  List<Song> songListFromSnapshot(QuerySnapshot snapshot) {
    print(snapshot.docs.length);
    return snapshot.docs.map((DocumentSnapshot document) {
      print("docu");
      print(document.reference.id);
      print(document.data());
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      return Song(
        album: data['album'] ?? '',
        name: data['name'] ?? '',
        songID: data['songId'] ?? 0,
        docID: document.reference.id,
      );
    }).toList();
  }

  Stream<List<Song>> get songs {
    CollectionReference songListCollection =
        songCollection.doc(uid).collection('list');

    return songListCollection.snapshots().map(songListFromSnapshot);
  }
}
