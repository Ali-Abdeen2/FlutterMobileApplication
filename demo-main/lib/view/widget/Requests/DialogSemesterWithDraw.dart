import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/DropTermController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/constatnt/ColorsApp.dart';
import '../../../core/constatnt/imageAsset.dart';
import '../../../data/datasource/static/static.dart';
import '../../../data/model/RequestsModel.dart';

class DialogSemsterWithDraw extends StatelessWidget {
  const DialogSemsterWithDraw({super.key});
  @override
  Widget build(BuildContext context) {
      DropTermController c=Get.put(DropTermController());
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
      scrollable: true,
      content: Container(
        
        child: Column(
          children: [
            SvgPicture.asset(
              '${ImageAsset.WithDrawSubIcon}', // Replace with the path to your SVG file
              width: Get.height < 600 ? 20 : 200, // Adjust the width as needed
              height:
                  Get.height < 600 ? 20 : 200, // Adjust the height as needed
            ),
            Text(
              "سيتم تقديم طلب من اجل سحب الفصل الدراسي (الفصل الأول 2024/2023)، هل أنت متأكد من ذلك ؟",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Color(0xff878787), fontWeight: FontWeight.w700),
            ),
            Text(
              "سبب اسقاط الفصل",
              style: TextStyle(
                  color: Color(0xff797777), fontWeight: FontWeight.w800),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                  color: ColorsApp.TextFromFieldRequestPage,
                  borderRadius: BorderRadius.circular(36)),



              child: GetBuilder<DropTermController>(
                init: DropTermController(),
                builder: (controller) {
                return TextFormField(
                controller: controller.textFieldController,
                maxLines: 4,
                textAlign: TextAlign.right,
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration.collapsed(
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintText: '',
                ),


                
              );
              },),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(width: 2, color: Colors.transparent),
                    ),
                    primary: Color(0xff9D9D9D),
                    onPrimary: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 4.0,
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  child: Text("  تراجع  ",
                      style: TextStyle(fontWeight: FontWeight.w800))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(width: 2, color: Colors.transparent),
                    ),
                    primary: Color(0xffDF2554),
                    onPrimary: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 4.0,
                  ),
                  
                  onPressed: () {
                    c.Dropterm();
                    // Get the current date
                    String currentDate = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
                    // Add a new request to the list
                    RequestData.add(
                      Requests(
                        type: "تأجيل فصل",
                        Icon: "images/waiting.png",
                        Date: currentDate,
                        State: "قيد المراجعة",
                        StateType: "Waiting",
                      ),
                    );
                    // Close the current dialog
                    Navigator.of(context, rootNavigator: true).pop('dialog');

                    // Show the success dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: Container(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: Get.width - 20,
                                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 160,
                                  child: GetBuilder<DropTermController>(
                                    builder: (controller) {
                                    return controller.StatusRequest==statusRequest.loading
                                    ?Skeletonizer(
                                          enabled: true,
                                          child: 
                                            Text("11111111111111",
                                            textAlign: TextAlign.center,
                                            )
                                        )                                    
                                    :controller.message==""?Text(
                                     
                                    "تم تقديم طلب اسقاط الفصل بنجاح"
                                   
                                    ,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ):
                                  Text(
                                     
                                    "${controller.message}"
                                   
                                    ,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  );
                                  
                                  },),
                                  margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
                                ),
                                Positioned(
                                  top: 60,
                                  child: 
                                GestureDetector(
                                  child: Container(
                                    
                                    width: 100,
                                    height: 100,
                                    child: SvgPicture.asset(
                                    
                                      ImageAsset.WithDrawAccept,
                                      height: 110,
                                      width: 110,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop('dialog');
                                  },
                                )
                                )
                              ],
                            ),
                          ),
                          actions: [],
                        );
                      },
                    );
                  },
                  child: Text(
                    "  اسقاط  ",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ))
            ],
          ),
        )
      ],
    );
  }
}