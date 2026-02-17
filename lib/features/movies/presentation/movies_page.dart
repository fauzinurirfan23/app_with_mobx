import 'package:app_with_mobx/core/domain/sort_type.dart';
import 'package:app_with_mobx/features/movies/service/movie_service.dart';
import 'package:app_with_mobx/features/movies/store/movie/movie_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

import '../store/search/search_store.dart';
import '../store/filter/filter_store.dart';
import '../store/bookmark/bookmark_store.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late final MoviesStore moviesStore;
  late final SearchStore searchStore;
  late final FilterStore filterStore;
  late final BookmarkStore bookmarkStore;

  late final ReactionDisposer _reactionDisposer;

  final ScrollController _scrollController = ScrollController();
  final PublishSubject<void> _scrollSubject = PublishSubject<void>();

  @override
  void initState() {
    super.initState();

    moviesStore = MoviesStore(MoviesService());
    searchStore = SearchStore();
    filterStore = FilterStore();
    bookmarkStore = BookmarkStore();

    /// 🔥 Reaction penghubung
    _reactionDisposer = reaction(
      (_) => [
        searchStore.searchQuery,
        filterStore.sortType,
        filterStore.selectedYear,
        filterStore.rating,
      ],
      (_) async {
        moviesStore.reset();
        await moviesStore.fetchMovies(
          query: searchStore.searchQuery,
          sortType: filterStore.sortType,
          year: filterStore.selectedYear,
          rating: filterStore.rating,
        );
      },
    );

    /// Initial load
    moviesStore.fetchMovies(
      query: "",
      sortType: filterStore.sortType,
      year: null,
      rating: null,
    );

    /// Scroll pagination
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        moviesStore.fetchMovies(
          query: searchStore.searchQuery,
          sortType: filterStore.sortType,
          year: filterStore.selectedYear,
          rating: filterStore.rating,
        );
      }
    });
  }

  @override
  void dispose() {
    _reactionDisposer();
    _scrollController.dispose();
    searchStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔎 SEARCH
            TextField(
              decoration: InputDecoration(
                hintText: "Search movie...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: searchStore.setSearch,
            ),

            const SizedBox(height: 16),

            /// 🎛 FILTER + SORT
            Row(
              children: [
                /// YEAR
                Observer(
                  builder: (_) {
                    return DropdownButton<int?>(
                      value: filterStore.selectedYear,
                      hint: const Text("Year"),
                      items: [
                        const DropdownMenuItem<int?>(
                          value: null,
                          child: Text("All"),
                        ),
                        ...List.generate(20, (index) {
                          final year = DateTime.now().year - index;
                          return DropdownMenuItem<int?>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }),
                      ],
                      onChanged: filterStore.setYear,
                    );
                  },
                ),

                const SizedBox(width: 20),

                /// SORT
                Observer(
                  builder: (_) {
                    return DropdownButton<SortType>(
                      value: filterStore.sortType,
                      items: const [
                        DropdownMenuItem(
                          value: SortType.none,
                          child: Text("Default"),
                        ),
                        DropdownMenuItem(
                          value: SortType.descending,
                          child: Text("High → Low"),
                        ),
                        DropdownMenuItem(
                          value: SortType.ascending,
                          child: Text("Low → High"),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          filterStore.setSort(value);
                        }
                      },
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// 🎬 MOVIE LIST
            Expanded(
              child: Observer(
                builder: (_) {
                  if (moviesStore.isLoading && moviesStore.currentPage == 1) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        moviesStore.movies.length +
                        (moviesStore.isLoadingMore ? 1 : 0),
                    itemBuilder: (_, index) {
                      if (index == moviesStore.movies.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final movie = moviesStore.movies[index];
                      final isBookmarked = bookmarkStore.isBookmarked(movie.id);

                      return ListTile(
                        title: Text(movie.title),
                        subtitle: Text(
                          movie.releaseDate.isNotEmpty
                              ? movie.releaseDate.substring(0, 4)
                              : "-",
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.bookmark,
                            color: isBookmarked ? Colors.amber : Colors.grey,
                          ),
                          onPressed: () {
                            bookmarkStore.toggleBookmark(movie.id);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
