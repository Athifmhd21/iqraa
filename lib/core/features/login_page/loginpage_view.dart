import 'package:flutter/material.dart';
import 'package:iqraa/core/features/userlist/userlist_view.dart';
import 'package:iqraa/core/features/login_page/loginpage_viewmodel.dart';
import 'package:iqraa/widgets/customtextfield.dart';
import 'package:provider/provider.dart';
import 'package:iqraa/widgets/customHeader.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomHeader(title: "LOGIN"),

                /// Email Field
                CustomTextField(
                  label: "Email",
                  controller: provider.emailController,
                  validator: provider.validateEmail,
                ),

                const SizedBox(height: 16),

                /// Password Field
                CustomTextField(
                  label: "Password",
                  controller: provider.passwordController,
                  validator: provider.validatePassword,
                ),

                const SizedBox(height: 24),

                /// Login Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => UserListScreen()),
                      );
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
