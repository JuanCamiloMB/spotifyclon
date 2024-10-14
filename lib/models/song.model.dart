class SpotifySong {
  final String id;
  final String songName;
  final String artistName;
  final String albumArt;

  SpotifySong({
    required this.id,
    required this.songName,
    required this.artistName,
    required this.albumArt,
  });

  // Factory method to create a SpotifySong from a JSON object
  factory SpotifySong.fromJson(Map<String, dynamic> json) {
    final track = json['track'];
    return SpotifySong(
      id: track['id'],
      songName: track['name'],
      artistName: track['artists'][0]['name'],
      albumArt: track['album']['images'][0]['url'],
    );
  }
}
