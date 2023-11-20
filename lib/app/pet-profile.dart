import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:purrfect/widgets/vaccination_record_widget.dart';
import 'package:purrfect/widgets/medical_record_widget.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({Key? key}) : super(key: key);

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/app/images/Chase.png",
            width: 400,
            height: 280,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 230,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // Name of the Pet Container
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Chase',
                                          style: GoogleFonts.nunito(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF394888),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        SvgPicture.asset(
                                          'assets/app/images/male gender.svg',
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Golden Retriever',
                                          style: GoogleFonts.nunito(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Age',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: const Color(0xFF394888),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      '3',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: const Color(0xFF394888),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      '10 kg',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Color',
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: const Color(0xFF394888),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      'Golden',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        color: const Color(0xFF394888),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container( //vaccination records
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Vaccination Records',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    color: const Color(0xFF394888),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  // add vaccine records
                                  icon: SvgPicture.asset(
                                    'assets/app/images/add.svg',
                                    width: 20,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: VaccinationRecord(
                                    nameOfVaccine: 'Rabies',
                                    date: 'November 28, 2019',
                                    nameOfVet: 'Juan Dela Cruz, Veterinarian',
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
                                  child: VaccinationRecord(
                                    nameOfVaccine: 'Canine Distemper',
                                    date: 'August 31, 2021',
                                    nameOfVet: 'Juan Dela Cruz, Veterinarian',
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Medical Records',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    color: const Color(0xFF394888),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  // add vaccine records
                                  icon: SvgPicture.asset(
                                    'assets/app/images/add.svg',
                                    width: 20,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MedicalRecord(
                                    nameOfDisease: 'Canine Distemper',
                                    date: 'September 20, 2021',
                                    treatment: 'Lorem Ipsum',
                                    nameOfVet: 'Juan Dela Cruz, Veterinarian',
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),

                ],

              ),
            ),
          ),
        ],

      ),
    );
  }
}
