import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purrfect/widgets/pet_card_widgets.dart';
import 'package:purrfect/widgets/search_bar_widget.dart';

class MyPets extends StatefulWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 75),
                    SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 260),
                        child: Text(
                          'My Pets',
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
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: PetCard(
                              imagePath: 'assets/app/images/Chase.png',
                              petName: 'Chase',
                              petBreed: 'Golden Retriever',
                              petAge: '3 years old',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                    ],
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
          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/app/images/add.svg',
                width: 45,
              ),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}
