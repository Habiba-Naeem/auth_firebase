import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/database.dart';
import 'package:flutter/material.dart';

class SongUpdate extends StatefulWidget {
  final String docID;

  const SongUpdate({Key? key, required this.docID}) : super(key: key);
  @override
  _SongUpdateState createState() => _SongUpdateState();
}

class _SongUpdateState extends State<SongUpdate> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String albumName = '';
  int songId = 0;

  @override
  Widget build(BuildContext context) {
    print("in updatae docid");

    print(widget.docID);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const Text(
            'Update your favourite song.',
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            decoration: const InputDecoration(hintText: "Name"),
            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => name = val),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            decoration: const InputDecoration(hintText: "Album Name"),
            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => albumName = val),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await DatabaseService(uid: AuthService().getUser()).updateSong(
                    name: name,
                    albumName: albumName,
                    songID: songId,
                    docId: widget.docID);
                print(name);
                print(albumName);
                print(songId);
              }),
        ],
      ),
    );
  }
}
