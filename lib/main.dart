import 'package:chat/Screens/chat_screen.dart';
import 'package:chat/Screens/signin_screen.dart';
import 'package:chat/Screens/register_screen.dart';
import 'package:chat/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: _auth.currentUser != null ? '/chat_screen' :'/welcome_screen',
      routes: {
        '/welcome_screen':(context)=>const WelcomeScreen(),
        '/register_screen':(context)=>const RegisterScreen(),
        '/sign_screen':(context)=>const SignInScreen(),
        '/chat_screen':(context)=>const ChatScreen(),
      },
    );
  }
}
