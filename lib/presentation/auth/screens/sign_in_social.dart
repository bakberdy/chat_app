import 'package:chat_app/presentation/auth/screens/sign_in_email.dart';
import 'package:chat_app/presentation/auth/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

class SignInSocial extends StatelessWidget {
  const SignInSocial({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: Color(0xffF7F7F9),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.12),
                Center(
                  child: RichText(
                      text: TextSpan(
                          style: themeData.textTheme.bodyMedium?.copyWith(
                              fontSize: 60, fontWeight: FontWeight.w700),
                          children: [
                        TextSpan(text: 'Talky'),
                        TextSpan(
                            text: '.',
                            style: TextStyle(color: themeData.primaryColor))
                      ])),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.10),
                CustomFilledButton(
                  svgIconPath: 'lib/assets/icons/iconGoogle.svg',
                  title: 'Sign in with Google',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 15),
                CustomFilledButton(
                  svgIconPath: 'lib/assets/icons/Facebook.svg',
                  title: 'Sign in with Facebook',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 15),
                CustomFilledButton(
                  svgIconPath: 'lib/assets/icons/Apple.svg',
                  title: 'Sign in with Apple',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Divider(
                          thickness: 1,
                          color: themeData.canvasColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'or',
                        style: themeData.textTheme.bodyMedium
                            ?.copyWith(color: themeData.canvasColor, height: 1),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Divider(
                          thickness: 1,
                          color: themeData.canvasColor,
                        )),
                  ],
                ),
                SizedBox(height: 30),
                CustomFilledButton(
                    title: 'Continue with email',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInEmail()));
                    },
                    backgroundColor: Colors.white),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text(
                  'Already have an account?',
                  style: themeData.textTheme.bodySmall,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in here',
                      style: themeData.textTheme.bodyMedium
                          ?.copyWith(color: themeData.primaryColor, fontWeight: FontWeight.w600),
                    )),
                    SizedBox(height: 30,)
              ],
            ),
          ),
        ));
  }
}
