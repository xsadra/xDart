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

extension UserExtentionson on User {
  String get formated => '$name is $age years old!';
}

class User {
  String name;
  int age;
  User({this.name, this.age});
}

void main() {
  print("It's me!".isValidEmail);
  print('email@sadra.at'.isValidEmail);
  print('10'.toEuro);
  print('me' & 'you');
  print('me'.join('you'));
  print(10.toEuro);
  print(10.5.toEuro);

  final user = User(name: 'Sadra', age: 26);
  print(user.formated);
}
