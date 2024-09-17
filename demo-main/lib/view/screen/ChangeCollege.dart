import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hebron_university_app/controller/ChangeCollege/ChangeCollegeController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChangeCollege extends StatelessWidget {
  const ChangeCollege({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<DropdownSearchState<String>> dropdownKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: Get.height > 500 ? 100 : 45,
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
      body: 
      SingleChildScrollView(
        child:
        
        GetBuilder<ChangeCollegeController>(
          init: ChangeCollegeController(),
          builder:
         (controller) {
          return
          controller.StatusRequest==statusRequest.loading?
        Container(
          height:Get.height-200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ):
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownSearch<String>(
                      
                         popupProps: PopupPropsMultiSelection.menu(
                      showSearchBox: false,
                       fit: FlexFit.loose, 
                       textDirection: TextDirection.rtl,
                    
                      menuProps: MenuProps(backgroundColor: Colors.white,),
                       
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items:  controller.AllowedColleges["names"]??[],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                      
                      textAlign: TextAlign.right,
                        dropdownSearchDecoration: InputDecoration(
                         
                          fillColor: 
                      Colors.red, 
                        border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)
                              ),
                                  
                                  hintText: "",
                              ),
                          ),
                          onChanged: (value) async{
                           controller.data['NewColgNo']=value.toString();
                           dropdownKey.currentState?.changeSelectedItem("التخصص المراد التحويل اليه");
                           controller.data['NewSpecNo']="";
                           await controller.GetSpecs(int.parse((controller.AllowedColleges['names']?.toList().indexOf(controller.data['NewColgNo'])).toString()));
                          },
                          selectedItem: "الكلية المراد التحويل اليها",
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              controller.StatusRequestSpecs==statusRequest.loading?
              Center(
                child: CircularProgressIndicator(),
              ):
               Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownSearch<String>(
                      key: dropdownKey,
                       popupProps: PopupPropsMultiSelection.menu(
                       showSearchBox: false,
                       fit: FlexFit.loose, 
                       textDirection: TextDirection.rtl,
                    
                      menuProps: MenuProps(backgroundColor: Colors.white,),
                       
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items:  controller.AllowedSpecs["names"]??[],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                      
                      textAlign: TextAlign.right,
                        dropdownSearchDecoration: InputDecoration(
                         
                        fillColor: 
                      Colors.red, 
                        border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)
                              ),
                                  
                                  hintText: "",
                              ),
                          ),
                          onChanged: (value) {
                            print(value);
                           controller.data['NewSpecNo']=value.toString();
                          },
                          selectedItem: "التخصص المراد التحويل اليه",
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                          border: InputBorder.none, 
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0), 
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    )
              ,
              controller.StatusRequestAdd==statusRequest.loading?Center(
            child: Skeletonizer(
              child: ElevatedButton(
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
                    
                onPressed: () {
                  
                },
                child: Container(
                  child: Text(" تحويل "),
                ),
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
                        await controller.CollegeChange();  
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
                          type:QuickAlertType.warning,
                          title:"${controller.messageError}",
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
        )
        ;
        },
        )
       ,
      )
      ,
      backgroundColor: ColorsApp.onBoardingBackgroundColor,
    );
  }
}