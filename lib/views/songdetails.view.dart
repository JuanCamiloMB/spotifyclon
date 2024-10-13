import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/providers/song.provider.dart';

class SongDetailsPage extends ConsumerWidget {
  final String songId;

  const SongDetailsPage({required this.songId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songDetailsAsyncValue = ref.watch(songDetailsProvider(songId));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Song Details'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Navega hacia atrás solo si es posible
                },
              )
            : null,
      ),
      body: songDetailsAsyncValue.when(
        data: (song) {
          print(song);
          if (song != null) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the column vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center the column horizontally
                children: [
                  // Album Art
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      song['album']['images'][0]['url'], // URL for album art
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Song Title
                  Text(
                    song['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),

                  // Artist Name
                  Text(
                    song['artists'][0]['name'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Popularity Bar or Score
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thumb_up, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        'Popularity: ${song['popularity']}%',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Playback Controls (Mocked for UI)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.skip_previous,
                            size: 32, color: Colors.white),
                        onPressed: () {
                          // Previous song action
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.play_circle_filled,
                            size: 64, color: Colors.white),
                        onPressed: () {
                          // Play/pause action
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next,
                            size: 32, color: Colors.white),
                        onPressed: () {
                          // Next song action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                'Song not found',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
