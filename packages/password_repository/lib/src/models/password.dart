import 'dart:convert';

///
class Password {
  ///
  const Password({required this.password, required this.date});

  ///
  factory Password.fromJson(Map<String, dynamic> json) {
    return Password(
        password: json['password'] as String, date: json['date'] as String);
  }

  ///
  factory Password.empty() {
    return const Password(
      password: '',
      date: '',
    );
  }

  ///
  final String password;

  ///
  final String date;

  ///
  Password copyWith({String? password, String? date}) {
    return Password(
      password: password ?? this.password,
      date: date ?? this.date,
    );
  }

  /// toJson
  static Map<String, dynamic> toJson(Password password) {
    return {
      'password': password.password,
      'date': password.date
    };
  }

  ///
  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'date': date
    };
  }

  ///
  static String encode(List<Password> passwords) => json.encode(
        passwords.map<Map<String, dynamic>>(Password.toJson).toList(),
      );

  ///
  static List<Password> decode(String password) =>
      (json.decode(password) as List<dynamic>)
          .map<Password>(
            (item) => Password.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
}
