import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber * 10) + 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    List<BookEntity> books = box.values.toList();
    int length = books.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return books.sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber * 10) + 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    List<BookEntity> books = box.values.toList();
    int length = books.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return books.sublist(startIndex, endIndex);
  }
}
