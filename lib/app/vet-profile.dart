import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purrfect/widgets/service_button_container_widget.dart';
import 'package:purrfect/widgets/review_container_widget.dart';
import 'package:purrfect/widgets/tool_bar_widget.dart';

class VetProfile extends StatefulWidget {
  const VetProfile({Key? key}) : super(key: key);

  @override
  State<VetProfile> createState() => _VetProfileState();
}

class _VetProfileState extends State<VetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 220,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/app/images/KHOVet.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'KHO Veterinary',
                            style: GoogleFonts.nunito(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF394888),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Veterinary Clinic',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '+63 987 654 3210',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF757677),
                        ),
                      ),
                      Text(
                        '123 Main St. Naga City',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF757677),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'About the Clinic',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF394888),
                        ),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Libero habitant faucibus ultricies amet netus rhoncus montes',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Working Time',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF394888),
                        ),
                      ),
                      Text(
                        'Always Open 24/7',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Services Offered',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF394888),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ServiceButtonWidget(
                              iconPath: 'assets/app/images/healthcare.png',
                              text: 'Healthcare',
                            ),
                            const Spacer(),
                            ServiceButtonWidget(
                              iconPath: 'assets/app/images/Pet shampoo.png',
                              text: 'Grooming',
                            ),
                            const Spacer(),
                            ServiceButtonWidget(
                              iconPath: 'assets/app/images/Animal shelter.png',
                              text: 'Additional',
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Reviews',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF394888),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReviewContainer(
                              imagePath: 'assets/app/images/user.png',
                              reviewerName: 'Lorem Ipsum',
                              reviewText:
                                  'Lorem ipsum dolor sit amet consectetur. Consectetur laoreet cursus in consequat nibh. Nulla volutpat.',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReviewContainer(
                              imagePath: 'assets/app/images/user.png',
                              reviewerName: 'Lorem Ipsum',
                              reviewText:
                                  'Lorem ipsum dolor sit amet consectetur. Consectetur laoreet cursus in consequat nibh. Nulla volutpat.',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFB500),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 43,
                  child: Center(
                    child: Text(
                      "Book an Appointment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomToolbar(),
          ),
        ],
      ),
    );
  }
}
