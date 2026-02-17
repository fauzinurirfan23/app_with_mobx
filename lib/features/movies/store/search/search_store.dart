import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final PublishSubject<String> _searchSubject = PublishSubject<String>();

  _SearchStore() {
    _searchSubject
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen((value) {
          searchQuery = value;
        });
  }

  void dispose() => _searchSubject.close();

  @observable
  String searchQuery = "";

  @action
  void setSearch(String value) {
    _searchSubject.add(value);
  }
}
