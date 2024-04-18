import 'dart:convert';

import 'package:makalam_homework/core/error/exception.dart';
import 'package:makalam_homework/feature/data/models/page_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PageLocalDataSource {
  /// Gets the cached [PageModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present
  Future<PageModel> getLastPageFromCache();
  Future<void> pageToCache(PageModel page);
}

const cachedPage = "CACHED_PAGE";

class PageLocalDataSourceImpl implements PageLocalDataSource {
  final SharedPreferences sharedPreferences;

  PageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PageModel> getLastPageFromCache() {
    final jsonPage = sharedPreferences.getString(cachedPage);
    if (jsonPage?.isNotEmpty ?? false) {
      return Future.value(PageModel.fromJson(jsonDecode(jsonPage!)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> pageToCache(PageModel page) {
    final String jsonPage = jsonEncode(page.toJson());

    sharedPreferences.setString(cachedPage, jsonPage);
    return Future.value();
  }
}
