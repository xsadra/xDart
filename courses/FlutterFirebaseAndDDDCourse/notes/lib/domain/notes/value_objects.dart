import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes/domain/core/failures.dart';
import 'package:notes/domain/core/value_objects.dart';
import 'package:notes/domain/core/value_transformers.dart';
import 'package:notes/domain/core/value_validators.dart';

//? Step 43: create [NoteBody, TodoName, TodoColor, List3] entities
//? Step 44: create [makeColorOpaque] to remove opacity from colors
//? Step 45: use [KtList] instead of [List] from package [kt_dart]
class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1024;

  factory NoteBody(String input) {
    assert(input != null);
    return NoteBody._(
      // validateMaxStringLength(input, maxLength).flatMap(
      //     (valueFromPreviousFunc) =>
      //         validateStringNotEmpty(valueFromPreviousFunc)),
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoName(String input) {
    assert(input != null);
    return TodoName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  @override
  final Either<ValueFailure<Color>, Color> value;
  static const List<Color> predefinedColors = [
    Color(0xffcdcdcd),
    Color(0xff895b88),
    Color(0xff936ecb),
    Color(0xffdc817a),
    Color(0xff6d7ed2),
    Color(0xff598497),
    Color(0xff769052),
    Color(0xff556d3a),
    Color(0xff998c68),
    Color(0xffffa200),
  ];

  factory NoteColor(Color input) {
    assert(input != null);
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory List3(KtList<T> input) {
    assert(input != null);
    return List3._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull => length == maxLength;
}
