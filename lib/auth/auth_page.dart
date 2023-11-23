/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: Sign In and Sign Up Authentication Page
Description: This dart file implements the authentication page, allowing users to either sign in or sign up.
             The user interface dynamically switches between the Sign In and Sign Up screens based on the value of the 'showSignIn' variable.
             The AuthPage class, which is a StatefulWidget, manages the state of the authentication page.
             It has a method named 'toggleScreens' that toggles the value of 'showSignIn', triggering a state update to switch between
             the Sign In and Sign Up screens. The build method of AuthPage conditionally returns either the SignIn or SignUp widget
             based on the 'showSignIn' variable. It passes the 'toggleScreens' method to the respective widget,
             enabling the user to switch between Sign In and Sign Up screens seamlessly.
 */

import 'package:flutter/material.dart';
import 'package:purrfect/app/sign_in.dart';
import 'package:purrfect/app/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSignIn = true;

  void toggleScreens(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(showSignUp: toggleScreens);
    }else{
      return SignUp(showSignIn: toggleScreens);
    }
  }

}

