import 'package:flutter/material.dart';
import 'package:food_delivery_project/pages/register_page.dart';
import 'package:food_delivery_project/pages/login_page.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initially, show login page
  bool showLoginInPage = true;


  //toggle  between login and register page
  void togglePages() {
    setState(() {
      showLoginInPage = !showLoginInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginInPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
