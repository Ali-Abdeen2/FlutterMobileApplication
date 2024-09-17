import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hebron_university_app/controller/ChangeMajorControllers/ChangeMajorController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/view/screen/ChangeCollege.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:hebron_university_app/view/screen/Requests.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/constatnt/ColorsApp.dart';
import '../../core/constatnt/imageAsset.dart';

class ChangeMajor extends StatelessWidget {
  const ChangeMajor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: ColorsApp.onBoardingBackgroundColor,
        centerTitle: true,
        title: const Text(
          "تفاصيل الطلب",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset("${ImageAsset.backArrow}"),
        ),
        actions: [
         IconButton(
                    onPressed: () {
                      Get.toNamed("/Notification");
                    },
                    icon:NotificationButton(),
                    color: Colors.red,
                  )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child:GetBuilder<ChangeMajorController>(
            init: ChangeMajorController(),
            builder: 
          (controller) {
            return
            
             Column(
            children: [
              Text("هل تريد التحويل لتخصص داخل الكلية"),
            Directionality(
              textDirection: TextDirection.rtl,
              child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               Expanded(
                flex: 1,
                child:   Radio(
                  activeColor: Colors.green,
                  value: "yes", groupValue: controller.Choose, onChanged:(value) {
               controller.ChangeTheRadio(value);
             }, ),)
              ,
            Expanded(
              flex: 3,
              child:  Text( "نعم"))
                ,
              ],
             ),
            ),
           Directionality(
              textDirection: TextDirection.rtl,
              child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               Expanded(
                flex: 1,
                child: Radio(
                 
                  activeColor: Colors.green,
                  
                  value: "no", groupValue: controller.Choose, onChanged:(value) {
               controller.ChangeTheRadio(value);
             }, ),)
              ,
            Expanded(
              flex: 3,
              child:  Text( "لا")
              )
                ,
              ],
             ),
            ),
           controller.Choose=="yes"? Container(
              child: Column(
                children: [
      
      Container(
        alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14)
                ),
                
                child:controller.StatusRequest==statusRequest.loading?
                CircularProgressIndicator():
                DropdownSearch<String>(
                    
           popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: false,
         fit: FlexFit.loose, 
         textDirection: TextDirection.rtl,
      
        menuProps: MenuProps(backgroundColor: Colors.white,),
         
          showSelectedItems: true,
          disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: controller.AllowedSpecs["names"]??[],
          dropdownDecoratorProps: DropDownDecoratorProps(
        
        textAlign: TextAlign.right,
          dropdownSearchDecoration: InputDecoration(
           
            fillColor: 
              Colors.red, 
          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)
                            ),
                                
                                hintText: "country in menu mode",
                            ),
                        ),
                        onChanged: (value) {
                          controller.data['NewSpecNo']=value.toString();
                        },
                        selectedItem: "التخصص المراد التحويل اليه",
                    )
                    ,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0), 
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: controller.textFieldController,
                        textAlign: TextAlign.right,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'الملاحظات',
                          border: InputBorder.none, // Remove default border
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5), // Adjust hint color as needed
                          ),
                        ),
                      ),
                    )
                    ,
                    SizedBox(
                      height: 10,
                    ),
                    controller.StatusRequestAdd==statusRequest.loading?
            Container(
              
              child: Center(
                child: Skeletonizer(child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(20.0),
                        side: BorderSide(width: 2, color: Colors.transparent),
                          ),
                          backgroundColor: Color(0xffEDF7E7),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 4.0,
                       ),
              child: Text("تحويل"),
              onPressed: () {
                
              },
            )
             ),
              ),
            ):
           
              ElevatedButton(
                       child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("  تحويل  ",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800))),
                       onPressed: () async{
                        print("تحويل");
                        
                        controller.data['Notes']=controller.textFieldController.text;
                        await controller.SpecChange();  

                        if(controller.messageError=="")
                        {
                            QuickAlert.show(
                          context: context,
                          type:QuickAlertType.success,
                          title: "لقد تم تقديم الطلب بنجاح",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                        }
                        else
                        {
                          QuickAlert.show(
                          context: context,
                          type:QuickAlertType.error,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "${controller.messageError}",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                        }
                           
                       },
      
                       style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(20.0),
                        side: BorderSide(width: 2, color: Colors.transparent),
                          ),
                          backgroundColor: Color(0xffEDF7E7),
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 4.0,
                       ),
                    ) 
                ],
              ),
            ): controller.Choose=="no"?
            Container(
              child: Column(
                children: [
                  Text("قبل تحويل التخصص الى تخصص خارج الكلية التي تنتمي لها عليك اختيار الكلية التي تضم التخصص المراد التحويل اليه",textAlign: TextAlign.right,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17
                  ),
                  ),
                  Container(
                    child: ElevatedButton(
                       child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                        child: Text("  تحويل كلية  ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18))),
                       onPressed: () {
                          Get.off(HomePage());
                          Get.to(Requestes(index: 2));
                          Get.to(ChangeCollege());
                       },
      
                       style: ElevatedButton.styleFrom(
      
                       
                          shape: RoundedRectangleBorder(
                            
                            borderRadius:  BorderRadius.circular(20.0),
                        side: BorderSide(width: 2, color: Colors.transparent),
                          ),
                          backgroundColor: Color(0xff61AA61),
                          foregroundColor: const Color.fromARGB(255, 32, 22, 22),
                          shadowColor: Colors.black,
                          elevation: 4.0,
                       ),
                    ) ,
                  )
                ],
              ),
            )
            :Text("")
            ],
          );
          },)
        ),
      ),
      backgroundColor: ColorsApp.onBoardingBackgroundColor,
    );
  }
}