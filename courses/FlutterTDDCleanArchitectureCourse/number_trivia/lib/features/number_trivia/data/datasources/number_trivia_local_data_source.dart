import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString == null) {
      throw CacheException();
    }
    return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(
      CACHED_NUMBER_TRIVIA,
      json.encode(triviaToCache.toJson()),
    );
  }
}
