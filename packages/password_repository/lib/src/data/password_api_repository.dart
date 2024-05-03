import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:password_repository/password_repository.dart';
import 'package:password_repository/src/models/password.dart';

///
class PasswordApiProvider {
  ///
  Future<List<Password>> getPasswords() async {
    try {
      final user = getCurrentUser();
      if (user != null) {
        final database = FirebaseDatabase.instance.ref();
        final snapshot =
        await database.child('users/${user.uid}/passwords').get();

        if (snapshot.value != null) {
          final passwords = <Password>[];
          for (final item in snapshot.value! as List) {
            final password = Password(
              password: item['password'] as String,
              date: item['date'] as String,
            );
            passwords.add(password);
          }
          return passwords;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to load inventories');
    }
  }

  ///
  User? getCurrentUser() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception('Failed to get user');
    }
  }

  ///
  Future<void> savePassword(String password,
      String date,) async {
    try {
      final user = getCurrentUser();
      if (user != null) {
        final database = FirebaseDatabase.instance;
        final snapshot = await database
            .ref()
            .child('users/${user.uid}/passwords')
            .get();

        final passwordSave = {
          'password': password,
          'date': date,
        };

        if (snapshot.value != null) {
          final passwords = <Map<String, dynamic>>[];
          for (final item in snapshot.value! as List) {
            final password = {
              'password': item['password'] as String,
              'date': item['date'] as String,
            };
            passwords.add(password);
          }
          passwords.add(passwordSave);
          await database
              .ref('users/${user.uid}')
              .update({'passwords': passwords});
        } else {
          await database.ref('users/${user.uid}').set({
            'passwords': [passwordSave],
          });
        }
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(e);
      }
      print('Error: $e Stacktrace: $stacktrace');

      throw Exception('Failed to add password locally');
    }
  }
}
