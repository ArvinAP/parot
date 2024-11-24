import 'package:activity_1/button.dart';
import 'package:activity_1/dashboard.dart';
import 'package:activity_1/signup.dart';
import 'package:activity_1/textfield.dart';
import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('PAROT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  const SizedBox(height: 18),
                  CustomTextField(
                    hintText: 'Enter Email',
                    controller: emailController,
                    variant: TextFieldVariant.email,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Enter Password',
                    controller: passwordController,
                    variant: TextFieldVariant.password,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    label: 'Login',
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;

                      if (!email.contains('@')) {
                        _showMessage(context, 'Please enter a valid email');
                      } else if (password.length < 9) {
                        _showMessage(
                            context, 'Password must be at least 9 characters');
                      } else
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardPage()));
                    },
                    variant: ButtonVariant.primary,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    label: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    variant: ButtonVariant.secondary,
                  )
                ],
              ),
            )));
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
