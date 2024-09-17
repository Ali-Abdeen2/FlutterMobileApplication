import 'package:flutter/material.dart';

import '../../../core/constatnt/ColorsApp.dart';
import '../../../data/datasource/static/static.dart';

class AnimatedContainerController extends StatelessWidget {
  const AnimatedContainerController({super.key,this.indexAnimated,this.currentPage});
  final indexAnimated;
  final currentPage;
  @override
  Widget build(BuildContext context) {
   //print("the Opacity ${this.OpacityDeg}");
   
     return AnimatedContainer(duration: Duration(milliseconds: 900),
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ((onBoardingList.length-1)-this.currentPage)==indexAnimated?ColorsApp.AnimatedContainerColor.withOpacity(1):ColorsApp.AnimatedContainerColor.withOpacity(0.5)
                         ),
                        
                        
                        );
  }
}