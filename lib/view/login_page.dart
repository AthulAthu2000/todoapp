import 'package:flutter/material.dart';
import 'package:techyspot/view/signin_page.dart';
import 'package:techyspot/view/todo_view.dart';
import 'package:techyspot/view/constants/colors.dart';
import 'package:techyspot/view/constants/measursement.dart';
import 'package:techyspot/view/constants/textstyle.dart';
import 'package:techyspot/view/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: AppTextStyles.contentstyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.height(context) * 0.03),
            CustomTextField(
              controller: _usernameController,
              label: 'Email',
              icon: Icons.email,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,

              obscureText: true,
              label: 'Password',
              icon: Icons.lock,
            ),
            SizedBox(height: AppSize.height(context) * 0.05),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TodoView()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: AppColors.iconcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Login', style: AppTextStyles.mainButtonstyle),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: AppTextStyles.hintstyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninPage(),
                      ),
                    );
                  },
                  child: Text("SignIn"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
