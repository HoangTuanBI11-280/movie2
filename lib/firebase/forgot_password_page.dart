import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/firebase/component_textfield.dart';
import 'package:movie2/helper/responsive.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    final email = _emailController.text.trim();

    if(email.isEmpty){
      //Show dialog when email empty
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text('Bitch, enter your email address.'),
          );
        }
      );
      return;
    }

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        },
      );
    }
     
    on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/draft/forgot.png',
                height: responsive.isMobile()
                    ? responsive.width(100)
                    : responsive.width(8),
                width: responsive.isMobile()
                    ? responsive.width(100)
                    : responsive.width(8),
              ),
              SizedBox(height: 30),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hey whore, remember the password next time',
                        style: GoogleFonts.silkscreen(
                            color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25),

              //username textfield
              MyTextField(
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              SizedBox(height: 25),

              MaterialButton(
                onPressed: passwordReset,
                child: Text('Reset Password'),
                color: Colors.deepPurple[200],
              )
            ],
          ),
        ),
      ),
    );
  }
}