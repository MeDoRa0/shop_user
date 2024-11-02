import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/constants/auth_validators.dart';
import 'package:shop_user/root_screen.dart';
import 'package:shop_user/screens/auth/forogot_password_screen.dart';
import 'package:shop_user/screens/auth/signup.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/app_name_text.dart';
import 'package:shop_user/widgets/auth/sign_in_with_google.dart';
import 'package:shop_user/widgets/subtitle_text.dart';
import 'package:shop_user/widgets/title_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordlController;
  late final FocusNode _emailFoucsNode;
  late final FocusNode _passwordFoucsNode;
  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
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
    if (isValid) {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();

      if (isValid) {
        _formKey.currentState!.save();
        try {
          setState(() {
            isLoading = true;
          });
          await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordlController.text.trim(),
          );
          if (!mounted) return;
          Fluttertoast.showToast(
            backgroundColor: Colors.green,
            msg: "login successful",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
          );
          if (!mounted) {
            return;
          }
          Navigator.pushReplacementNamed(context, RootScreen.routName);
        } on FirebaseAuthException catch (error) {
          if (!mounted) return;
          AppMethods.errorDialog(
            context: context,
            label: 'an error ${error.message}',
            function: () {},
          );
        } catch (error) {
          if (!mounted) return;
          await AppMethods.errorDialog(
            context: context,
            label: 'an error has been occured $error',
            function: () {},
          );
        } finally {
       if(mounted){
           setState(() {
            isLoading = false;
          });
       }
        }
      }
    }
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 64,
                ),
                const AppNameText(
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  Assets.imagesBagShoppingCart,
                  height: 150,
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
                          FocusScope.of(context)
                              .requestFocus(_passwordFoucsNode);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        obscureText: obscureText,
                        controller: _passwordlController,
                        focusNode: _passwordFoucsNode,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: 'enter your password',
                          prefixIcon: const Icon(
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
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForogotPasswordScreen.routName);
                          },
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
                          onPressed: () {
                            _login();
                          },
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
                          const SignInWithGoogle(),
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
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignupScreen.routName);
                            },
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
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
