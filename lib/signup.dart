import 'package:activity_1/appbar.dart';
import 'package:activity_1/button.dart';
import 'package:activity_1/textfield.dart';
import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController firstnameController = TextEditingController();
final TextEditingController lastnameController = TextEditingController();

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Sign Up',
          showActions: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create an Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                  hintText: 'Enter First Name',
                  controller: firstnameController,
                  variant: TextFieldVariant.normal),
              const SizedBox(height: 16),
              CustomTextField(
                  hintText: 'Enter Last Name',
                  controller: lastnameController,
                  variant: TextFieldVariant.normal),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Enter Email Address',
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
                  label: 'Sign Up',
                  onPressed: () {
                    final firstname = firstnameController.text;
                    final lastname = lastnameController.text;
                    final email = emailController.text;
                    final password = passwordController.text;

                    if (firstname == null || firstname == '') {
                      _showMessage(context, 'Please enter your first name');
                    } else if (!email.contains('@')) {
                      _showMessage(context, 'Please enter a valid emaasil');
                    } else if (password.length < 9) {
                      _showMessage(
                          context, 'Password must be at least 9 characters');
                    } else {
                      _showMessage(
                        context,
                        'Account created successfully!',
                      );
                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.pop(context);
                      });
                    }
                  })
            ],
          )),
        ));
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
