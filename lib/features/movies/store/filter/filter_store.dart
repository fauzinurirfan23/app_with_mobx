import 'package:app_with_mobx/core/domain/sort_type.dart';
import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  @observable
  SortType sortType = SortType.none;

  @observable
  int? selectedYear;

  @observable
  double? rating;

  @action
  void setSort(SortType type) {
    sortType = type;
  }

  @action
  void setYear(int? year) {
    selectedYear = year;
  }

  @action
  void setRating(double? value) {
    rating = value;
  }
}
