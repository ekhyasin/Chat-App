import 'package:chat/Firebase/firebase_auth.dart';
import 'package:chat/Widgets/button_widget.dart';
import 'package:chat/Widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _textEmailEditingController;

  late TextEditingController _textPasswordEditingController;
  bool showSnack = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEmailEditingController=TextEditingController();
    _textPasswordEditingController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
   _textEmailEditingController.dispose();
   _textPasswordEditingController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSnack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/message.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldWidget(
              textEditingController: _textEmailEditingController,
              obscure: false,
              hint: 'Enter Your Email',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldWidget(
              textEditingController: _textPasswordEditingController,
              obscure: true,
              hint: 'Enter Your Password',
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ButtonWidget(
                title: 'Register',
                color: 0XFF67d7fe,
                onPressed: () async {
                  setState(() {
                    showSnack=true;
                  });
                  bool register = await FbAuthController().createAccount(
                      email: _textEmailEditingController.text,
                      password: _textPasswordEditingController.text,
                      context: context);
                  if (register) {
                    Navigator.pop(context);
                    setState(() {
                      showSnack=false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
