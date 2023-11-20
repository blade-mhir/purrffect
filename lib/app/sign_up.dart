/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-005] Sign Up Screen
Description: This is the Sign Up screen for Purrfect. This will let the users to create their
             purrfect accounts, this will ask them to inout necessary details for account creation.
             If the user already have an existing account, they can be directed to Sign-In screen
             by pressing Sign-In text button below.

 */

import 'package:flutter/material.dart'; //Import necessary packages
import 'package:purrfect/app/sign_in.dart';
import 'package:purrfect/toolkit.dart';

// Define a StatefulWidget class for Sign-Up
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  // Override the createState method to create an instance of SignUpState
  @override
  SignUpState createState() => SignUpState();
}

// Define the state class for SignUp widget
class SignUpState extends State<SignUp> {
  // Function to navigate to the Sign In screen
  void navigateToSignIn() {
    Navigator.push(// to navigate to another screen
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width / baseWidth; //swf - screenWidthFactor, the ratio of the current screen width to a reference width and for fine tune layout

    double aswf = swf * 0.97; //aswf - adjustedScreenWidthFactor
    return Scaffold( // provides the basic app structure
        body: SingleChildScrollView( // to make the screen scrollable
          child: Container(// for grouping and styling parts of the UI
          // Main Container for Sign Up Page
          width: double.infinity,
          height: 851 * swf,
          decoration: const BoxDecoration(
          color: Color(0xffffffff),
            ),
            child: Container(
              // Container for Sign-Up Form
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
              color: Color(0xefffb500),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(
                  // Group Container for Image
                  width: 425.5*swf,
                  height: 558*swf,
                  child: Stack(// for grouping and styling the parts of the UI
                  children: [
                    Positioned(// to precisely position child widgets relative to the Stack
                      // Background Ellipse Image
                      left: 0*swf,
                      top: 0*swf,
                      child: Align(
                        child: SizedBox(
                          width: 360*swf,
                          height: 267.2*swf,
                          child: Image.asset(//to display image
                            'assets/app/images/ellipse.png',
                            width: 360*swf,
                            height: 267.2*swf,
                          ),
                        ),
                      ),
                    ),
                    Positioned(// to precisely position child widgets relative to the Stack
                      // Sign-Up Form Input Container
                      left: 23*swf,
                      top: 248*swf,
                      child: Container(
                        width: 305*swf,
                        height: 292*swf,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(20*swf),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // Group Container for First Name, Last Name, Address
                              padding: EdgeInsets.fromLTRB(7*swf, 0*swf, 0*swf, 7*swf),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // First Name Input Container
                                    margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 0*swf, 6*swf),
                                    width: 297*swf,
                                    height: 43*swf,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Stack(// for grouping and styling the parts of the UI
                                      children: [
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // First Name Input Box
                                          left: 7*swf,
                                          top: 0*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 290*swf,
                                              height: 43*swf,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(20*swf),
                                                  border: Border.all(color: const Color(0xffffb90f)),
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // First Name Label
                                          left: 27.5*swf,
                                          top: 11*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 75*swf,
                                              height: 21*swf,
                                              child: Text(
                                                'First Name',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (//custom text style function (Google Fonts)
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
                                  Container(
                                    // Last Name Input Container
                                    width: double.infinity,
                                    height: 43*swf,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Stack(// for grouping and styling the parts of the UI
                                      children: [
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // Last Name Input box
                                          left: 8*swf,
                                          top: 0*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 290*swf,
                                              height: 43*swf,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(20*swf),
                                                  border: Border.all(color: const Color(0xffffb90f)),
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // Last Name Label
                                          left: 28*swf,
                                          top: 12*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 74*swf,
                                              height: 21*swf,
                                              child: Text(
                                                'Last Name',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (//custom text style function (Google Fonts)
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
                                ],
                              ),
                            ),
                            Container(
                              // Address Input Container
                              width: double.infinity,
                              height: 43*swf,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(20*swf),
                              ),
                              child: Stack(// for grouping and styling the parts of the UI
                                children: [
                                  Positioned(// to precisely position child widgets relative to the Stack
                                    // Address Input Box
                                    left: 15*swf,
                                    top: 0*swf,
                                    child: Align(
                                      child: SizedBox(
                                        width: 290*swf,
                                        height: 43*swf,
                                        child: Container(
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(20*swf),
                                            border: Border.all(color: const Color(0xffffb90f)),
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(// to precisely position child widgets relative to the Stack
                                    // Address Label
                                    left: 36.5*swf,
                                    top: 11*swf,
                                    child: Align(
                                      child: SizedBox(
                                        width: 57*swf,
                                        height: 21*swf,
                                        child: Text(
                                          'Address',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (//custom text style function (Google Fonts)
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
                            Container(
                              // Group Container for Email, Username, Password
                              padding: EdgeInsets.fromLTRB(5*swf, 7*swf, 0*swf, 0*swf),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // Email Input Container
                                    width: 290*swf,
                                    height: 43*swf,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: const Color(0xffffb90f)),
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Stack(// for grouping and styling the parts of the UI
                                      children: [
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // Email Input Box and Label
                                          left: 20.5*swf,
                                          top: 12*swf,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              width: 99*swf,
                                              height: 21*swf,
                                              child: Text(
                                                'Email Address',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (//custom text style function (Google Fonts)
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
                                  SizedBox(
                                    height: 7*swf,
                                  ),
                                  Container(
                                    // Username Input Container
                                    width: 299*swf,
                                    height: 43*swf,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Stack(// for grouping and styling the parts of the UI
                                      children: [
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // Username Input Box
                                          left: 9*swf,
                                          top: 0*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 290*swf,
                                              height: 43*swf,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(20*swf),
                                                  border: Border.all(color: const Color(0xffffb90f)),
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // Username Label
                                          left: 30*swf,
                                          top: 11*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 70*swf,
                                              height: 21*swf,
                                              child: Text(
                                                'Username',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (//custom text style function (Google Fonts)
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
                                  SizedBox(
                                    height: 7*swf,
                                  ),
                                  Container(
                                    // Password Input Container
                                    width: double.infinity,
                                    height: 43*swf,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(20*swf),
                                    ),
                                    child: Stack(// for grouping and styling the parts of the UI
                                      children: [
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // Password Input Box
                                          left: 10*swf,
                                          top: 0*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 290*swf,
                                              height: 43*swf,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(20*swf),
                                                  border: Border.all(color: const Color(0xffffb90f)),
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(// to precisely position child widgets relative to the Stack
                                          // Password Label
                                          left: 31*swf,
                                          top: 10*swf,
                                          child: Align(
                                            child: SizedBox(
                                              width: 68*swf,
                                              height: 21*swf,
                                              child: Text(
                                                'Password',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (//custom text style function (Google Fonts)
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(// to precisely position child widgets relative to the Stack
                      // Sign-Up Header
                      left: 45*swf,
                      top: 140*swf,
                      child: SizedBox(
                        width: 268*swf,
                        height: 95*swf,
                        child: Stack(// for grouping and styling the parts of the UI
                          children: [
                            Positioned(// to precisely position child widgets relative to the Stack
                              // Sign-Up Description
                              left: 35*swf,
                              top: 60*swf,
                              child: Align(
                                child: SizedBox(
                                  width: 198*swf,
                                  height: 40*swf,
                                  child: Text(
                                    'Sign up to experience the best \npet care in town.',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (//custom text style function (Google Fonts)
                                      'Nunito',
                                      fontSize: 14*aswf,
                                      fontWeight: FontWeight.w600,
                                      height: 0*aswf/swf,
                                      color: const Color(0xff394888),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(// to precisely position child widgets relative to the Stack
                              // Create Account Title
                              left: 0*swf,
                              top: 0*swf,
                              child: Align(
                                child: SizedBox(
                                  width: 268*swf,
                                  height: 52*swf,
                                  child: Text(
                                    'Create Account',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (//custom text style function (Google Fonts)
                                      'Nunito',
                                      fontSize: 36*aswf,
                                      fontWeight: FontWeight.w900,
                                      height: 2*aswf/swf,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
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
              Container(
                // Group Container for Sign-Up Button
                padding: EdgeInsets.fromLTRB(38*swf, 26*swf, 32*swf, 163*swf),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // Sign-Up Button
                      margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 0*swf, 11*swf),
                      child: ElevatedButton(//for a raised button with customized style and behavior
                        onPressed: navigateToSignIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20 * swf),
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 43 * swf,
                          child: Center(
                            child: Text(
                              'Sign Up',
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

                    ),
                    Container(
                      // Have an Account Text Button
                      margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 3*swf, 0*swf),
                      child: TextButton(//normal button with custom text style and behavior
                        onPressed: navigateToSignIn,
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: RichText(//to display styled text in different text spans
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: SafeGoogleFont (//custom text style function (Google Fonts)
                              'Nunito',
                              fontSize: 12*aswf,
                              fontWeight: FontWeight.w600,
                              height: 1.36*aswf/swf,
                              color: const Color(0xff000000),
                            ),
                            children: [
                              const TextSpan(
                                text: 'Have',
                              ),
                              TextSpan(
                                text: ' an account? ',
                                style: SafeGoogleFont (//custom text style function (Google Fonts)
                                  'Nunito',
                                  fontSize: 12*aswf,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625*aswf/swf,
                                  color: const Color(0xff000000),
                                ),
                              ),
                              TextSpan(
                                text: 'Sign in',
                                style: SafeGoogleFont (//custom text style function (Google Fonts)
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
    ));
  }
}