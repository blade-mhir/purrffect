import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:purrfect/app/list_of_vet.dart';
import 'package:purrfect/app/user_profile.dart';
import 'package:purrfect/widgets/service_provider_widget.dart';
import 'package:purrfect/widgets/search_bar_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  void navigateToListOfVet() {
    //function for text button (See All)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListOfVet()),
    );
  }

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserProfile()),
                            );
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/app/images/userprofile.png'),
                          ),
                        ),


                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/app/images/notify.svg",
                            width: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 26,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Welcome, ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Brent!',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Veterinary Clinics',
                                style: GoogleFonts.nunito(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: navigateToListOfVet,
                                    child: Text(
                                      'See All',
                                      style: GoogleFonts.nunito(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: const Color(0xFF888888),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          const Row(
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
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
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
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
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pet Grooming Center',
                                style: GoogleFonts.nunito(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    'See All',
                                    style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xFF888888),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: ServiceProvider(
                                  imagePath: 'assets/app/images/poochie.jpg',
                                  nameOfServiceProvider: 'Poochie Parlor',
                                  service: 'Pet Grooming Center',
                                  time: 'Mon - Sat | 10:00 a.m. - 7:00 p.m.',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: ServiceProvider(
                                  imagePath:'assets/app/images/poochie.jpg',
                                  nameOfServiceProvider: 'Poochie Parlor',
                                  service: 'Pet Grooming Center',
                                  time: 'Mon - Sat | 10:00 a.m. - 7:00 p.m.',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: ServiceProvider(
                                  imagePath:'assets/app/images/poochie.jpg',
                                  nameOfServiceProvider: 'Poochie Parlor',
                                  service: 'Pet Grooming Center',
                                  time: 'Mon - Sat | 10:00 a.m. - 7:00 p.m.',
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
