import 'package:flutter/material.dart';
import 'package:purrfect/toolkit.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


// Define a StatefulWidget class for Sign-In
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();

}

class _FeedbackScreenState extends State<FeedbackScreen> {

  final TextEditingController _textController = TextEditingController();

  String imagePath = 'assets/app/images/rectangle-6-bg.png';


  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double swf = MediaQuery.of(context).size.width / baseWidth;
    double aswf = swf * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:SingleChildScrollView(
        child: Material(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              height: 758*swf,
              decoration: const BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: [
                  //Grey Body
                  Positioned(
                    left: 0*swf,
                    top: 270*swf,
                    child: Align(
                      child: SizedBox(
                        width: 360*swf,
                        height: 580*swf,
                        child: Container(
                          decoration: BoxDecoration (
                            color: const Color(0xfff8f8f8),
                            borderRadius: BorderRadius.only (
                              topLeft: Radius.circular(20*swf),
                              topRight: Radius.circular(20*swf),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Resizable Image
                  Positioned(
                    left: 78 * swf,
                    top: 56 * swf, // Adjust the top position as needed
                    child: Align(
                      child: SizedBox(
                        width: 200 * swf,
                        height: 200 * swf, // Adjust the height as needed
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover, // Adjust the BoxFit as needed
                        ),
                      ),
                    ),
                  ),
                  //Question and Vet Label
                  Positioned(
                    left: 69*swf,
                    top: 290*swf,
                    child: SizedBox(
                      width: 232*swf,
                      height: 75*swf,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 0*swf, 4.5*swf),
                            width: double.infinity,
                            height: 52*swf,
                            child: Stack(
                              children: [
                                //How was your experience label
                                Positioned(
                                  left: 0*swf,
                                  top: 0*swf,
                                  child: Align(
                                    child: SizedBox(
                                      width: 232*swf,
                                      height: 25*swf,
                                      child: Text(
                                        'How was your experience in',
                                        style: SafeGoogleFont (
                                          'Nunito',
                                          fontSize: 18*aswf,
                                          fontWeight: FontWeight.w600,
                                          height: 1.36*aswf/swf,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Veterinary Clinic Label
                                Positioned(
                                  left: 11*swf,
                                  top: 24*swf,
                                  child: Align(
                                    child: SizedBox(
                                      width: 204*swf,
                                      height: 28*swf,
                                      child: Text(
                                        'KHO Veterinary Clinic',
                                        style: SafeGoogleFont (
                                          'Nunito',
                                          fontSize: 20*aswf,
                                          fontWeight: FontWeight.w700,
                                          height: 1.36*aswf/swf,
                                          color: const Color(0xff394888),
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
                  // Back Button
                  Positioned(
                    left: 13*swf,
                    top: 53*swf,
                    child: Align(
                      child: SizedBox(
                        width: 37*swf,
                        height: 37*swf,
                        child: TextButton(
                          onPressed: () {},
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
                  // Rating Bar
                  Positioned(
                    left: 106 * swf,
                    top: 350 * swf, // Adjust the top position as needed
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30 * swf, // Adjust the size of the stars as needed
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // Handle the rating update as needed
                      },
                    ),
                  ),
                  //Write a review label
                  Positioned(
                    left: 23*swf,
                    top: 405*swf,
                    child: Container(
                      width: 312*swf,
                      height: 300*swf,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(15*swf),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5*swf, 0*swf, 0*swf, 6*swf),
                            child: Text(
                              'Write a review',
                              style: SafeGoogleFont (
                                'Nunito',
                                fontSize: 18*aswf,
                                fontWeight: FontWeight.w700,
                                height: 1.36*aswf/swf,
                                color: const Color(0xff394888),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Reason text field
                  Positioned(
                    left: 24 * swf,
                    top: 435 * swf, // Adjust the top position as needed
                    child: SizedBox(
                      width: 315 * swf,
                      height: 250 * swf, // Adjust the height as needed
                      child: TextField(
                        controller: _textController, // Set the controller
                        maxLines: 7, // Set maxLines to null for multiline input
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15 * swf),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Write here...',
                          hintStyle: SafeGoogleFont(
                            'Nunito',
                            fontSize: 16 * aswf,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * aswf / swf,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Submit Button
                  Positioned(
                    left: 23 * swf,
                    top: 606 * swf,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: const Color(0xffffb500), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15 * swf),
                        ),
                      ),
                      child: SizedBox(
                        width: 315 * swf,
                        height: 40 * swf,
                        child: Center(
                          child: Text(
                            'Submit',
                            style: SafeGoogleFont(
                              'Nunito',
                              fontSize: 18 * aswf,
                              fontWeight: FontWeight.w500,
                              height: 1.36 * aswf / swf,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Cancel Button
                  Positioned(
                    left: 23 * swf,
                    top: 660 * swf,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for the Cancel button here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: const Color(0xfff8f8f8), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15 * swf),
                          side: const BorderSide(
                            color: Color(0xffffb500), // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: 315 * swf,
                        height: 40 * swf,
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: SafeGoogleFont(
                              'Nunito',
                              fontSize: 18 * aswf,
                              fontWeight: FontWeight.w500,
                              height: 1.36 * aswf / swf,
                              color: const Color(0xffffb500), // Text color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Nav Bar
                  Positioned(
                    left: -1*swf,
                    top: 715*swf,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(54*swf, 3.64*swf, 47.07*swf, 6.36*swf),
                      width: 362*swf,
                      height: 48*swf,
                      decoration: BoxDecoration (
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.only (
                          topLeft: Radius.circular(30*swf),
                          topRight: Radius.circular(20*swf),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x3f000000),
                            offset: Offset(6*swf, 0*swf),
                            blurRadius: 2*swf,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*swf, 0.36*swf, 79*swf, 0*swf),
                            padding: EdgeInsets.fromLTRB(1*swf, 1.56*swf, 0*swf, 0*swf),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 2*swf, 1.98*swf),
                                  width: 20.31*swf,
                                  height: 21.09*swf,
                                  child: Image.asset(
                                    'assets/app/images/fluent-home-32-regular-1Gy.png',
                                    width: 20.31*swf,
                                    height: 21.09*swf,
                                  ),
                                ),
                                Text(
                                  'Home',
                                  style: SafeGoogleFont (
                                    'Nunito',
                                    fontSize: 9*aswf,
                                    fontWeight: FontWeight.w700,
                                    height: 1.36*aswf/swf,
                                    color: const Color(0xff888888),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*swf, 0.36*swf, 58.5*swf, 0.64*swf),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: SizedBox(
                                width: 57*swf,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 13*swf,
                                      top: 0*swf,
                                      child: Align(
                                        child: SizedBox(
                                          width: 25*swf,
                                          height: 25*swf,
                                          child: Image.asset(
                                            'assets/app/images/mingcute-calendar-line-9UM.png',
                                            width: 25*swf,
                                            height: 25*swf,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0*swf,
                                      top: 24*swf,
                                      child: Align(
                                        child: SizedBox(
                                          width: 54*swf,
                                          height: 13*swf,
                                          child: Text(
                                            'Appointment',
                                            style: SafeGoogleFont (
                                              'Nunito',
                                              fontSize: 9*aswf,
                                              fontWeight: FontWeight.w400,
                                              height: 1.36*aswf/swf,
                                              color: const Color(0xffffb90f),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*swf, 0*swf, 0*swf, 1*swf),
                            width: 38.43*swf,
                            height: 36.98*swf,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0*swf,
                                  top: 23.98*swf,
                                  child: Align(
                                    child: SizedBox(
                                      width: 33*swf,
                                      height: 13*swf,
                                      child: Text(
                                        'My Pets',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Nunito',
                                          fontSize: 9*aswf,
                                          fontWeight: FontWeight.w400,
                                          height: 1.36*aswf/swf,
                                          color: const Color(0xff888888),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0.5*swf,
                                  top: 0*swf,
                                  child: Align(
                                    child: SizedBox(
                                      width: 37.93*swf,
                                      height: 31.42*swf,
                                      child: Image.asset(
                                        'assets/app/images/paws-hLR.png',
                                        width: 37.93*swf,
                                        height: 31.42*swf,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}