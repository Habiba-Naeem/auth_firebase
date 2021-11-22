part of 'song_bloc.dart';

@immutable
class SongState {
  final String name;
  final String albumName;
  final int songId;
  final String docId;

  const SongState({
    required this.name,
    required this.albumName,
    required this.songId,
    required this.docId,
  });

  factory SongState.initial() {
    return SongState(name: '', albumName: '', songId: 0, docId: '');
  }

  SongState copyWith({String? name, String? albumName, int? songId, String? docId}) {
    return SongState(
      name: name ?? this.name,
      albumName: albumName ?? this.albumName,
      songId: songId ?? this.songId,
      docId: docId ?? this.docId,
    );
  }
}
