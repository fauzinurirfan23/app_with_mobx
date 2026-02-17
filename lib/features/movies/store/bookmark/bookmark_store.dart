import 'package:mobx/mobx.dart';

part 'bookmark_store.g.dart';

class BookmarkStore = _BookmarkStore with _$BookmarkStore;

abstract class _BookmarkStore with Store {
  @observable
  ObservableSet<int> bookmarkedIds = ObservableSet();

  @action
  void toggleBookmark(int movieId) {
    if (bookmarkedIds.contains(movieId)) {
      bookmarkedIds.remove(movieId);
    } else {
      bookmarkedIds.add(movieId);
    }
  }

  bool isBookmarked(int movieId) {
    return bookmarkedIds.contains(movieId);
  }
}
