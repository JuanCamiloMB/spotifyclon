import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/providers/spotify_accesstoken.provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

// Define a provider for the access token


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccessTokenScreen(),
    );
  }
}

class AccessTokenScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the access token provider
    final accessTokenAsyncValue = ref.watch(accessTokenProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Access Token with Riverpod'),
      ),
      body: Center(
        child: accessTokenAsyncValue.when(
          data: (accessToken) => Text('Access Token: $accessToken'),
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}
