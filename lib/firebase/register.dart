import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie2/firebase/auth_service.dart';
import 'package:movie2/firebase/button.dart';
import 'package:movie2/firebase/component_textfield.dart';
import 'package:movie2/firebase/square_title.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign user in method
  void signUserUp() async {
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
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } else {
        // show error message, password don't match
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Are u blind? Passwords don\'t match')),
        );
      }
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
                SizedBox(height: 20),
                //logo
                Icon(Icons.lock, size: 100),
                //Welcome back, you're been missed
                Center(
                  child: Text(
                    'Register, esapel gnis pu cithb',
                    style: GoogleFonts.wavefont(
                      color: Colors.green.shade500,
                      fontSize: 50,
                    ),
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

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                SizedBox(height: 25),

                //sign in button
                MyButton(
                  onTap: signUserUp,
                  text: 'Sign Up',
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
                      imagePath: 'assets/images/user/image9.png',
                      onTap: () => AuthService().signInWithGoogle(),
                    ),

                    SizedBox(width: 25),
                    //apple button
                    SquareTile(
                      imagePath: 'assets/images/user/image10.png',
                      onTap: () {},
                    ),
                  ],
                ),

                SizedBox(height: 30),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now',
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