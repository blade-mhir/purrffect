import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceButtonWidget extends StatefulWidget {
  final String iconPath;
  final String text;

  const ServiceButtonWidget({
    Key? key,
    required this.iconPath,
    required this.text,
  }) : super(key: key);

  @override
  State<ServiceButtonWidget> createState() => _ServiceButtonWidgetState();
}

class _ServiceButtonWidgetState extends State<ServiceButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFAEDCD),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.iconPath),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 11,
                color: const Color(0xFF394888),
                height: 0,
              ),
            ),
            Text(
              'Services',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 11,
                color: const Color(0xFF394888),
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
