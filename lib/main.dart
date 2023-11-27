import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:purrfect/auth/main_page.dart';
import 'package:purrfect/app/sign_in.dart';
import 'package:purrfect/app/sign_up.dart';
import 'package:purrfect/app/homepage.dart';
import 'package:purrfect/app/vet_appointment.dart';
import 'app/groomer_appointment.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();

	final logger = Logger(); // Create an instance of Logger

	try {
		Platform.isAndroid
				? await Firebase.initializeApp(
			options: const FirebaseOptions(
				apiKey: "AIzaSyA6l_DmIH5NFDzxOtt5njxAn2FCgquiCzU",
				appId: "1:387385958695:android:bc12202a671d61cfd8c902",
				messagingSenderId: "387385958695",
				projectId: "purrfect-f2e24",
			),
		)
				: await Firebase.initializeApp();
	} catch (e) {
		logger.e('Error initializing Firebase: $e'); // Use logger instead of print
	}

	runApp(const Purrfect());
}


class Purrfect extends StatelessWidget {
	const Purrfect({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			initialRoute: '/', // Set the initial route to the home route
			routes: {
				//'/': (context) => const VetAppointment(),
				'/': (context) => const GroomerAppointment(),
				// '/': (context) => const MainPage(), // Home route
				// '/sign_in': (context) => SignIn(showSignUp: () {
				// 	Navigator.pushReplacementNamed(context, '/sign_up');
				// }), // Pass the toggleScreens callback
				// '/sign_up': (context) => SignUp(showSignIn: () {
				// 	Navigator.pushReplacementNamed(context, '/sign_in');
				// }), // Pass the toggleScreens callback
				// '/home': (context) => const MyHomePage(),
			},
		);
	}
}

