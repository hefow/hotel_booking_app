import 'package:flutter/material.dart';
import 'package:frontend/screans/bottom_navigation.dart';
import 'package:frontend/screans/register.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await _authService.login(
            _emailController.text, _passwordController.text);

        // Check if the response contains a token
        if (response['token'] != null) {
          // Store token in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', response['token']);

          // Navigate to BottomNavigation
          Get.to(() => const BottomNavigation());

          // Show login success message after navigation
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login successful...")),
          );
        } else {
          // Handle case where token is not returned
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login failed, no token returned")),
          );
        }
      } catch (error) {
        // Handle error, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $error")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 24),

                  // Welcome Text
                  const Text(
                    'Welcome Back to\nHotel.co',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'We are happy to see you again!\nThank you for choosing Us again',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
                  ),
                  const SizedBox(height: 16),

                  // Forgot Password Link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF8B7EF8),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle login
                          _login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B7EF8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'SignIn',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Social Login Text

                  Row(
                    children: [
                      const Center(
                        child: Text(
                          'if you do not have acount',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const Register());
                          },
                          child: const Text("register?"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
