import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:nxl/user_repository.dart';

class AuthState {
  final bool isLoading;
  final String? errorMessage;
  AuthState({this.isLoading = false, this.errorMessage});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref; 
  AuthNotifier(this.ref) : super(AuthState());

  Future<bool> login(String email, String password) async {
  state = AuthState(isLoading: true);
  await Future.delayed(const Duration(seconds: 1)); 

  final allUsers = ref.read(userDatabaseProvider);
  
  print("Current users in DB: ${allUsers.length}");
  for (var u in allUsers) {
    print("User: ${u.email} Pwd: ${u.password}");
  }

  final matchedUser = allUsers.any((u) => 
    u.email.trim() == email.trim() && 
    u.password == password
  );

  if (matchedUser) {
    state = AuthState(isLoading: false);
    return true;
  } else {
    state = AuthState(isLoading: false, errorMessage: "Invalid email or password");
    return false;
  }
}
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});