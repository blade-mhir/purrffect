/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-004] Sign In Screen
Description: This is the Sign In screen for Purrfect. This will let the users to log-in to their
             purrfect accounts if they have an existing account created already.If the user don't
             have an account, they can be directed to the Sign-Up screen by pressing Sign-Up text button below.
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:purrfect/toolkit.dart';

// Define a StatefulWidget class for Sign-In
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();

}

// Define the state class for SignIn widget
class _ForgotPasswordState extends State<ForgotPassword> {

  final logger = Logger();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }


  Future passwordReset(BuildContext context) async {
    try {
      String email = _emailController.text.trim();
      logger.e('Email: $email');

      List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      logger.e('Sign-in Methods: $signInMethods');

      if (signInMethods.contains('password')) {
        // Email is registered, send password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        logger.d('Password reset email sent to $email');

        // Show success Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Password reset email sent to $email',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green, // Green background for success
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        // Email is not registered
        logger.e('Email $email is not registered.');

        // Show error Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Email $email is not registered!',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red, // Red background for error
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      logger.e('Error resetting password: $e');

      // Show error Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Error resetting password. Please try again!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red, // Red background for error
          duration: Duration(seconds: 3),
        ),
      );
    }
  }


  //Email Controller and Stuffs
  final _emailController = TextEditingController(); // Email Address

  bool isEmailValid = true;
  bool hasInteractedEmail = false; // Separate flag for email

  // Function to check if the email has a valid format
  bool isValidEmail(String email) {
    // Simple email validation using a regular expression
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width /
        baseWidth; //swf - screenWidthFactor, the ratio of the current screen width to a reference width and for fine tune layout
    double aswf = swf * 0.97; //aswf - adjustedScreenWidthFactor

    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black, // Set the color of the back arrow button
          onPressed: () {
            // Navigate back to SignIn screen
            Navigator.pop(context);
          },
        ),
      ),
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      height: 851 * swf,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0 * swf, 6 * swf, 0 * swf, 0 * swf),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xefffb500),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // Container with background image
              width: double.infinity,
              height: 385 * swf,
              child: Stack(
                //to overlay multiple widgets
                children: [
                  Positioned(
                    // to position child widgets relative to the Stack
                    // positioning of ellipse image
                    left: 0 * swf,
                    right: 0 * swf,
                    top: 0 * swf,
                    child: Align(
                      child: SizedBox(
                        width: 425.5 * swf,
                        height: 285.2 * swf,
                        child: Image.asset(
                          'assets/app/images/ellipse.png',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // to position child widgets relative to the Stack
                    // Positioning Sign-in container
                    left: 25 * swf,
                    top: 144 * swf,
                    child: Container(
                      //for grouping and styling UI parts
                      width: 301 * swf,
                      height: 240 * swf,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * swf),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // to precisely position child widgets relative to the Stack
                            // Sign-Up Description
                            left: 11 * swf,
                            top: 69 * swf,
                            child: Align(
                              child: SizedBox(
                                width: 290 * swf,
                                height: 40 * swf,
                                child: Text(
                                  'Enter the email associated with your account to reset your password.',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    //custom text style function (Google Fonts)
                                    'Nunito',
                                    fontSize: 14 * aswf,
                                    fontWeight: FontWeight.w600,
                                    height: 0 * aswf / swf,
                                    color: const Color(0xff394888),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 11 * swf,
                            top: 0 * swf,
                            child: Container(
                              width: 290 * swf,
                              height: 240 * swf,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * swf),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * swf,
                                        25 * swf,
                                        0 * swf,
                                        20 *
                                            swf), // Adjust top margin as needed
                                    child: Text(
                                      'Reset your Password',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Nunito',
                                        fontSize: 29 * aswf,
                                        fontWeight: FontWeight.w900,
                                        height: 1.59 * aswf / swf,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),

                                  // Email Text Field
                                  Container(
                                    width: 300 * swf,
                                    height: 43 * swf,
                                    margin: const EdgeInsets.fromLTRB(0, 28, 0, 25),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(21 * swf),
                                      border: Border.all(
                                        color: hasInteractedEmail
                                            ? (isEmailValid &&
                                            isValidEmail(_emailController.text))
                                            ? const Color(0xffffd266)
                                            : Colors.red
                                            : const Color(0xffffd266),
                                        width: 2,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: _emailController,
                                      onChanged: (value) {
                                        setState(() {
                                          hasInteractedEmail = true;
                                          isEmailValid = isValidEmail(value);
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Your Email';
                                        } else if (!isValidEmail(value)) {
                                          // Show Snackbar when the email is not valid
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Please Enter a Valid Email'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return 'Please Enter a Valid Email';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                        'Email', // Adjust the hintText accordingly
                                        hintStyle: const TextStyle(
                                          color: Color(0xff888888),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(21 * swf),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(21 * swf),
                                          borderSide: BorderSide(
                                            color: hasInteractedEmail
                                                ? (isEmailValid &&
                                                isValidEmail(
                                                    _emailController
                                                        .text))
                                                ? const Color(0xffffd266)
                                                : Colors.red
                                                : const Color(0xffffd266),
                                            width: 2,
                                          ),
                                        ),
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                          horizontal: 21,
                                          vertical: 12,
                                        ),
                                      ),
                                    ),
                                  ),


                                  // Sign-In Button
                                  GestureDetector(
                                    onTap: () {
                                      // Check email validity and perform the action accordingly
                                      if (isEmailValid) {
                                        passwordReset(context); // Pass the context
                                      } else {
                                        // Handle invalid email, e.g., show a message
                                        // You can also prevent the action if needed
                                      }
                                    },
                                    child: ElevatedButton(
                                      onPressed: isEmailValid ? () => passwordReset(context) : null, // Set onPressed dynamically
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: isEmailValid ? const Color(0xff000000) : Colors.grey, // Change color based on validity
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(21 * swf),
                                        ),
                                      ),
                                      child: Container(
                                        width: 258 * swf,
                                        height: 43 * swf,
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Center(
                                          child: Text(
                                            'Send Link',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Nunito',
                                              fontSize: 16 * aswf,
                                              fontWeight: FontWeight.w900,
                                              height: 1 * aswf / swf,
                                              color: const Color(0xffffffff),
                                            ),
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
            Container(
              // Group Container
              padding:
                  EdgeInsets.fromLTRB(78 * swf, 11 * swf, 91 * swf, 132 * swf),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * swf, 0 * swf, 0 * swf, 0 * swf),
                  ),
                  Container(
                    //for grouping and styling UI parts
                    // Pet-care Image Container
                    margin: EdgeInsets.fromLTRB(
                        13 * swf, 25 * swf, 0 * swf, 21 * swf),
                    width: 200 * swf,
                    height: 228 * swf,
                    child: Image.asset(
                      'assets/app/images/petcare-2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
