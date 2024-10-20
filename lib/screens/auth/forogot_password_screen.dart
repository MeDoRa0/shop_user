import 'package:flutter/material.dart';

class ForogotPasswordScreen extends StatefulWidget {
  const ForogotPasswordScreen({super.key});
  static const routName = '/ForgotPassword';
  @override
  State<ForogotPasswordScreen> createState() => _ForogotPasswordScreenState();
}

class _ForogotPasswordScreenState extends State<ForogotPasswordScreen> {
  late final TextEditingController _emailcontroller;
  late final _formkey = GlobalKey<FormState>();
  @override
  void setState(VoidCallback fn) {
    _emailcontroller = TextEditingController();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
