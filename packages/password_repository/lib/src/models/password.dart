import 'dart:convert';

///
class Password {
  ///
  const Password({
    required this.password,
    required this.date,
    required this.name,
    required this.logo,
    required this.strength,
  });

  ///
  factory Password.fromJson(Map<String, dynamic> json) {
    return Password(
      password: json['password'] as String,
      date: json['date'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      strength: json['strength'] as int,
    );
  }

  ///
  factory Password.empty() {
    return const Password(
      password: '',
      date: '',
      name: '',
      logo: '',
      strength: 0,
    );
  }

  final String password;

  final String date;

  final String? name;

  final String? logo;

  final int? strength;

  /// copy with method for maintaining state when state changes
  Password copyWith(
      {String? password,
      String? date,
      String? logo,
      String? name,
      int? strength}) {
    return Password(
      password: password ?? this.password,
      date: date ?? this.date,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      strength: strength ?? this.strength,
    );
  }

  /// toJson transform from object to a map
  static Map<String, dynamic> toJson(Password password) {
    return {
      'password': password.password,
      'date': password.date,
      'name': password.name,
      'logo': password.logo,
      'strength': password.strength
    };
  }

  /// map closure for maps
  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'date': date,
      'name': name,
      'logo': logo,
      'strength': strength
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
