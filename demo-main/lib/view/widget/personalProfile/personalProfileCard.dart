import 'package:flutter/material.dart';

class PersonalProfileCard extends StatelessWidget {
  const PersonalProfileCard({super.key, this.Row1, this.Row2});
  final Row1;
  final Row2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 239, 239, 239),
      ),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${Row1}",
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Color(0xff78B976),
                fontSize: 18,
                fontWeight: FontWeight.w900),
          ),
          Text(
            "${Row2}",
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Color(0xff78B976),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
