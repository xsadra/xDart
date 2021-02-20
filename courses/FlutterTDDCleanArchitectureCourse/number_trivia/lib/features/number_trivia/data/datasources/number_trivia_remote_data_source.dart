import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRemoteDataSource {
  ///Calls the http://numbertrivia.com/{number}?json endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<NumberTrivia> getConcreteNumberTrivia(int number);

  ///Calls the http://numbertrivia.com/random?json endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<NumberTrivia> getRandomNumberTrivia();
}
