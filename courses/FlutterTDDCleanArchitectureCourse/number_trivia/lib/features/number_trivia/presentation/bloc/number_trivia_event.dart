import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  NumberTriviaEvent([List props = const <dynamic>[]]) : super(props);
}

class CetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  CetTriviaForConcreteNumber(this.numberString) : super([numberString]);
}

class CetTriviaForRandomNumber extends NumberTriviaEvent {}
