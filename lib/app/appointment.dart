import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

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
              const Padding(padding: EdgeInsets.only(top: 150)),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Appointments',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 450,
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
                              "Chase's consultation with",
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Juan Dela Cruz",
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF394888),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding( //Date of Consultation
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
                                    'August 31',
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
                            Padding( // Time of Consultation
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
                                    '11:00 AM',
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

                            Padding( // Location
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
                                  Text(
                                    '123 Main St., Naga City ',
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
                                    '+63 987 654 3210',
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

                            Padding( // Reasons
                              padding: const EdgeInsets.only(left: 25, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/reason.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Does not want to eat.',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],

                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 10, right: 10,),
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
                                            color: Color(0xFF394888),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton( // Reschedule Button
                                    onPressed:() {
                                        //add reschedule button logic
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
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Luka's consultation with",
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Juan Dela Cruz",
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF394888),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding( //Date of Consultation
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
                                    'August 31',
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
                            Padding( // Time of Consultation
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/img/clock.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '11:00 AM',
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

                            Padding( // Location
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
                                  Text(
                                    '123 Main St., Naga City ',
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
                                    '+63 987 654 3210',
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

                            Padding( // Reasons
                              padding: const EdgeInsets.only(left: 25, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/app/images/reason.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Does not want to eat.',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],

                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 10, right: 10,),
                              child: Row(
                                children: [
                                  ElevatedButton( // Cancel Button
                                    onPressed: () {
                                      // add cancel button logic
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
                                            color: Color(0xFF394888),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton( // Reschedule Button
                                    onPressed:() {
                                      // add reschedule button logic
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
                  itemCount: 2,
                  viewportFraction: 0.85,
                  scale: 0.9,
                ),
              ),

            ],
          ),

          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/app/images/Back Button.svg",
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/app/images/ellipse.png',
              width: 400,
              fit: BoxFit.contain,
            ),


          ),

        ],

      ),


    );
  }
}
