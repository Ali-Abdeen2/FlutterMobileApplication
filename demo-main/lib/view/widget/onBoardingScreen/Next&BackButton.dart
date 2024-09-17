import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoardingController/CustomPageRoute.dart';
import '../../../core/constatnt/ColorsApp.dart';
import '../../screen/onboarding.dart';

class NextBackButtons extends StatelessWidget {
  const NextBackButtons({super.key,this.orieantation,this.PageIndex});
  
  final orieantation;
  final  PageIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
                        splashFactory:  NoSplash.splashFactory,
                         highlightColor: Colors.transparent,
                        onTapUp: (value) {
                        // orieantation=="next"?controller.next():controller.back();
                        if(orieantation=="next")
                          {
                            print(PageIndex);
                            
                            Navigator.of(context).push(CustomPageRoute(onBoarding(PageIndex:PageIndex)));
                          }
                          else
                          {
                              Get.back();
                          }
                        //  print("the tap cancel");
                        },
                        onTapDown: (value) {
                          
                        //  print("the Next");
                        },
                        child: Container(
                          
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Text(orieantation=="next"?"التالي":"السابق",style: TextStyle(color: ColorsApp.NextButtonColor)),
                        ),
                      );
  }
}