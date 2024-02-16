import 'package:dio/dio.dart';
import 'package:flutter_api/data/source/api/api_service.dart';
import 'package:flutter_api/data/source/db/bookmark_database.dart';
import 'package:flutter_api/presentation/providers/bookmark_provider.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
final Dio dio = Dio();

void setupLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService(dio));
  locator.registerLazySingletonAsync<BookmarkDatabase>(() async {
    final database = await $FloorBookmarkDatabase
        .databaseBuilder('bookmark_database.db')
        .build();
    return database;
  });

  locator.registerLazySingleton<BookmarkProvider>(() {
    return BookmarkProvider(locator<BookmarkDatabase>());
  });
}