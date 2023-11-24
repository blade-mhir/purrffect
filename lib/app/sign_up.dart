/* Authored by: Blademhir U. Ferrer
Company: Vertex Labs
Project: Purrfect
Feature: [PRFT-005] Sign Up Screen
Description: This is the Sign Up screen for Purrfect. This will let the users to create their
             Purrfect accounts, this will ask them to input necessary details for account creation.
             If the user already have an existing account, they can be directed to Sign-In screen
             by pressing Sign-In text button below.

 */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; //Import necessary packages
import 'package:logger/logger.dart';
import 'package:purrfect/app/homepage.dart';
import 'package:purrfect/toolkit.dart';

// Define a StatefulWidget class for Sign-Up
class SignUp extends StatefulWidget {
  final VoidCallback showSignIn;
  const SignUp({Key? key,required this.showSignIn}) : super(key: key);

  // Override the createState method to create an instance of SignUpState
  @override
  SignUpState createState() => SignUpState();
}

// Define the state class for SignUp widget
class SignUpState extends State<SignUp> {

  //text controllers
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _mnumController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _mnumController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  final logger = Logger();

  Future signUp(BuildContext context) async {
    try {
      UserCredential authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (mounted) {
        String uid = authResult.user?.uid ?? ''; // Extracting user UID
        addUserDetails(
          _nameController.text.trim(),
          _addressController.text.trim(),
          _mnumController.text.trim(),
          _usernameController.text.trim(),
          _emailController.text.trim(),
          uid: uid, // Pass the UID to addUserDetails
        );

        // Navigate to MyHomePage on successful account creation
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      }
    } catch (e) {
      logger.e('Error signing up: $e');

      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        // Show error Snackbar for email already in use
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This email is already associated with another account. Please use a different email. ',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }

  }


  Future addUserDetails(String name, String address, String mobilenum, String username, String email, {required String uid}) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'address': address,
        'mobile number': mobilenum,
        'username': username,
        'email': email,
        'uid': uid,
      });

      if (mounted) {
        // Navigate to MyHomePage on successful account creation
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      }
    } catch (e) {
      logger.e('Error adding user details: $e');
    }
  }



    // Form Stuffs
    bool isNameValid = true;
    bool isAddressValid = true;
    bool isMobileNumValid = true;
    bool isUsernameValid = true;
    bool isEmailValid = true;
    bool hasInteractedEmail = false; // Separate flag for email

    // Function to check if the email has a valid format
    bool isValidEmail(String email) {
      // Simple email validation using a regular expression
      final emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
      return emailRegex.hasMatch(email);
    }

    // Password Controller and Stuffs
    bool _showPassword = false;
    bool _showConfirmPassword = false;



    bool passwordMatch = false;
    bool hasInteractedPassword = false; // Separate flag for password

    bool isPasswordValid(String password) {
      return password.length >= 8;
    }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width /
        baseWidth; //swf - screenWidthFactor, the ratio of the current screen width to a reference width and for fine tune layout

    double aswf = swf * 0.97; //aswf - adjustedScreenWidthFactor
    return Scaffold(
        // provides the basic app structure
        body: SingleChildScrollView(
      // to make the screen scrollable
        child: Container(
          // for grouping and styling parts of the UI
          // Main Container for Sign Up Page
          width: double.infinity,
          height: 885 * swf,
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
                  width: 425.5 * swf,
                  height: 590 * swf,
                  child: Stack(
                    // for grouping and styling the parts of the UI
                    children: [
                      Positioned(
                        // to precisely position child widgets relative to the Stack
                        // Background Ellipse Image
                        left: 0 * swf,
                        top: 0 * swf,
                        child: Align(
                          child: SizedBox(
                            width: 360 * swf,
                            height: 267.2 * swf,
                            child: Image.asset(
                              //to display image
                              'assets/app/images/ellipse.png',
                              width: 360 * swf,
                              height: 267.2 * swf,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // Sign-Up Form Input Container
                        left: 23 * swf,
                        top: 248 * swf,
                        child: Container(
                          width: 305 * swf,
                          height: 400 * swf,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20 * swf),
                          ),

                          child: Column(
                            children: [

                              //Name Text Field
                              Container(
                                width: 290 * swf,
                                height: 43 * swf,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21 * swf),
                                  border: Border.all(
                                    color: isNameValid ? const Color(0xffffd266) : Colors.red,
                                  ),
                                ),
                                child: TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Name* (Surname, First Name, M.I.)',
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
                                        color: isNameValid ? const Color(0xffffd266) : Colors.red,
                                        width: 3,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isNameValid = value.isNotEmpty;
                                    });
                                  },
                                ),
                              ),

                              //Home Address Text Field
                              Container(
                                width: 290 * swf,
                                height: 43 * swf,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21 * swf),
                                  border: Border.all(
                                    color: isAddressValid ? const Color(0xffffd266) : Colors.red,
                                  ),
                                ),
                                child: TextField(
                                  controller: _addressController,
                                  decoration: InputDecoration(
                                    hintText: 'Home Address*',
                                    hintStyle: const TextStyle(
                                      color: Color(0xff888888),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21 * swf),
                                      borderSide: const BorderSide(
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21 * swf),
                                      borderSide: BorderSide(
                                        color: isAddressValid ? const Color(0xffffd266) : Colors.red,
                                        width: 3,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isAddressValid = value.isNotEmpty;
                                    });
                                  },
                                ),
                              ),

                              //Mobile Number Text Field
                              Container(
                                width: 290 * swf,
                                height: 43 * swf,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21 * swf),
                                  border: Border.all(
                                    color: isMobileNumValid ? const Color(0xffffd266) : Colors.red,
                                  ),
                                ),
                                child: TextField(
                                  controller: _mnumController,
                                  keyboardType: TextInputType.phone, // Set the input type to phone
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number*',
                                    hintStyle: const TextStyle(
                                      color: Color(0xff888888),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21 * swf),
                                      borderSide: const BorderSide(
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21 * swf),
                                      borderSide: BorderSide(
                                        color: isMobileNumValid ? const Color(0xffffd266) : Colors.red,
                                        width: 3,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isMobileNumValid = value.isNotEmpty;
                                    });
                                  },
                                ),
                              ),

                              // Email Address Text Field
                              Container(
                                width: 290 * swf,
                                height: 43 * swf,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21 * swf),
                                  border: Border.all(
                                    color: hasInteractedEmail
                                        ? (isEmailValid && isValidEmail(_emailController.text))
                                        ? const Color(0xffffd266)
                                        : Colors.red
                                        : const Color(0xffffd266),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Your Email';
                                        } else if (!isValidEmail(value)) {
                                          return 'Please Enter a Valid Email';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Email*',
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
                                            width: 3,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 12,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          hasInteractedEmail = true;
                                          isEmailValid = isValidEmail(value);
                                        });
                                      },
                                    ),
                                    Visibility(
                                      visible: hasInteractedEmail && !(isEmailValid && isValidEmail(_emailController.text)),
                                      child: Positioned(
                                        right: 13, // Adjust the position as needed
                                        top: 12,  // Adjust the position as needed
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

                              // Username Text Field
                              Container(
                                width: 290 * swf,
                                height: 43 * swf,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21 * swf),
                                  border: Border.all(
                                    color: isUsernameValid ? const Color(0xffffd266) : Colors.red,
                                  ),
                                ),
                                child: TextField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Username*',
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
                                        color: isUsernameValid ? const Color(0xffffd266) : Colors.red,
                                        width: 3,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isUsernameValid = value.isNotEmpty;
                                    });
                                  },
                                ),
                              ),

                              // Password Text Field
                              Container(
                                width: 290 * swf,
                                height: 43 * swf,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21 * swf),
                                  border: Border.all(
                                    color: hasInteractedPassword
                                        ? (_passwordController.text.isNotEmpty &&
                                        (passwordMatch && isPasswordValid(_passwordController.text))
                                        ? const Color(0xffffd266)
                                        : Colors.red)
                                        : const Color(0xffffd266),
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
                                      passwordMatch = value == _confirmPasswordController.text;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Password*',
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
                                        color: hasInteractedPassword
                                            ? (_passwordController.text.isNotEmpty &&
                                            (passwordMatch && isPasswordValid(_passwordController.text))
                                            ? const Color(0xffffd266)
                                            : Colors.red)
                                            : const Color(0xffffd266),
                                        width: 3,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showPassword ? Icons.visibility : Icons.visibility_off,
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

                              // Confirm Password Text Field
                              Container(
                                width: 290 * swf,
                                height: 43 * swf,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21 * swf),
                                  border: Border.all(
                                    color: hasInteractedPassword
                                        ? (passwordMatch && isPasswordValid(_confirmPasswordController.text)
                                        ? const Color(0xffffd266)
                                        : Colors.red)
                                        : const Color (0xffffd266), // Initial border color (gray)
                                  ),
                                ),
                                child: TextField(
                                  controller: _confirmPasswordController,
                                  obscureText: !_showConfirmPassword,
                                  onChanged: (value) {
                                    setState(() {
                                      passwordMatch = value == _passwordController.text;
                                      hasInteractedPassword = true; // User has interacted with this field
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password*',
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
                                        color: hasInteractedPassword
                                            ? (passwordMatch && isPasswordValid(_confirmPasswordController.text)
                                            ? const Color(0xffffd266)
                                            : Colors.red)
                                            : const Color(0xffffd266), // Initial border color (gray)
                                        width: 3,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showConfirmPassword = !_showConfirmPassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // to precisely position child widgets relative to the Stack
                        // Sign-Up Header
                        left: 45 * swf,
                        top: 140 * swf,
                        child: SizedBox(
                          width: 268 * swf,
                          height: 95 * swf,
                          child: Stack(
                            // for grouping and styling the parts of the UI
                            children: [
                              Positioned(
                                // to precisely position child widgets relative to the Stack
                                // Sign-Up Description
                                left: 36 * swf,
                                top: 60 * swf,
                                child: Align(
                                  child: SizedBox(
                                    width: 198 * swf,
                                    height: 40 * swf,
                                    child: Text(
                                      'Sign up to experience the best \npet care in town.',
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
                                // to precisely position child widgets relative to the Stack
                                // Create Account Title
                                left: 0 * swf,
                                top: 0 * swf,
                                child: Align(
                                  child: SizedBox(
                                    width: 268 * swf,
                                    height: 52 * swf,
                                    child: Text(
                                      'Create Account',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        //custom text style function (Google Fonts)
                                        'Nunito',
                                        fontSize: 36 * aswf,
                                        fontWeight: FontWeight.w900,
                                        height: 2 * aswf / swf,
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
                  padding: EdgeInsets.fromLTRB(
                      35 * swf, 30 * swf, 32 * swf, 163 * swf),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // Sign-up Button
                        margin: EdgeInsets.fromLTRB(0 * swf, 0 * swf, 3 * swf, 11 * swf),
                        child: GestureDetector(
                          onTap: () {
                            if (isPasswordValid(_passwordController.text) &&
                                _passwordController.text == _confirmPasswordController.text &&
                                isNameValid &&
                                isAddressValid &&
                                isEmailValid &&
                                isUsernameValid) {
                              signUp(context);
                            }
                          },
                          child: ElevatedButton(
                            onPressed: (isPasswordValid(_passwordController.text) &&
                                _passwordController.text == _confirmPasswordController.text &&
                                isNameValid &&
                                isAddressValid &&
                                isEmailValid &&
                                isUsernameValid)
                                ? () => signUp(context)
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: (isPasswordValid(_passwordController.text) &&
                                  _passwordController.text == _confirmPasswordController.text &&
                                  isNameValid &&
                                  isAddressValid &&
                                  isEmailValid &&
                                  isUsernameValid)
                                  ? const Color(0xff000000) // Enabled color
                                  : Colors.grey, // Disabled color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21 * swf),
                              ),
                            ),
                            child: SizedBox(
                              width: 290 * swf,
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
                          ),
                        ),
                      ),

                      Container(
                        // Have an Account Text Button
                        margin: EdgeInsets.fromLTRB(
                            0 * swf, 0 * swf, 3 * swf, 0 * swf),

                        child: GestureDetector(
                          onTap: widget.showSignIn,
                          child: TextButton(
                            onPressed: null, // The GestureDetector handles the onTap functionality
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: SafeGoogleFont(
                                  'Nunito',
                                  fontSize: 12 * aswf,
                                  fontWeight: FontWeight.w600,
                                  height: 1.36 * aswf / swf,
                                  color: const Color(0xff000000),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Have',
                                  ),
                                  TextSpan(
                                    text: ' an account? ',
                                    style: SafeGoogleFont(
                                      'Nunito',
                                      fontSize: 12 * aswf,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3625 * aswf / swf,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign in',
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
