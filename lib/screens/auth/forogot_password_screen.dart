import 'package:flutter/material.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/constants/auth_validators.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

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
  void initState() {
    _emailcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailcontroller.dispose();
    }
    super.dispose();
  }

  Future<void> _forgetPassword() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
   // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppNameText(),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                Assets.imagesForgotPassword,
                //width: size.width * 0.6,
                // height: size.height * 0.6,
              ),
              const SizedBox(
                height: 16,
              ),
              const TitleText(label: 'Forgot password'),
              const SubTitleText(
                label: 'Please enter the email you used to register',
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailcontroller,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'enter your email',
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                      ),
                      validator: (email) {
                        return AuthValidators.emailValidator(email);
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _forgetPassword();
                  },
                  label: const TitleText(label: 'Request link'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
