import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constatnt/imageAsset.dart';
import '../../../data/datasource/static/static.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, this.index,this.newsText,  this.title,this.image});
  final index;
  final newsText;
  final title;
  final image;
  @override
  Widget build(BuildContext context) {
    return 
    OrientationBuilder(builder: 
    (context, orientation) {
      return Container(
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
            Expanded(
              flex: 8,
              child: 
            Container(
              
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: ClipRRect(
                
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network("${image}",fit: BoxFit.fill)
                  ),
            )
            ),
           Expanded(
            flex: 3,
            child:  Container(
              child: Text(
                maxLines: 2,
                "${title}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width > 600 ? 19 : 16),
                  textAlign: TextAlign.center),
            ),
            ),
            Expanded(
              flex: 6,
              child: 
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "${newsText} ...",
                maxLines: 4,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Get.width > 600 ? 14 : 12),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ))
          ],
        ),
      ),
    );
    },
    );
    
  }
}
