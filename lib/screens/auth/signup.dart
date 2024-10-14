import 'package:flutter/material.dart';
import 'package:shop_user/widgets/app_name_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordlController;
  late final TextEditingController _confirmPasswordlController;
  late final FocusNode _userNameFoucsNode;
  late final FocusNode _emailFoucsNode;
  late final FocusNode _passwordFoucsNode;
  late final FocusNode _confrimPasswordFoucsNode;

  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  void initState() {
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordlController = TextEditingController();
    _confirmPasswordlController = TextEditingController();
    _userNameFoucsNode = FocusNode();
    _emailFoucsNode = FocusNode();
    _passwordFoucsNode = FocusNode();
    _confrimPasswordFoucsNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordlController.dispose();
    _confirmPasswordlController.dispose();
    _emailFoucsNode.dispose();
    _passwordFoucsNode.dispose();
    _userNameController.dispose();
    _userNameFoucsNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 64,
            ),
            AppNameText(),
          ],
        ),
      ),
    );
  }
}
