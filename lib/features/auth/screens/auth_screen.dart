import 'package:ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:ecommerce_app/constants/globalvarialble.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset('assets/images/auth.png'),
          Text(
            'Welcome',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          ListTile(
            title: const Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
              activeColor: GlobalVariables.secondaryColor,
              value: Auth.signup,
              groupValue: _auth,
              onChanged: (Auth? val) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
          if (_auth == Auth.signup)
            Form(
              key: _signUpFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                  )
                ],
              ),
            ),
          ListTile(
            title: const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
              activeColor: GlobalVariables.secondaryColor,
              value: Auth.signin,
              groupValue: _auth,
              onChanged: (Auth? val) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
        ],
      )),
    );
  }
}
