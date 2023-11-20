import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 0),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search),
          prefixIconConstraints: BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          contentPadding: EdgeInsets.zero,
          hintMaxLines: 1,
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
