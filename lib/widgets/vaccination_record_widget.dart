import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';


class VaccinationRecord extends StatelessWidget {
  final String nameOfVaccine;
  final String nameOfVet;
  final String date;

  const VaccinationRecord({
    Key? key,
    required this.nameOfVaccine,
    required this.nameOfVet,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 360,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 0),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SvgPicture.asset(
              'assets/app/images/vaccine.svg',
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),

          const SizedBox(width: 5),
          const VerticalDivider(
            color: const Color(0xFF5C5C5C),
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nameOfVaccine,
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF394888),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          date,
                          style: GoogleFonts.nunito(
                            fontSize: 10,
                            color: const Color(0xFF5C5C5C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  nameOfVet,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    color: const Color(0xFF5C5C5C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
