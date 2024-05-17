import 'package:chat/Widgets/button_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'images/message.png',
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              'MessageMe',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF4196f8)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ButtonWidget(
              title: 'Sign in',
              color: 0XFF4196f8,
              onPressed: () => Navigator.pushNamed(context, '/sign_screen'),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ButtonWidget(
              title: 'Register',
              color: 0XFF67d7fe,
              onPressed: () => Navigator.pushNamed(context, '/register_screen'),
            ),
          ),
        ],
      ),
    );
  }
}
