// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesStore on _MoviesStore, Store {
  late final _$moviesAtom = Atom(name: '_MoviesStore.movies', context: context);

  @override
  ObservableList<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_MoviesStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingMoreAtom = Atom(
    name: '_MoviesStore.isLoadingMore',
    context: context,
  );

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$currentPageAtom = Atom(
    name: '_MoviesStore.currentPage',
    context: context,
  );

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$isLastPageAtom = Atom(
    name: '_MoviesStore.isLastPage',
    context: context,
  );

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  late final _$fetchMoviesAsyncAction = AsyncAction(
    '_MoviesStore.fetchMovies',
    context: context,
  );

  @override
  Future<void> fetchMovies({
    required String query,
    required SortType sortType,
    required int? year,
    required double? rating,
  }) {
    return _$fetchMoviesAsyncAction.run(
      () => super.fetchMovies(
        query: query,
        sortType: sortType,
        year: year,
        rating: rating,
      ),
    );
  }

  late final _$_MoviesStoreActionController = ActionController(
    name: '_MoviesStore',
    context: context,
  );

  @override
  void reset() {
    final _$actionInfo = _$_MoviesStoreActionController.startAction(
      name: '_MoviesStore.reset',
    );
    try {
      return super.reset();
    } finally {
      _$_MoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
currentPage: ${currentPage},
isLastPage: ${isLastPage}
    ''';
  }
}
