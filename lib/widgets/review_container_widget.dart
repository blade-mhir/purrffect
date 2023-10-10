import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewContainer extends StatelessWidget {
  final String imagePath;
  final String reviewerName;
  final String reviewText;

  const ReviewContainer({
    required this.imagePath,
    required this.reviewerName,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 360,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 0),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 78,
              width: 83,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reviewerName,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF394888),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  reviewText,
                  textAlign: TextAlign.justify,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    color: Colors.black,
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
