import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/onBoardingController/CustomPageRoute.dart';
import 'package:hebron_university_app/data/datasource/static/static.dart';
import 'package:hebron_university_app/view/screen/onboarding.dart';

 class onBoardingController extends GetxController
{
  late PageController pageController;
  Color TheNextButtonTextColor=Colors.black;
  late BuildContext context;
  int currentPage=0;
  next()
  {
    
    if(currentPage==onBoardingList.length-1)
    {
      Get.offNamed("login");
    }
    else
    {
      currentPage++;
    //pageController.animateToPage(currentPage, duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
    update();
  }
  back()
  {
    if(currentPage==0)
    {
      print("the first page");
    }
    else
    {
      currentPage--;
    //pageController.animateToPage(currentPage, duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }
  onPageChanged(int index)
  {
    currentPage=index;
    update();
   // next();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    pageController=PageController();
    super.onInit();
  }
}