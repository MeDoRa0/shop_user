import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/constants/auth_validators.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.pickedImage});
  final XFile? pickedImage;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

  Future<void> _signup() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      if (widget.pickedImage == null) {
        AppMethods.alertDialog(
            context: context, label: 'please pick image', function: () {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _userNameController,
            focusNode: _userNameFoucsNode,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'enter your username',
              prefixIcon: Icon(
                Icons.person,
              ),
            ),
            validator: (userName) {
              return AuthValidators.userNameValidator(userName);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_emailFoucsNode);
            },
          ),
          const SizedBox(
            height: 16,
          ),
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
            obscureText: obscureText,
            controller: _passwordlController,
            focusNode: _passwordFoucsNode,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
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
              FocusScope.of(context).requestFocus(_confrimPasswordFoucsNode);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: obscureText,
            controller: _confirmPasswordlController,
            focusNode: _confrimPasswordFoucsNode,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              ),
              hintText: 'confirm your password',
              prefixIcon: const Icon(
                Icons.lock,
              ),
            ),
            validator: (repeatPassord) {
              return AuthValidators.repeatPasswordValidator(
                  repeatPassword: repeatPassord,
                  password: _passwordlController.text);
            },
            onFieldSubmitted: (value) {
              _signup();
            },
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: Colors.blue,
              ),
              icon: const Icon(
                Icons.person_add,
                color: AppColors.lightScafoldColor,
              ),
              onPressed: () {
                _signup();
              },
              label: const SubTitleText(
                label: 'Sign Up',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.lightScafoldColor,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SubTitleText(label: 'already have an account'),
              TextButton(
                onPressed: () {},
                child: const SubTitleText(
                  label: 'Sign in',
                  textDecoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
