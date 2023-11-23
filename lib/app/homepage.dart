import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final logger = Logger();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as: ${user.email!}'),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((_) {
                  Navigator.popAndPushNamed(context, '/sign_in');
                }).catchError((error) {
                  logger.e('Error signing out: $error');
                });
              },
              color: Colors.orange,
              child: const Text('Sign Out'),
            )
          ],
        )
      ),

    );
  }
}

