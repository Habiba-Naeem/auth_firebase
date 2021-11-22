import 'package:auth_firebase/application/song/song_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SongAdd extends StatelessWidget {
  const SongAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(builder: (context, state) {
      return Form(
        child: Column(
          children: [
            SongNameInput(),
            SongAlbumInput(),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                context.read<SongBloc>().add(AddSongButtonPressedEvent());
              },
            )
          ],
        ),
      );
    });
  }
}

class SongNameInput extends StatelessWidget {
  const SongNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(hintText: "Name"),
        onChanged: (v) {
          context.read<SongBloc>().add(NameInputEvent(input: v));
        },
      );
    });
  }
}

class SongAlbumInput extends StatelessWidget {
  const SongAlbumInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(hintText: "Album Name"),
        onChanged: (v) {
          context.read<SongBloc>().add(AlbumNameInputEvent(input: v));
        },
      );
    });
  }
}

//
// class SongAdd extends StatefulWidget {
//   @override
//   _SongAddState createState() => _SongAddState();
// }
//
// class _SongAddState extends State<SongAdd> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '';
//   String albumName = '';
//   int songId = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: <Widget>[
//           const Text(
//             'Add your favourite songs.',
//             style: TextStyle(fontSize: 18.0),
//           ),
//           const SizedBox(height: 20.0),
//           TextFormField(
//             decoration: const InputDecoration(hintText: "Name"),
//             validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
//             onChanged: (val) => setState(() => name = val),
//           ),
//           const SizedBox(height: 10.0),
//           TextFormField(
//             decoration: const InputDecoration(hintText: "Album Name"),
//             validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
//             onChanged: (val) => setState(() => albumName = val),
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//               child: const Text(
//                 'Add',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () async {
//                 await DatabaseService(uid: AuthService().getUser().uid)
//                     .addSongs(name: name, albumName: albumName, songID: songId);
//                 print(name);
//                 print(albumName);
//                 print(songId);
//               }),
//         ],
//       ),
//     );
//   }
// }
