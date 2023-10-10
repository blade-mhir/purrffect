import 'package:flutter/material.dart';
import 'package:purrfect/toolkit.dart';
import 'package:purrfect/app/splash_screen.dart';
import 'package:purrfect/app/AuthSelection.dart';
import 'package:purrfect/app/sign_up.dart';
import 'package:purrfect/app/sign_in.dart';
import 'package:purrfect/app/homepage.dart';

void main() => runApp(const Purrfect());

class Purrfect extends StatelessWidget {
	const Purrfect({Key? key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter',
			debugShowCheckedModeBanner: false,
			scrollBehavior: MyCustomScrollBehavior(),
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			initialRoute: '/', // Set initial route to '/'
			routes: {
				'/': (context) => const SplashScreen(
					child: AuthSelection(),
				),
				'/sign_up': (context) => const SignUp(), // route for SignUp
				'/sign_in': (context) => const SignIn(), // route for SignIn
				'/home': (context) => const MyHomePage(), // route for HomePage
			},
		);
	}
}
