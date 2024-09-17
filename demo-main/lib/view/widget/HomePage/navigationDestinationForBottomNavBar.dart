import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';

import '../../../controller/HomePageControllers/bottomNavBarHomePageController.dart';

class NavigationDestinationBottomNavBar extends StatelessWidget {
  const NavigationDestinationBottomNavBar(
      {super.key, this.text, this.icon, this.selectedicon});
  final text;
  final icon;
  final selectedicon;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
  print("the textScaleFactor ${textScaleFactor}");
    return NavigationDestination(
      //0.85
      //1
      //1.15
      //1.30
      //1.45
      //1.60
      //1.75
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Icon(icon)]
          ),
        label: "",
        selectedIcon: Column(children: [
          SizedBox(
            height: 12,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 900),
            width: Get.width * 0.23,
            height: 4,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsApp.bottomNavigationbarColor),
          ),
          SizedBox(
            height: 9,
          ),
          Icon(
            selectedicon,
            color: Colors.green,
          ),
          Text(
            "${text}",
            style: TextStyle(color: ColorsApp.bottomNavigationbarColor,fontSize: textScaleFactor>=2?5:textScaleFactor>1.45?7:11),
            textAlign: TextAlign.center,
            
          )
        ]));
  }
}

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
        //final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          backgroundColor: ColorsApp.OnBoardingPaint),
      child: GetBuilder<bottomNavBarHomePageController>(
        init: bottomNavBarHomePageController(),
        builder: (controller) {
          return NavigationBar(
           // height: textScaleFactor>1.5?85:80,
              selectedIndex: controller.index,
              onDestinationSelected: (value) {
                print("the value ${value}");
                print("the value by controller = ${controller.index}");
                controller.changeIndex(value);
              },
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              destinations: const [
                
                     NavigationDestinationBottomNavBar(
                    text: "الملف الشخصي",
                    icon: Icons.person,
                    selectedicon: Icons.person),
                    
                     NavigationDestinationBottomNavBar(
                    text: "الخطة الدراسية",
                    icon: Icons.book,
                    selectedicon: Icons.book),
                    NavigationDestinationBottomNavBar(
                    text: "البرنامج",
                    icon: Icons.event_note_outlined,
                    selectedicon: Icons.event_note_outlined),
                    NavigationDestinationBottomNavBar(
                    text: "الصفحة الرئيسية",
                    icon: Icons.home,
                    selectedicon: Icons.home),
              ]);
        },
        
      ),
    );
  }
}
