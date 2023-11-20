import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFB703),
      body: Stack(
          children:[
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB703),
                    image: DecorationImage(
                      image: AssetImage('assets/app/images/Ellipse 1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                  height: 300,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/app/images/userprofile.png'),
                        ),
                        SizedBox(height: 10), // Add some space between the avatar and the text
                        Text(
                          'Brent Delos Angeles',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        height: 500,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container( //HELPS AND FAQS
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.help_outline,
                                    color: Color(0xFFFFB500),
                                    size: 24,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'Help and FAQS',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF888888),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container( // LOG OUT
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/app/images/logout.svg",
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'Log out',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF888888),
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container( // DELETE ACCOUNT
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/app/images/delete.svg",
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'Delete Account',
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF888888),
                                    size: 16,
                                  ),
                                ],
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
            Positioned(
              top: 45,
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

          ]

      ),

    );
  }
}