import 'package:auth_firebase/application/song/song_bloc.dart';
import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:auth_firebase/presentation/songs/song_add.dart';
import 'package:auth_firebase/presentation/songs/song_update.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/song_service.dart';
import 'package:auth_firebase/domain/songs/song.dart';
import 'package:auth_firebase/remote/users_service.dart';
import 'package:auth_firebase/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SongsScreen extends StatelessWidget {
  static const String id = 'songs';
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _addSongPanel(context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: MultiProvider(providers: [
              BlocProvider(create: (_) => SongBloc()),
              FutureProvider<UserModel>(
                create: (_) => UserService(uid: AuthService().getUser().uid)
                    .getUser(),
                initialData: UserModel(age: 0, bio: '', uid: '', username: '', docId: ''),
              ),
            ], child: SongAdd()),
          );
        },
      );
    }

//return BlocBuilder<SongBloc, SongState>(builder: (context, state) {
    return StreamProvider<List<Song>>.value(
      initialData: [],
      //catchError: (_, __) => null,
      value: SongService(uid: Provider.of<UserModel>(context).uid).songs,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Provider.of<UserModel>(context).username),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SongsList(),
              ElevatedButton(
                child: const Text("Add your favourite songs"),
                onPressed: () => _addSongPanel(context),
              ),
              
            ],
          ),
        ),
        bottomNavigationBar: BottomNav(),
      ),
    );
    //  });
  }
}

class SongsList extends StatefulWidget {
  const SongsList({Key? key}) : super(key: key);

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final songs = Provider.of<List<Song>>(context);
    print(SongService(uid: Provider.of<UserModel>(context).uid).songs);
    print('songs:${songs}');
    print('user: ${user}');
    void _updateSongPanel(context, docID) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: BlocProvider(
              create: (context) => SongBloc(),
              child: SongUpdate(docID: docID),
            ),
          );
        },
      );
    }

    return BlocBuilder<SongBloc, SongState>(builder: (context, state) {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: songs.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                child: ListTile(
                  //leading: Text(songs[index].songID.toString()),
                  title: Text(songs[index].name),
                  subtitle: Text(songs[index].album),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => {
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () =>
                                _updateSongPanel(context, songs[index].docID),
                          ),
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => {
                          // context.read<SongBloc>().add(
                          //     RemoveSongButtonPressedEvent(
                          //         docId: songs[index].docID))
                           SongService(uid: user.uid).deleteList(docId: 
                           songs[index].docID)
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
