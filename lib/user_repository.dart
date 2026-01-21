import 'package:flutter_riverpod/legacy.dart';

class UserAccount {
  final String email;
  final String password;
  final String name;
  UserAccount({required this.email, required this.password, required this.name});
}

final userDatabaseProvider = StateProvider<List<UserAccount>>((ref) => [
  UserAccount(email: "test@example.com", password: "password123", name: "Test User"),
]);