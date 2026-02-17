import 'package:app_with_mobx/core/domain/sort_type.dart';
import 'package:app_with_mobx/features/movies/models/movie_model.dart';
import 'package:app_with_mobx/features/movies/service/movie_service.dart';
import 'package:mobx/mobx.dart';

part 'movie_store.g.dart';

class MoviesStore = _MoviesStore with _$MoviesStore;

abstract class _MoviesStore with Store {
  final MoviesService service;

  _MoviesStore(this.service);

  @observable
  ObservableList<MovieModel> movies = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMore = false;

  @observable
  int currentPage = 1;

  @observable
  bool isLastPage = false;

  @action
  Future<void> fetchMovies({
    required String query,
    required SortType sortType,
    required int? year,
    required double? rating,
  }) async {
    if (isLoading || isLoadingMore || isLastPage) return;

    currentPage == 1 ? isLoading = true : isLoadingMore = true;

    final result =
        query.isEmpty
            ? await service.discoverMovies(
              page: currentPage,
              sortType: sortType,
              rating: rating ?? 0,
              year: year,
            )
            : await service.searchMoviesWithFilter(
              query: query,
              page: currentPage,
              minRating: rating ?? 0,
              year: year,
            );

    if (result.isEmpty) {
      isLastPage = true;
    } else {
      movies.addAll(result);
      currentPage++;
    }

    isLoading = false;
    isLoadingMore = false;
  }

  @action
  void reset() {
    currentPage = 1;
    isLastPage = false;
    movies.clear();
  }
}
