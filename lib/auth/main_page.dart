/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature:
Description: This dart file serves as the entry point to the application, determining whether to display the
             authentication page or the home page based on the user's authentication state. The MainPage class
             is responsible for constructing the overall structure of the application. If the user is not signed
             in (user == null), the AuthPage is displayed, directing the user to the authentication page
             to sign in or sign up. If the user is signed in, the MyHomePage is displayed, providing access to the main features of the application.
             This code forms an essential part of the Purrfect application, ensuring a seamless transition between the
             authentication process and the main functionality of the app.

 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purrfect/app/homepage.dart';
import 'package:purrfect/auth/auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          User? user = snapshot.data;

          if (user == null) {
            // User is not signed in, navigate to SignIn screen
            return const AuthPage();
          } else {
            // User is signed in, navigate to HomePage
            return const MyHomePage();
          }
        },
      ),
    );
  }
}
