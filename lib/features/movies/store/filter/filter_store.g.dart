// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterStore on _FilterStore, Store {
  late final _$sortTypeAtom = Atom(
    name: '_FilterStore.sortType',
    context: context,
  );

  @override
  SortType get sortType {
    _$sortTypeAtom.reportRead();
    return super.sortType;
  }

  @override
  set sortType(SortType value) {
    _$sortTypeAtom.reportWrite(value, super.sortType, () {
      super.sortType = value;
    });
  }

  late final _$selectedYearAtom = Atom(
    name: '_FilterStore.selectedYear',
    context: context,
  );

  @override
  int? get selectedYear {
    _$selectedYearAtom.reportRead();
    return super.selectedYear;
  }

  @override
  set selectedYear(int? value) {
    _$selectedYearAtom.reportWrite(value, super.selectedYear, () {
      super.selectedYear = value;
    });
  }

  late final _$ratingAtom = Atom(name: '_FilterStore.rating', context: context);

  @override
  double? get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double? value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$_FilterStoreActionController = ActionController(
    name: '_FilterStore',
    context: context,
  );

  @override
  void setSort(SortType type) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
      name: '_FilterStore.setSort',
    );
    try {
      return super.setSort(type);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYear(int? year) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
      name: '_FilterStore.setYear',
    );
    try {
      return super.setYear(year);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRating(double? value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
      name: '_FilterStore.setRating',
    );
    try {
      return super.setRating(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortType: ${sortType},
selectedYear: ${selectedYear},
rating: ${rating}
    ''';
  }
}
