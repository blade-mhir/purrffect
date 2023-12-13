/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-004] Sign In Screen
Description: This is the Sign In screen for Purrfect. This will let the users to log-in to their
             purrfect accounts if they have an existing account created already.If the user don't
             have an account, they can be directed to the Sign-Up screen by pressing Sign-Up text button below.
             If the user forgot their password, they can press the Forgot Password button so that they will be
             directed to the Forgot Password screen to reset their password.
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:purrfect/app/homepage.dart';
import 'package:purrfect/toolkit.dart';
import 'package:purrfect/app/forgot_pw.dart';

// Define a StatefulWidget class for Sign-In
class SignIn extends StatefulWidget {
  final VoidCallback showSignUp;

  const SignIn({Key? key, required this.showSignUp}) : super(key: key);

  @override
  SignInState createState() => SignInState();

  static SignInState of(BuildContext context) {
    return context.findAncestorStateOfType<SignInState>()!;
  }
}

// Define the state class for SignIn widget
class SignInState extends State<SignIn> {
  void navigateToSignUp() {
    widget.showSignUp();
  }

  // Function to navigate to the Home screen
  void navigateToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }


  final logger = Logger();

  Future<void> signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to MyHomePage on successful authentication
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );


    } on FirebaseAuthException catch (e) {
      logger.e('Error signing in: $e');

      // Show error Wrong Email/Password
      showAlertWrongEmailPassword(context);

    }
  }

  void showAlertWrongEmailPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            'Wrong Credentials',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 80,
            height: 85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Invalid email or password',
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

  // Password Controller and Stuffs
  bool _showPassword = false; // Change _obscureText to _showPassword
  bool hasInteractedPassword = false; // Separate flag for password
  final _passwordController = TextEditingController();

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
                          // to position child widgets relative to the Stack
                          // Positioning Sign-in container
                          left: 25 * swf,
                          top: 144 * swf,
                          bottom: 0 * swf,
                          child: Container(
                            //for grouping and styling UI parts
                            width: 301 * swf,
                            height: 230 * swf,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20 * swf),
                            ),
                            child: Stack(
                              children: [
                              Positioned(
                              // to position child widgets relative to the Stack
                              // Positioning below Sign-In text
                              left: 38.5 * swf,
                              top: 57 * swf,
                              child: Align(
                                child: SizedBox(
                                  width: 235 * swf,
                                  height: 20 * swf,
                                  child: Text(
                                    'Hi, I’m Purrfect - pet care made easy.',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      // custom text style function (Google Fonts)
                                      'Nunito',
                                      fontSize: 14 * aswf,
                                      fontWeight: FontWeight.w600,
                                      height: 1.7 * aswf / swf,
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
                                          4 * swf,
                                          0 * swf,
                                          16 *
                                              swf), // Adjust top margin as needed
                                      child: Text(
                                        'Sign In',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Nunito',
                                          fontSize: 37 * aswf,
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
                                      margin: const EdgeInsets.fromLTRB(0, 11, 0, 5),
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
                                                return 'Please Enter a Valid Email';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Email',
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
                                                horizontal: 20,
                                                vertical: 12,
                                              ),
                                              suffixIcon: hasInteractedEmail
                                                  ? (isEmailValid && isValidEmail(_emailController.text))
                                                  ? null  // Remove the check mark icon
                                                  : InkWell(
                                                onTap: () {
                                                  // Handle click on Info icon
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        contentPadding: const EdgeInsets.all(20.0),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(21.0),
                                                        ),
                                                        content: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 20.0,  // Adjust the height as needed
                                                              child: Text('Please enter a valid email address.'),
                                                            ),
                                                            const SizedBox(height: 20.0),  // Adjust the height as needed
                                                            SizedBox(
                                                              height: 18.0,
                                                              child: Center(
                                                                child: RichText(
                                                                  text: TextSpan(
                                                                    text: 'e.g. ',
                                                                    style: DefaultTextStyle.of(context).style,
                                                                    children: const <TextSpan>[
                                                                      TextSpan(
                                                                        text: '(name@example.com)',
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 16.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
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
                                              )
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Password Text Field
                                    Container(
                                      width: 290 * swf,
                                      height: 43 * swf,
                                      margin: const EdgeInsets.only(bottom: 17),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(21 * swf),
                                        border: Border.all(
                                          color: hasInteractedPassword
                                              ? (_passwordController
                                              .text.isNotEmpty
                                              ? const Color(0xffffd266)
                                              : Colors.red)
                                              : const Color(0xffffd266),
                                          width: 2,
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: _passwordController,
                                        obscureText: !_showPassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Your Password';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            hasInteractedPassword = true;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Password',
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
                                              color: hasInteractedPassword
                                                  ? (_passwordController
                                                  .text.isNotEmpty)
                                                  ? const Color(0xffffd266)
                                                  : Colors.red
                                                  : const Color(0xffffd266),
                                              width: 2,
                                            ),
                                          ),
                                          contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 12,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _showPassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _showPassword = !_showPassword;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Sign-In Button
                                    GestureDetector(
                                      onTap: () => signIn(context),
                                      child: ElevatedButton(
                                        onPressed: (isEmailValid &&
                                            _passwordController
                                                .text.isNotEmpty)
                                            ? () => signIn(context)
                                            : null,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: (isEmailValid &&
                                              _passwordController
                                                  .text.isNotEmpty)
                                              ? const Color(0xff000000)
                                              : Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(21 * swf),
                                          ),
                                        ),
                                        child: Container(
                                          width: 258 * swf,
                                          height: 43 * swf,
                                          padding: const EdgeInsets.only(top: 4),
                                          child: Center(
                                            child: Text(
                                              'Sign In',
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
                          left: 93 * swf,
                          top: 400 * swf,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0 * swf, 0 * swf, 0 * swf, 0 * swf),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 42.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return const ForgotPassword();
                                      }));
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: SafeGoogleFont(
                                        'Nunito',
                                        fontSize: 12 * aswf,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff394888),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 78 * swf,
                          top: 445 * swf,
                          child: SizedBox(
                            width: 200 * swf,
                            height: 228 * swf,
                            child: Image.asset(
                              'assets/app/images/petcare-1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 96.5 * swf,
                          top: 707 * swf,
                          child: GestureDetector(
                            onTap: widget.showSignUp,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 12 * aswf,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625 * aswf / swf,
                                  color: const Color(0xff000000),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Don’t have an account?',
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: SafeGoogleFont(
                                      'Nunito',
                                      fontSize: 12 * aswf,
                                      fontWeight: FontWeight.w600,
                                      height: 1.36 * aswf / swf,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: SafeGoogleFont(
                                      'Nunito',
                                      fontSize: 12 * aswf,
                                      fontWeight: FontWeight.w800,
                                      height: 1.36 * aswf / swf,
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
    ],
    ),
    ),
    ),
        ),
    );
  }
}
