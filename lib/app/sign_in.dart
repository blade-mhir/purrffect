/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-004] Sign In Screen
Description: This is the Sign In screen for Purrfect. This will let the users to log-in to their
             purrfect accounts if they have an existing account created already.If the user don't
             have an account, they can be directed to the Sign-Up screen by pressing Sign-Up text button below.
 */

import 'package:flutter/material.dart'; //Import necessary packages
import 'package:purrfect/app/home.dart';
import 'package:purrfect/toolkit.dart';
import 'package:purrfect/app/sign_up.dart';

// Define a StatefulWidget class for Sign-In
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  // Override the createState method to create an instance of SignInState
  @override
  SignInState createState() => SignInState();
}
// Define the state class for SignIn widget
class SignInState extends State<SignIn> {
  // Function to navigate to the Home screen
  void navigateToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  // Function to navigate to the Sign-Up screen
  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width / baseWidth; //swf - screenWidthFactor, the ratio of the current screen width to a reference width and for fine tune layout
    double aswf = swf * 0.97; //aswf - adjustedScreenWidthFactor

    return Scaffold(// for basic structure of the app
        body: SingleChildScrollView(//to make screen scrollable
          child: Container(//for grouping and styling UI parts
            // Sign-in Page container
            width: double.infinity,
            height: 851*swf,
            decoration: const BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Container(//for grouping and styling UI parts
              // set padding for the child container
              padding: EdgeInsets.fromLTRB(0*swf, 6*swf, 0*swf, 0*swf),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration (
                color: Color(0xefffb500),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    // Container with background image
                    width: double.infinity,
                    height: 385*swf,
                    child: Stack(//to overlay multiple widgets
                      children: [
                        Positioned(// to position child widgets relative to the Stack
                          // positioning of ellipse image
                          left: 0*swf,
                          right: 0*swf,
                          top: 0*swf,
                          child: Align(
                            child: SizedBox(
                              width: 425.5*swf,
                              height: 285.2*swf,
                              child: Image.asset(
                                'assets/app/images/ellipse.png',
                              ),
                            ),
                          ),
                        ),
                        Positioned(// to position child widgets relative to the Stack
                          // Positioning Sign-in container
                          left: 25*swf,
                          top: 144*swf,
                          bottom: 0*swf,
                          child: Container(//for grouping and styling UI parts
                            width: 301*swf,
                            height: 230*swf,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(20*swf),
                            ),
                            child: Stack(
                              children: [
                                Positioned(// to position child widgets relative to the Stack
                                  // Positioning below Sign-In text
                                  left: 38.5*swf,
                                  top: 57*swf,
                                  child: Align(
                                    child: SizedBox(
                                      width: 235*swf,
                                      height: 20*swf,
                                      child: Text(
                                        'Hi, I’m Purrfect - pet care made easy.',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (// custom text style function (Google Fonts)
                                          'Nunito',
                                          fontSize: 14*aswf,
                                          fontWeight: FontWeight.w600,
                                          height: 1.7*aswf/swf,
                                          color: const Color(0xff394888),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(// to position child widgets relative to the Stack
                                  // Positioning Username Input Container
                                  left: 2*swf,
                                  top: 87*swf,
                                  child: Container(//for grouping and styling UI parts
                                    width: 299*swf,
                                    height: 43*swf,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(// to position child widgets relative to the Stack
                                          // Positioning Username Input Box
                                          left: 9*swf,
                                          top: 0*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 290*swf,
                                              height: 43*swf,
                                              child: Container(//for grouping and styling UI parts
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(20*swf),
                                                  border: Border.all(color: const Color(0xffffb90f)),
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(// to position child widgets relative to the Stack
                                          // Positioning Username Label
                                          left: 30*swf,
                                          top: 11*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 70*swf,
                                              height: 21*swf,
                                              child: Text(
                                                'Username',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (// custom text style function (Google Fonts)
                                                  'Nunito',
                                                  fontSize: 15*aswf,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.36*aswf/swf,
                                                  color: const Color(0xff888888),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(// to position child widgets relative to the Stack
                                  // Positioning Password Input Container
                                  left: 0*swf,
                                  top: 137*swf,
                                  child: Container(//for grouping and styling UI parts
                                    width: 301*swf,
                                    height: 43*swf,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(// to position child widgets relative to the Stack
                                          // Positioning Password Input Box
                                          left: 11*swf,
                                          top: 0*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 290*swf,
                                              height: 43*swf,
                                              child: Container(//for grouping and styling UI parts
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(20*swf),
                                                  border: Border.all(color: const Color(0xffffb90f)),
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(// to position child widgets relative to the Stack
                                          // Positioning the Password Label
                                          left: 31*swf,
                                          top: 12*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 68*swf,
                                              height: 21*swf,
                                              child: Text(
                                                'Password',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (// custom text style function (Google Fonts)
                                                  'Nunito',
                                                  fontSize: 15*aswf,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.36*aswf/swf,
                                                  color: const Color(0xff888888),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(// to position child widgets relative to the Stack
                                  // Positioning the Sign-In Button Container
                                  left: 11*swf,
                                  top: 0*swf,
                                  child: Container(//for grouping and styling UI parts
                                    width: 290*swf,
                                    height: 240*swf,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(//for grouping and styling UI parts
                                          // Sign-In Text Container
                                          margin: EdgeInsets.fromLTRB(0*swf, 4*swf, 0*swf, 132*swf),
                                          child: Text(
                                            'Sign In',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (// custom text style function (Google Fonts)
                                              'Nunito',
                                              fontSize: 40*aswf,
                                              fontWeight: FontWeight.w900,
                                              height: 1.59*aswf/swf,
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ),

                                        ElevatedButton(// a raised button with custom style and behavior
                                          // Sign-In Button and its Label
                                          onPressed: navigateToHomePage,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xff000000),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(21 * swf),
                                            ),
                                          ),
                                          child: Container(//for grouping and styling UI parts
                                            width: double.infinity,
                                            height: 43 * swf,
                                            padding: const EdgeInsets.only(top: 4), // Set top padding here
                                            child: Center(
                                              child: Text(
                                                'Sign In',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Nunito',
                                                  fontSize: 16 * aswf,
                                                  fontWeight: FontWeight.w900,
                                                  height: 1.36 * aswf / swf,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(//for grouping and styling UI parts
                    // Group Container
                    padding: EdgeInsets.fromLTRB(78*swf, 11*swf, 91*swf, 132*swf),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(//for grouping and styling UI parts
                          // Pet-care Image Container
                          margin: EdgeInsets.fromLTRB(0*swf, 20*swf, 0*swf, 21*swf),
                          width: 191*swf,
                          height: 228*swf,
                          child: Image.asset(
                            'assets/app/images/petcare-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(//for grouping and styling UI parts
                          // Don't Have Account Text Button Container
                          margin: EdgeInsets.fromLTRB(16*swf, 0*swf, 0*swf, 0*swf),
                          child: TextButton(//a normal button with custom text and behavior
                            onPressed: navigateToSignUp,
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: RichText(// to display styled text in different text spans
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: SafeGoogleFont (// custom text style function (Google Fonts)
                                  'Nunito',
                                  fontSize: 12*aswf,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625*aswf/swf,
                                  color: const Color(0xff000000),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Don’t have an account?',
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: SafeGoogleFont (// custom text style function (Google Fonts)
                                      'Nunito',
                                      fontSize: 12*aswf,
                                      fontWeight: FontWeight.w600,
                                      height: 1.36*aswf/swf,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: SafeGoogleFont (// custom text style function (Google Fonts)
                                      'Nunito',
                                      fontSize: 12*aswf,
                                      fontWeight: FontWeight.w800,
                                      height: 1.36*aswf/swf,
                                      color: const Color(0xff394888),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}