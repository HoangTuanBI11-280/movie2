import 'package:flutter/material.dart';
import 'package:movie2/firebase/login_page.dart';
import 'package:movie2/firebase/register.dart';

class LogInRegisterPage extends StatefulWidget{
  LogInRegisterPage({super.key});

  @override 
  State<LogInRegisterPage> createState() => _LogInRegisterPageState();
}

class _LogInRegisterPageState extends State<LogInRegisterPage>{
  // initially show login page
  bool showLoginPage = true;

  //toggle between login and register 
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context){
    if (showLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    } else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}