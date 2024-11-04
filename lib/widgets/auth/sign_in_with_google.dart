import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_user/constants/app_colors.dart';
import 'package:shop_user/root_screen.dart';
import 'package:shop_user/services/app_methods.dart';
import 'package:shop_user/widgets/subtitle_text.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});
  Future<void> _googleSignIn({required BuildContext context}) async {
    final googleSignin = GoogleSignIn();
    final googleAccount = await googleSignin.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            ),
          );
          WidgetsBinding.instance.addPostFrameCallback(
            (_) async {
              Navigator.pushReplacementNamed(context, RootScreen.routName);
            },
          );
        } on FirebaseException catch (error) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) async {
              await AppMethods.errorDialog(
                context: context,
                label: '${error.message}',
                function: () {},
              );
            },
          );
        } catch (error) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) async {
              await AppMethods.errorDialog(
                  context: context,
                  label: 'an error has been occured $error',
                  function: () {});
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: Colors.grey,
      ),
      icon: const FaIcon(
        FontAwesomeIcons.google,
        color: Colors.red,
      ),
      onPressed: () async {
        await _googleSignIn(context: context);
      },
      label: const SubTitleText(
        label: 'Sign in with google',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.lightScafoldColor,
      ),
    );
  }
}
