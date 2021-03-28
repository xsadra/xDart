import 'package:number_trivia/core/util/input_converter.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc.dart';

import 'failures.dart';

extension FailureExtension on Failure {
  String get toMessage {
    switch (this.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case InvalidInputFailure:
        return INVALID_INPUT_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
