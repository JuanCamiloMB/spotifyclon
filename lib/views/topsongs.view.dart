import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/providers/topSongs.provider.dart';

class TopSongs extends ConsumerWidget {
  const TopSongs({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topSongsAsyncValue = ref.watch(spotifySongsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top 50 - Global'),
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
      body: topSongsAsyncValue.when(
        data: (songs) {
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (BuildContext context, int index) {
              final song = songs[index];
              return ListTile(
                leading: Image.network(
                  song.albumArt,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  song.songName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Spotify-like style
                  ),
                ),
                subtitle: Text(
                  song.artistName,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                tileColor: Colors.black, // Background color like Spotify
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/songdetails',
                    arguments: {'songId': song.id},
                  );
                },
              );
            },
          );
        },
        loading: () =>
            Center(child: CircularProgressIndicator()), // Loading state
        error: (error, stack) =>
            Center(child: Text('Error: $error')), // Error state
      ),
    );
  }
}
