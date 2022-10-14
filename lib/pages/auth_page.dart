import 'package:erp_login/pages/login.dart';
import 'package:erp_login/pages/signup.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget{
  @override
 _AuthPageState createState() => _AuthPageState();
  }
  class _AuthPageState extends State<AuthPage>{
    bool isLogin = true;
    
      @override
      Widget build(BuildContext context) => 
      isLogin ? LoginPage() : SignupPage();

      void toggle() => setState(() => isLogin = !isLogin);
      }

