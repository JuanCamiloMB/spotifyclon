class SpotifySong {
  final String id;
  final String songName;
  final String artistName;
  final String albumArt;
  final int popularity;

  SpotifySong({
    required this.id,
    required this.songName,
    required this.artistName,
    required this.albumArt,
    required this.popularity
  });

  // Factory method to create a SpotifySong from a JSON object
  factory SpotifySong.fromJson(Map<String, dynamic> json) {
    final track = json.containsKey('track') ? json['track'] : json;
    return SpotifySong(
      id: track['id'],
      songName: track['name'],
      artistName: track['artists'][0]['name'],
      albumArt: track['album']['images'][0]['url'],
      popularity: track['popularity']
    );
  }
}
