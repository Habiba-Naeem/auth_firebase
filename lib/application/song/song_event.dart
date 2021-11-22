part of 'song_bloc.dart';

@immutable
abstract class SongEvent {}

class NameInputEvent extends SongEvent {
  final String input;

  NameInputEvent({required this.input});
}

class AlbumNameInputEvent extends SongEvent {
  final String input;

  AlbumNameInputEvent({required this.input});
}

class AddSongButtonPressedEvent extends SongEvent {
  AddSongButtonPressedEvent();
}

class RemoveSongButtonPressedEvent extends SongEvent {
  final String docId;
  RemoveSongButtonPressedEvent({required this.docId});
}

class UpdateSongButtonPressedEvent extends SongEvent {
  final String docId;
  UpdateSongButtonPressedEvent({required this.docId});
}
