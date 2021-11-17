import 'package:auth_firebase/presentation/remote/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('songs');

  Future updateUserData(String album, String name, int songId) async {
    return await songCollection.doc(await AuthService().getUser()).set({
      'album': album,
      'name': name,
      'songId': songId,
    });
  }
}
