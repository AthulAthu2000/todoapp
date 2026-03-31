import 'package:flutter/material.dart';
import 'package:techyspot/view/constants/colors.dart';
import 'package:techyspot/view/constants/textstyle.dart';
import 'package:techyspot/view/widgets/custom_textfield.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "Sign up",
                style: AppTextStyles.contentstyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              CustomTextField(
                controller: _nameController,
                label: 'Enter your full name',
                icon: Icons.person_2_outlined,
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                label: 'Enter Your Email',
                keyboardType: TextInputType.phone,
                icon: Icons.email,
              ),

              SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: _obscurePassword,
                icon: Icons.lock,
                Suffixicon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: _confirmpassController,
                label: 'Confirm Password',
                keyboardType: TextInputType.number,
                obscureText: true,
                icon: Icons.lock,
                Suffixicon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              SizedBox(height: 35),

              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: AppColors.iconcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'SignIn',
                  style: AppTextStyles.mainButtonstyle,
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTextStyles.hintstyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _submitForm() {
    if (_nameController.text.isEmpty) {
      _showErrorSnackBar('Please enter your full name');
      return;
    }
    if (_phoneController.text.isEmpty) {
      _showErrorSnackBar('Please enter your phone number');
      return;
    }

    if (_passwordController.text.isEmpty) {
      _showErrorSnackBar('Please enter your password');
      return;
    }
    if (_passwordController.text.length < 6) {
      _showErrorSnackBar('Password must be at least 6 characters');
      return;
    }
    if (_confirmpassController.text.isEmpty) {
      _showErrorSnackBar('Please enter a PIN');
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Processing Data')));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmpassController.dispose();
    super.dispose();
  }
}
