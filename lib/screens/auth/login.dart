import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/constants/auth_validators.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordlController;
  late final FocusNode _emailFoucsNode;
  late final FocusNode _passwordFoucsNode;
  late final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordlController = TextEditingController();
    _emailFoucsNode = FocusNode();
    _passwordFoucsNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordlController.dispose();
    _emailFoucsNode.dispose();
    _passwordFoucsNode.dispose();

    super.dispose();
  }

  Future<void> _login() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 16,
              ),
              const AppNameText(
                fontSize: 30,
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TitleText(label: 'Welcome Back'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SubTitleText(label: 'Lets back to shop'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFoucsNode,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'enter your email',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                      validator: (email) {
                        return AuthValidators.emailValidator(email);
                      },
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordFoucsNode);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _passwordlController,
                      focusNode: _passwordFoucsNode,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'enter your password',
                        prefixIcon: Icon(
                          Icons.password,
                        ),
                      ),
                      validator: (password) {
                        return AuthValidators.passWordValidator(password);
                      },
                      onFieldSubmitted: (value) {
                        _login();
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const SubTitleText(
                          label: 'Forgot Password ?',
                          textDecoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Colors.green,
                        ),
                        icon: const Icon(
                          Icons.login,
                          color: AppColors.lightScafoldColor,
                        ),
                        onPressed: () {},
                        label: const SubTitleText(
                          label: 'Login',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightScafoldColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TitleText(label: 'OR CONNECT USING'),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            backgroundColor: Colors.grey,
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                          label: const SubTitleText(
                            label: 'Sign in with google',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightScafoldColor,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              backgroundColor: Colors.grey,
                            ),
                            onPressed: () {},
                            child: const SubTitleText(
                              label: 'Guest ?',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightScafoldColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SubTitleText(label: 'Don`t have an account?'),
                        TextButton(
                          onPressed: () {},
                          child: const SubTitleText(
                            label: 'Sign up',
                            textDecoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
