import 'package:app_with_mobx/features/movies/store/bookmark/bookmark_store.dart';
import 'package:app_with_mobx/features/movies/store/movie/movie_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BookmarkPage extends StatelessWidget {
  final BookmarkStore bookmarkStore;
  final MoviesStore moviesStore;

  const BookmarkPage({
    super.key,
    required this.bookmarkStore,
    required this.moviesStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bookmarks Movie")),
      body: Observer(
        builder: (_) {
          final bookmarkedMovies =
              moviesStore.movies
                  .where((m) => bookmarkStore.bookmarkedIds.contains(m.id))
                  .toList();

          if (bookmarkedMovies.isEmpty) {
            return const Center(child: Text("No bookmarks yet"));
          }

          return ListView.builder(
            itemCount: bookmarkedMovies.length,
            itemBuilder: (_, index) {
              final movie = bookmarkedMovies[index];
              return ListTile(title: Text(movie.title));
            },
          );
        },
      ),
    );
  }
}
