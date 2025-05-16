import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:movie/Log/home_page.dart';
// import 'package:movie/Log/log_in_register.dart';
// import 'package:movie/Log/login_page.dart';
import 'package:movie2/firebase/login_register_page.dart';
import 'package:movie2/screen/User_screen.dart';

class AuthPage extends StatelessWidget{
  static const String routeName = '/authpage';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          // user is logged in 
          if(snapshot.hasData){
            return UserScreen();
          }

          //user isn't logged in
          else {
            return LogInRegisterPage();
          }
        },
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}