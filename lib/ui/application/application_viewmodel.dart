import 'package:flutter/material.dart';
import 'package:movie_demo/core/type/index_page_type.dart';
import 'package:movie_demo/ui/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationViewModel extends BaseViewModel {
  final _indexPageSubject = BehaviorSubject<int>.seeded(IndexPageType.home.index);
  Stream<int> get indexPageStream => _indexPageSubject.stream;

  final PageController pageController = PageController();

  void setIndexPage(int indexPage) {
    _indexPageSubject.add(indexPage);
    pageController.jumpToPage(_indexPageSubject.value);
  }

  List<IndexPageType> indexPageList = IndexPageType.values;

  @override
  void dispose() {
    super.dispose();
    _indexPageSubject.close();
    pageController.dispose();
  }
}
