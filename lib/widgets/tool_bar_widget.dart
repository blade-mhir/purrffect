import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class _ToolbarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color labelColor;
  final double labelFontSize;
  final FontWeight labelFontWeight;

  const _ToolbarItem({
    required this.iconPath,
    required this.label,
    required this.labelColor,
    required this.labelFontSize,
    required this.labelFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: labelFontSize,
            fontWeight: labelFontWeight,
            color: labelColor,
          ),
        )
      ],
    );
  }
}

class BottomToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(6, 0),
            blurRadius: 4,
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ToolbarItem(
            iconPath: 'assets/app/images/home.svg',
            label: 'Home',
            labelColor: Color(0xFFFFB90F),
            labelFontSize: 10,
            labelFontWeight: FontWeight.bold,
          ),
          _ToolbarItem(
            iconPath: 'assets/app/images/appoint.svg',
            label: 'Appointment',
            labelColor: Color(0xFF888888),
            labelFontSize: 10,
            labelFontWeight: FontWeight.normal,
          ),
          _ToolbarItem(
            iconPath: 'assets/app/images/mypets.svg',
            label: 'My Pets',
            labelColor: Color(0xFF888888),
            labelFontSize: 10,
            labelFontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
