import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';

class NewsSkeletonizer extends StatelessWidget {
  const NewsSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: const Color(0xFFEDF7E7),
        child:
         Column(
          children: [
            
            Container(
              
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("${ImageAsset.News1}",fit: BoxFit.fill)
                  ),
            )
            ,
           Container(
              child: Text(
                maxLines: 2,
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width > 600 ? 19 : 16),
                  textAlign: TextAlign.center),
            ),
            
            
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                " .aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa...............................................................................................",
                maxLines: 4,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Get.width > 600 ? 14 : 12),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            )
          ],
        ),
      ),
    )
        ],
      );
  }
}