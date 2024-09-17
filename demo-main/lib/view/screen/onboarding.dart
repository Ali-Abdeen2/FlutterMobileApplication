import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/data/datasource/static/static.dart';
import 'package:hebron_university_app/view/widget/onBoardingScreen/AnimatedContainer.dart';
import 'package:hebron_university_app/view/widget/onBoardingScreen/LastButton.dart';
import 'package:hebron_university_app/view/widget/onBoardingScreen/Next&BackButton.dart';
import 'package:hebron_university_app/view/widget/onBoardingScreen/Paint.dart';

import '../../controller/onBoardingController/onBoarding_controller.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key, this.PageIndex});
  final PageIndex;
  @override
  Widget build(BuildContext context) {
    var Controller = Get.put(onBoardingController());

    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Container(
                      height: Get.height * 0.4,
                      //   margin: EdgeInsets.symmetric(vertical: 100),
                      child: PaintOnBoarding(
                        index: PageIndex,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.22,
                     
                      child: Text("${onBoardingList[PageIndex].title}",
                          style: TextStyle(
                            
                              fontSize: 33, fontWeight: FontWeight.w700,
                              
                              ),
                          textAlign: TextAlign.center
                          ,
                          textDirection: TextDirection.rtl,
                          ),
                          
                          
                    ),
                    Container(
                      height: Get.height * 0.18,
                       padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("${onBoardingList[PageIndex].text}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                              textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      height: Get.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: PageIndex == onBoardingList.length - 1
                                ? LastButton(
                                    controller: Controller,
                                  )
                                : NextBackButtons(
                                    orieantation: "next",
                                    PageIndex: PageIndex + 1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                onBoardingList.length,
                                (indexAnimated) {
                                  return AnimatedContainerController(
                                    currentPage: PageIndex,
                                    indexAnimated: indexAnimated,
                                  );
                                },
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: PageIndex == 0
                                ? Text("     ")
                                : NextBackButtons(
                                    orieantation: "back",
                                    PageIndex: PageIndex - 1),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: ColorsApp.onBoardingBackgroundColor);
      },
    );
  }
}


//Navigator.of(context).push(CustomPageRoute(onBoarding(index:currentPage)));
