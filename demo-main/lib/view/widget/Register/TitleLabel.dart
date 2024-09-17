import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class TitleLabel extends StatelessWidget {
  const TitleLabel({super.key,required this.title});

  final title;
  @override
  Widget build(BuildContext context) {
    return Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
              ),
              color: Color(0xff697264),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: Get.width,
                child: Text(
                  
                  "$title",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ),
            );
  }
}