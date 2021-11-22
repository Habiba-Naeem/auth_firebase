import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/database.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc() : super(SongState.initial());

  @override
  Stream<SongState> mapEvenToState(
    SongEvent event,
  ) async* {
    if (event is NameInputEvent) {
      yield state.copyWith(name: event.input);
    }
    if (event is AlbumNameInputEvent) {
      yield state.copyWith(albumName: event.input);
    }
    if (event is AddSongButtonPressedEvent) {
      if (AuthService().getUser() != null) {
        await DatabaseService(uid: AuthService().getUser().uid)
            .addSongs(name: state.name, albumName: state.albumName, songID: 1);
      }
    }

    if (event is RemoveSongButtonPressedEvent) {
      yield state.copyWith(docId: event.docId);
      if (AuthService().getUser() != null) {
        await DatabaseService(uid: AuthService().getUser().uid)
            .deleteList(docId: state.docId);
      }
    }

    if (event is UpdateSongButtonPressedEvent) {
      yield state.copyWith(docId: event.docId);
      if (AuthService().getUser() != null) {
        await DatabaseService(uid: AuthService().getUser().uid).updateSong(
            name: state.name,
            albumName: state.albumName,
            songID: 1,
            docId: state.docId);
      }
    }
  }
}
