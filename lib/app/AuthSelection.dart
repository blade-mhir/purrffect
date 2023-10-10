import 'package:flutter/material.dart';
import 'package:purrfect/app/sign_in.dart';
import 'package:purrfect/app/sign_up.dart';

class AuthSelection extends StatefulWidget {
  const AuthSelection({super.key});

  @override
  _AuthSelectionState createState() => _AuthSelectionState();
}

class _AuthSelectionState extends State<AuthSelection> {
  void navigateToLoginAuth() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  void navigateToRegisterAuth() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/app/images/illustration1.png',
                width: 307,
                height: 318,
                fit: BoxFit.contain,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  'A purrfect place to find the best pet care for your pets',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: navigateToRegisterAuth,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFB90F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 43,
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: navigateToLoginAuth,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(
                            color: Color(0xFFFFB90F),
                            width: 2,
                          )),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 43,
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Color(0xFFFFB90F),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
    );
  }
}
