import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/providers/topSongs.provider.dart';

class TopSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopSongsScreen(),
    );
  }
}

class TopSongsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topSongsAsyncValue = ref.watch(spotifySongsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Songs'),
      ),
      body: 
      topSongsAsyncValue.when(
        data: (songs) {
          print(songs);
          // `songs` is now dynamic (List<dynamic> or List<Map<String, dynamic>>)
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (BuildContext context, int index) {
              final song = songs as Map<String, dynamic>; //TYPE NULL IS NOT A SUBTYPE OF TYPE MAP<STRING, DYNAMIC> IN TYPE CAST
              // Assuming song is a Map with a 'name' field
              final songName = song; // Fallback if 'name' is missing
              return Container(
                height: 50,
                color: Colors.green, // Example of using index to determine color
                child: Center(child: Text('Entry $songName')),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()), // Loading state
        error: (error, stack) => Center(child: Text('Error: $error')), // Error state
      ),
    );
  }
}