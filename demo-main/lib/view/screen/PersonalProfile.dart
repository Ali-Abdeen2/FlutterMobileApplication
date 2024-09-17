import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/view/widget/personalProfile/personalProfileCard.dart';
import '../../controller/profileController/profileController.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  PersonalProf createState() => PersonalProf();
}

class PersonalProf extends State<PersonalProfile> {
  final blueColor = const Color.fromARGB(255, 164, 193, 167);
  final yellowColor = const Color.fromARGB(255, 75, 152, 60);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return OrientationBuilder(builder: (context, orientation) {
          return Scaffold(
              // appBar: AppBar(
              //   backgroundColor: const Color(0xffffEAF4E3),
              //   elevation: 0,
              //   leading: IconButton(
              //       onPressed: () {},
              //       icon: Image.asset("${ImageAsset.backArrow}")),
              // ),
              backgroundColor: ColorsApp.backgroundColor,
              body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    buildBackgroundTopCircle(),
                    // buildBackgroundBottomCircle(),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 50, bottom: 40),
                          child: Column(
                            children: [
                              buildAvatarContainer(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    controller.services.sharedPreferences.getBool("mainScreenData") !=true
                        ? const CircularProgressIndicator()
                        : controller.isConnected == true
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 200,
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "${controller.services.sharedPreferences.getString('name')}",
                                        style: const TextStyle(
                                            color: Color(0xff78B976),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "${controller.services.sharedPreferences.getString('colgName')}",
                                        style: const TextStyle(
                                            color: Color(0xff78B976),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child:  Text(
                                        "${controller.services.sharedPreferences.getString('academicSupervisorName')}",
                                        textAlign: TextAlign.center,
                                        
                                        style: TextStyle(
                                            color: Color(0xff78B976),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  PersonalProfileCard(
                                      Row1: "اسم الكلية ",
                                      Row2:
                                          "${controller.services.sharedPreferences.getString('colgName')}"),
                                  PersonalProfileCard(
                                      Row1: "اسم التخصــــــــص ",
                                      Row2:
                                          "${controller.services.sharedPreferences.getString('specName')}"),
                                  PersonalProfileCard(
                                      Row1: "الدرجة العلمية",
                                      Row2:
                                          "${controller.services.sharedPreferences.getString('certName')}"),
                                  
                                ],
                              )
                            : const Center(
                                child: Text("حدث خطأ بالاتصال "),
                              )
                  ],
                ),
              ],
            ),
          ));
        });
      },
    );
  }

  Container buildAvatarContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: 130,
      height: 130,
      decoration: BoxDecoration(
          color: ColorsApp.backgroundColor,
          borderRadius: BorderRadius.circular(65),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 20,
            ),
          ]),
      child: Container(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: 1.0,
                top: 3.0,
                child: Icon(
                  Icons.person_outline,
                  size: 60,
                  color: Colors.black.withOpacity(.1),
                ),
              ),
              GetBuilder<ProfileController>(
                builder: (controller) {
                return ClipOval(
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30
                  ),
                  "${controller.services.sharedPreferences.getString('name').toString()[0]}"),
              );
              },),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildBackgroundBottomCircle() {
    return Positioned(
      top: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.width,
      right: MediaQuery.of(context).size.width / 2,
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 198, 254, 201),

            // color: blueColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width,
            )),
      ),
    );
  }

  Positioned buildBackgroundTopCircle() {
    return Positioned(
      top: 0,
      child: Transform.translate(
        offset: Offset(0.0, -MediaQuery.of(context).size.width / 1.3),
        child: Transform.scale(
          scale: 1.35,
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ColorsApp.LoginButtonColors,

                // color: Color.fromARGB(255, 134, 134, 134),
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width,
                )),
          ),
        ),
      ),
    );
  }
}
