import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:purrfect/widgets/service_provider_widget.dart';
import 'package:purrfect/widgets/search_bar_widget.dart';

class ListOfVet extends StatefulWidget {
  const ListOfVet({super.key});

  @override
  _ListOfVet createState() => _ListOfVet();
}

class _ListOfVet extends State<ListOfVet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFB703),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                // Container 1

                padding: const EdgeInsets.only(top: 50, right: 10, left: 20),
                height: 200,
                color: const Color(0xFFFFB703),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 75),
                    SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only( right: 160),
                        child: Text(
                          'Veterinary Clinics',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ServiceProvider(
                                  imagePath: 'assets/app/images/KHOVet.png',
                                  nameOfServiceProvider: 'KHO Veterinary',
                                  service: 'Veterinary Clinic',
                                  time: 'Always Open 24/7',
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
                                child: ServiceProvider(
                                  imagePath: 'assets/app/images/KHOVet.png',
                                  nameOfServiceProvider: 'KHO Veterinary',
                                  service: 'Veterinary Clinic',
                                  time: 'Always Open 24/7',
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
                                child: ServiceProvider(
                                  imagePath: 'assets/app/images/KHOVet.png',
                                  nameOfServiceProvider: 'KHO Veterinary',
                                  service: 'Veterinary Clinic',
                                  time: 'Always Open 24/7',
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
                                child: ServiceProvider(
                                  imagePath: 'assets/app/images/KHOVet.png',
                                  nameOfServiceProvider: 'KHO Veterinary',
                                  service: 'Veterinary Clinic',
                                  time: 'Always Open 24/7',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),Row(
                            children: [
                              Expanded(
                                child: ServiceProvider(
                                  imagePath: 'assets/app/images/KHOVet.png',
                                  nameOfServiceProvider: 'KHO Veterinary',
                                  service: 'Veterinary Clinic',
                                  time: 'Always Open 24/7',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),Row(
                            children: [
                              Expanded(
                                child: ServiceProvider(
                                  imagePath: 'assets/app/images/KHOVet.png',
                                  nameOfServiceProvider: 'KHO Veterinary',
                                  service: 'Veterinary Clinic',
                                  time: 'Always Open 24/7',
                                ),
                              ),
                            ],
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
            top: 180,
            left: 20,
            right: 20,
            child: SearchBarWidget(),
          ),

        ],
      ),

    );
  }
}
