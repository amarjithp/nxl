import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nxl/user_repository.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});
  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -1),
                ),
                const Text(
                  "Fill in your details to get started",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  ),
                  validator: (value) => value!.isEmpty ? "Enter your name" : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  ),
                  validator: (value) => value!.contains('@') ? null : "Invalid email",
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  ),
                  validator: (value) => value!.length < 6 ? "Minimum 6 characters" : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  ),
                  validator: (value) => value != _passwordController.text ? "Passwords do not match" : null,
                ),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      final String inputEmail = _emailController.text.trim();
                      final String inputPassword = _passwordController.text;

                      if (_formKey.currentState!.validate()) {
                        if (inputEmail.isEmpty) {
                          print("DEBUG: Email controller is empty!");
                          return; 
                        }

                        final newUser = UserAccount(
                          name: _nameController.text.trim(),
                          email: inputEmail,
                          password: inputPassword,
                        );

                        ref.read(userDatabaseProvider.notifier).update((state) {
                          final updatedList = [...state, newUser];
                          print("--- SAVED DATA CHECK ---");
                          print("Saved Email: '${newUser.email}'");
                          print("Saved Pwd: '${newUser.password}'");
                          return updatedList;
                        });

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Register", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                        children: [
                          TextSpan(text: "Already have an account? "),
                          TextSpan(text: "Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}