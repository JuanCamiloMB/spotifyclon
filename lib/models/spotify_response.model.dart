class SpotifyResponse {
  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  Followers followers;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  bool isPublic;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  SpotifyResponse({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.owner,
    required this.isPublic,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
  });

  factory SpotifyResponse.fromJson(Map<String, dynamic> json) {
    return SpotifyResponse(
      collaborative: json['collaborative'],
      description: json['description'],
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      followers: Followers.fromJson(json['followers']),
      href: json['href'],
      id: json['id'],
      images: List<Image>.from(json['images'].map((i) => Image.fromJson(i))),
      name: json['name'],
      owner: Owner.fromJson(json['owner']),
      isPublic: json['public'],
      snapshotId: json['snapshot_id'],
      tracks: Tracks.fromJson(json['tracks']),
      type: json['type'],
      uri: json['uri'],
    );
  }
}

class ExternalUrls {
  String spotify;

  ExternalUrls({required this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json['spotify'],
    );
  }
}

class Followers {
  String? href;
  int total;

  Followers({this.href, required this.total});

  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
      href: json['href'],
      total: json['total'],
    );
  }
}

class Image {
  String url;
  int height;
  int width;

  Image({required this.url, required this.height, required this.width});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}

class Owner {
  ExternalUrls externalUrls;
  Followers followers;
  String href;
  String id;
  String type;
  String uri;
  String displayName;

  Owner({
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
    required this.displayName,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      followers: Followers.fromJson(json['followers']),
      href: json['href'],
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
      displayName: json['display_name'],
    );
  }
}

class Tracks {
  String href;
  int limit;
  String? next;
  int offset;
  String? previous;
  int total;
  List<TrackItem> items;

  Tracks({
    required this.href,
    required this.limit,
    this.next,
    required this.offset,
    this.previous,
    required this.total,
    required this.items,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
      href: json['href'],
      limit: json['limit'],
      next: json['next'],
      offset: json['offset'],
      previous: json['previous'],
      total: json['total'],
      items: List<TrackItem>.from(
          json['items'].map((i) => TrackItem.fromJson(i))),
    );
  }
}

class TrackItem {
  String addedAt;
  AddedBy addedBy;
  bool isLocal;
  Track track;

  TrackItem({
    required this.addedAt,
    required this.addedBy,
    required this.isLocal,
    required this.track,
  });

  factory TrackItem.fromJson(Map<String, dynamic> json) {
    return TrackItem(
      addedAt: json['added_at'],
      addedBy: AddedBy.fromJson(json['added_by']),
      isLocal: json['is_local'],
      track: Track.fromJson(json['track']),
    );
  }
}

class AddedBy {
  ExternalUrls externalUrls;
  Followers followers;
  String href;
  String id;
  String type;
  String uri;

  AddedBy({
    required this.externalUrls,
    required this.followers,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) {
    return AddedBy(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      followers: Followers.fromJson(json['followers']),
      href: json['href'],
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
    );
  }
}

class Track {
  Album album;
  List<Artist> artists;
  int discNumber;
  int durationMs;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  bool isPlayable;
  String name;
  int popularity;
  String previewUrl;
  int trackNumber;
  String type;
  String uri;

  Track({
    required this.album,
    required this.artists,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalIds,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isPlayable,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      album: Album.fromJson(json['album']),
      artists: List<Artist>.from(
          json['artists'].map((a) => Artist.fromJson(a))),
      discNumber: json['disc_number'],
      durationMs: json['duration_ms'],
      explicit: json['explicit'],
      externalIds: ExternalIds.fromJson(json['external_ids']),
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      isPlayable: json['is_playable'],
      name: json['name'],
      popularity: json['popularity'],
      previewUrl: json['preview_url'],
      trackNumber: json['track_number'],
      type: json['type'],
      uri: json['uri'],
    );
  }
}

class Album {
  String albumType;
  int totalTracks;
  List<String> availableMarkets;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  String type;
  String uri;

  Album({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.type,
    required this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumType: json['album_type'],
      totalTracks: json['total_tracks'],
      availableMarkets: List<String>.from(json['available_markets']),
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      images: List<Image>.from(json['images'].map((i) => Image.fromJson(i))),
      name: json['name'],
      releaseDate: json['release_date'],
      releaseDatePrecision: json['release_date_precision'],
      type: json['type'],
      uri: json['uri'],
    );
  }
}

class Artist {
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String type;
  String uri;

  Artist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      externalUrls: ExternalUrls.fromJson(json['external_urls']),
      href: json['href'],
      id: json['id'],
      name: json['name'],
      type: json['type'],
      uri: json['uri'],
    );
  }
}

class ExternalIds {
  String isrc;
  String ean;
  String upc;

  ExternalIds({
    required this.isrc,
    required this.ean,
    required this.upc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) {
    return ExternalIds(
      isrc: json['isrc'],
      ean: json['ean'],
      upc: json['upc'],
    );
  }
}
