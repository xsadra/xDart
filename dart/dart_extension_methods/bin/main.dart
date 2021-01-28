extension StringExtentions on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]');
    return emailRegExp.hasMatch(this);
  }

  String get toEuro {
    return '$this€';
  }

  String operator &(String other) =>  '$this $other';
}

void main() {
  print("It's me!".isValidEmail);
  print('email@sadra.at'.isValidEmail);
  print('10'.toEuro);
  print('me'&'you');
}
