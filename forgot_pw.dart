/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-029] Forgot Password Screen
Description: This is the Forgot Password Screen for Purrfect. The screen is designed to facilitate the
             process of resetting a user's password. Users are prompted to enter the email associated
             with their account. The logic in the passwordReset function then checks whether the provided
             email is registered. If the email is associated with an existing account, a password reset
             email is sent using Firebase authentication. Success and error messages are displayed through
             SnackBars to provide immediate feedback to the user. The UI features a visually appealing design
             with a background image, a back button for navigation, and input fields for email entry.
             Additionally, the program incorporates form validation to ensure that the entered email follows a valid format.
 */
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> passwordReset(BuildContext context) async {
    try {
      String email = _emailController.text.trim();
      logger.e('Email: $email');

      // Introduce a slight delay (e.g., 1000 milliseconds)
      await Future.delayed(const Duration(milliseconds: 1000));

      // Reference to the Firestore collection (replace 'users' with your collection name)
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Check if the email exists in the Firestore collection
      QuerySnapshot querySnapshot = await users.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Email is registered, send password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        logger.d('Password reset email sent to $email');

        // Show success Link Sent to Email
        showAlertSentToEmail(context);

      } else {
        // Email is not registered
        logger.e('Email $email is not registered.');

        // Show error Not Registered Email
        showAlertUnregisteredEmail(context);

      }
    } on FirebaseAuthException catch (e) {
      logger.e('Error resetting password: $e');

      // Show error Reset Pass Failed
      showAlertResetFailed(context);
    }
  }

  void showAlertSentToEmail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            'Password Reset Email Sent',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 80,
            height: 142,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'A password reset link has been sent to your email. If you don''t see the email, please check your spam folder.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                // Add the OK button directly
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffb500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {
                    // User pressed OK
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }

  void showAlertUnregisteredEmail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            'Unregistered Email',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 80,
            height: 123,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'This email is not associated with any account. Please enter a registered email.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                // Add the OK button directly
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffb500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {
                    // User pressed OK
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }

  void showAlertResetFailed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            'Password Reset Error',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 80,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sorry, an error occurred while attempting to reset your password. Please try again.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                // Add the OK button directly
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffb500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {
                    // User pressed OK
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
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
      body: SingleChildScrollView(
        child: Material(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 758 * swf,
                  decoration: const BoxDecoration(
                    color: Color(0xffffb500),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
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
                              // Back Button
                              left: 12*swf,
                              top: 50*swf,
                              child: Align(
                                child: SizedBox(
                                  width: 37*swf,
                                  height: 37*swf,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Image.asset(
                                      'assets/app/images/back-button-VxR.png',
                                      width: 37*swf,
                                      height: 37*swf,
                                    ),
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
                                                      ? (isEmailValid && isValidEmail(_emailController.text))
                                                      ? const Color(0xffffd266)
                                                      : Colors.red
                                                      : const Color(0xffffd266),
                                                  width: 2,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  TextFormField(
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
                                                      hintText: 'Email', // Adjust the hintText accordingly
                                                      hintStyle: const TextStyle(
                                                        color: Color(0xff888888),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(21 * swf),
                                                        borderSide: const BorderSide(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(21 * swf),
                                                        borderSide: BorderSide(
                                                          color: hasInteractedEmail
                                                              ? (isEmailValid && isValidEmail(_emailController.text))
                                                              ? const Color(0xffffd266)
                                                              : Colors.red
                                                              : const Color(0xffffd266),
                                                          width: 2,
                                                        ),
                                                      ),
                                                      contentPadding: const EdgeInsets.symmetric(
                                                        horizontal: 21,
                                                        vertical: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: hasInteractedEmail && !(isEmailValid && isValidEmail(_emailController.text)),
                                                    child: Positioned(
                                                      right: 13, // Adjust the position as needed
                                                      top: 11,  // Adjust the position as needed
                                                      child: InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                contentPadding: const EdgeInsets.all(20.0),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(21.0),
                                                                  side: const BorderSide(color: Color(0xefffb500), width: 5.0), // Set the border color here
                                                                ),
                                                                content: const Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    SizedBox(
                                                                      height: 20.0,  // Adjust the height as needed
                                                                      child: Text('Please enter a valid email address.'),
                                                                    ),
                                                                    SizedBox(height: 5.0),  // Adjust the height as needed
                                                                    SizedBox(
                                                                      height: 18.0,  // Adjust the height as needed
                                                                      child: Center(
                                                                        child: Text('e.g. (name@example.com)'),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                actions: <Widget>[
                                                                  Center(
                                                                    child: ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.green,
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(21.0),
                                                                        ),
                                                                      ),
                                                                      onPressed: () {
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: const Text('OK'),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: const Icon(
                                                          Icons.info,
                                                          color: Colors.red,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                            Positioned(
                              left: 80 * swf,
                              top: 435 * swf,
                              child: SizedBox(
                                width: 200 * swf,
                                height: 228 * swf,
                                child: Image.asset(
                                  'assets/app/images/petcare-2.png',
                                  fit: BoxFit.cover,
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
      ),
    );
  }
}
