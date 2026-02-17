// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookmarkStore on _BookmarkStore, Store {
  late final _$bookmarkedIdsAtom = Atom(
    name: '_BookmarkStore.bookmarkedIds',
    context: context,
  );

  @override
  ObservableSet<int> get bookmarkedIds {
    _$bookmarkedIdsAtom.reportRead();
    return super.bookmarkedIds;
  }

  @override
  set bookmarkedIds(ObservableSet<int> value) {
    _$bookmarkedIdsAtom.reportWrite(value, super.bookmarkedIds, () {
      super.bookmarkedIds = value;
    });
  }

  late final _$_BookmarkStoreActionController = ActionController(
    name: '_BookmarkStore',
    context: context,
  );

  @override
  void toggleBookmark(int movieId) {
    final _$actionInfo = _$_BookmarkStoreActionController.startAction(
      name: '_BookmarkStore.toggleBookmark',
    );
    try {
      return super.toggleBookmark(movieId);
    } finally {
      _$_BookmarkStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookmarkedIds: ${bookmarkedIds}
    ''';
  }
}
