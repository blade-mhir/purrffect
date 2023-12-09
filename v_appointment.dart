import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class Appointments extends StatefulWidget {
  final String selectedDate;
  final String selectedTimeSlot;
  final String vetReason;
  final String chosenPet;
  final String vetName;
  final String vetNum;
  final String vetAdd;

  const Appointments({
    Key? key,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.vetReason,
    required this.chosenPet,
    required this.vetName,
    required this.vetNum,
    required this.vetAdd,

  }) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}


class _AppointmentsState extends State<Appointments> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFB703),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 160)),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Veterinary Appointments',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                child: Swiper(
                  loop: false,
                  itemBuilder: (BuildContext context, int index) {
                    List<Widget> cardContent = [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //Selected Pet
                              "${widget.chosenPet}'s consultation with",
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              //Selected Vet
                              widget.vetName,
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF394888),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Padding(

                              //Date of Consultation
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/calendar.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    widget.selectedDate,
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],

                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              // Time of Consultation
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/clock.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    widget.selectedTimeSlot,
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],

                              ),

                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            Padding(
                              // Vet Location
                              padding: const EdgeInsets.only(left: 25, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/location.svg',
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.vetAdd,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis, // Specify the overflow behavior
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            const SizedBox(
                              height: 15,
                            ),

                            Padding( // Telephone
                              padding: const EdgeInsets.only(left: 25, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/telephone.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                      widget.vetNum,
                                      style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            Padding(
                              // Vet Reason
                              padding: const EdgeInsets.only(left: 25, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/reason.svg',
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.vetReason,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis, // Specify the overflow behavior
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(//Cancel and Reschedule Buttons
                              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                              child: Row(
                                children: [
                                  ElevatedButton( // Cancel Button
                                    onPressed: () {
                                      // Add cancel button logic
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      side: const BorderSide(
                                        color: Color(0xFF394888),
                                        width: 1,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: SizedBox(
                                      width: 95,
                                      height: 25,
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF394888),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),

                                  ElevatedButton(
                                    // Reschedule Button
                                    onPressed: () {
                                      // Show confirmation dialog
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            title: const Text(
                                              'Reschedule Confirmation',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: SizedBox(
                                              width: 80,
                                              height: 104,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Are you sure you want to reschedule this appointment?',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                    ),
                                                  ),
                                                  const SizedBox(height: 18),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
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
                                                          // Navigate back to vet_appointment screen
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text(
                                                          'OK',
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w900,
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.grey,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text('Cancel'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );

                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF394888),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: 95,
                                      height: 25,
                                      child: Center(
                                        child: Text(
                                          "Reschedule",
                                          style: GoogleFonts.nunito(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
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
                    ];

                    return Card(
                      color: const Color.fromRGBO(255, 255, 255, 1.0),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: cardContent[index],
                      ),
                    );
                  },
                  itemCount: 1,
                  viewportFraction: 0.85,
                  scale: 0.9,
                ),
              ),

            ],
          ),

          Positioned(
            top: 0,
            child: Image.asset(
              'assets/app/images/ellipse.png',
              width: 400,
              fit: BoxFit.contain,
            ),


          ),
          Positioned(
            // Back Button
            left: 12,
            top: 60,
            child: Align(
              child: SizedBox(
                width: 37,
                height: 37,
                child: TextButton(
                  onPressed: () {
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset(
                    'assets/app/images/back-button-VxR.png',
                    width: 37,
                    height: 37,
                  ),
                ),
              ),
            ),
          ),

        ],

      ),


    );
  }
}
