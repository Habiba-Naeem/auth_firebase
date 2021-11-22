part of 'song_bloc.dart';
@immutable
class SongState {
  final String name;
  final String albumName;
  final int songId;

  const SongState({
    required this.name,
    required this.albumName,
    required this.songId,
  });

  factory SongState.initial() {
    return SongState(
      name: '',
      albumName: '',
      songId: 0,
    );
  }

  SongState copyWith({String? name, String? albumName, int? songId}) {
    return SongState(
        name: name ?? this.name,
        albumName: albumName ?? this.albumName,
        songId: songId ?? this.songId);
  }
}
