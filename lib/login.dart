import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nxl/auth_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

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
                const SizedBox(height: 80),
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -1),
                ),
                const Text(
                  "Sign in to continue",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 50),

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
                  validator: (value) => value!.contains('@') ? null : "Enter a valid email",
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
                  validator: (value) => value!.length < 6 ? "Password too short" : null,
                ),

                if (authState.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(authState.errorMessage!, 
                      style: const TextStyle(color: Colors.redAccent, fontSize: 13)),
                  ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {}, 
                    child: const Text("Forgot Password?", style: TextStyle(color: Colors.black54)),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: authState.isLoading 
                    ? const Center(child: CircularProgressIndicator(color: Colors.black))
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await ref.read(authProvider.notifier).login(
                              _emailController.text.trim(), 
                              _passwordController.text,
                            );
                            if (success && mounted) {
                              Navigator.pushReplacementNamed(context, '/success');
                            }
                          }
                        },
                        child: const Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                        children: [
                          TextSpan(text: "Don't have an account? "),
                          TextSpan(text: "Register", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
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