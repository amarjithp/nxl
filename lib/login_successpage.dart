import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.done_all_rounded, 
                  size: 80, 
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              
              const Text(
                "Login Successful",
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Welcome back! You have successfully accessed your account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 60),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                  child: const Text(
                    "Logout", 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}