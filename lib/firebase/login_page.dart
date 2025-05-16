import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/firebase/auth_service.dart';
import 'package:movie2/firebase/button.dart';
import 'package:movie2/firebase/component_textfield.dart';
import 'package:movie2/firebase/square_title.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    // Hiển thị vòng tròn loading
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
      barrierDismissible: false,
    );

    // Kiểm tra input
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Navigator.pop(context); // Close loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email and password can\'t be blank!')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context); // Đóng loading nếu thành công
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Đóng loading nếu thất bại

      String errorMessage;
      if (e.code == 'user-not-found' ||
          e.message?.contains('auth credential is incorrect') == true) {
        errorMessage = 'No account found with this email';
      } else if (e.code == 'wrong-password' ||
          e.message?.contains('auth credential is incorrect') == true) {
        errorMessage = 'Incorrect password';
      } else {
        errorMessage = 'Login failed. Error: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                //logo
                Icon(Icons.lock, size: 100),
                SizedBox(height: 50),
                //Welcome back, you're been missed
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome ',
                          style: GoogleFonts.lobster(
                              color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: 'Indietro ',
                          style: GoogleFonts.roboto(
                              color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: 'toi ',
                          style: GoogleFonts.tangerine(
                              color: Colors.black, fontSize: 30),
                        ),
                        TextSpan(
                          text: 'ποταπός ',
                          style: GoogleFonts.pacifico(
                              color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: '売春婦 ',
                          style: GoogleFonts.delaGothicOne(
                              color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: 'гавьяатай ',
                          style: GoogleFonts.raleway(
                              color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: 'mine ',
                          style: GoogleFonts.mrDafoe(
                              color: Colors.black, fontSize: 30),
                        ),
                        TextSpan(
                          text: 'na ',
                          style: GoogleFonts.silkscreen(
                              color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: 'नरक ',
                          style: GoogleFonts.abhayaLibre(
                              color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 25),

                //username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),

                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 10),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                //sign in button
                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                ),

                SizedBox(height: 50),

                //of continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                //google+apple sign in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'assets/images/user/image9.png',
                    ),

                    SizedBox(width: 25),
                    //apple button
                    SquareTile(
                      onTap: (){},
                      imagePath: 'assets/images/user/image10.png',
                    ),
                  ],
                ),

                SizedBox(height: 30),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
