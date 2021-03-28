import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:number_trivia/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  /// [params] contain a number
  Future<Either<Failure, Type>> call({@required Params params});
}

class NoParams extends Equatable {}
