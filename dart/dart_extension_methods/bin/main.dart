extension StringExtentions on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]');
    return emailRegExp.hasMatch(this);
  }

  String get toEuro {
    return '$this€';
  }

  String operator &(String other) => '$this $other';

  String join(String other) {
    return '$this $other';
  }
}

extension NumGenericExtentions<T extends num> on T {
  String get toEuro => '$this€';
}

void main() {
  print("It's me!".isValidEmail);
  print('email@sadra.at'.isValidEmail);
  print('10'.toEuro);
  print('me' & 'you');
  print('me'.join('you'));
  print(10.toEuro);
  print(10.5.toEuro);
}
