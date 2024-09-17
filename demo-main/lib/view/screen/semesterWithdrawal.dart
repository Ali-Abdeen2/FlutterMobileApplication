import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/DropTermController.dart';
import 'package:hebron_university_app/controller/RequestsController/SemesterPostponementController.dart';
import 'package:hebron_university_app/controller/profileController/profileController.dart';
import 'package:hebron_university_app/controller/scheduleLectureControllers/scheduleLectureController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/widget/Requests/DialogSemesterWithDraw.dart';
import 'package:hebron_university_app/view/widget/Requests/WithdrawalCourse.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/constatnt/imageAsset.dart';

class semesterWithdrawal  extends StatelessWidget {
  const semesterWithdrawal ({super.key});
  
  @override
  Widget build(BuildContext context) {
    DropTermController c=Get.put(DropTermController());

    MyServices services=Get.find();
    return
    OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height > 500 ? 100 : 45,
        backgroundColor: ColorsApp.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text("نموذج سحب فصل دراسي",style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Image.asset("${ImageAsset.backArrow}")),
      ),
      body:  Container(
      child:
        
          Container(
           
            child: GetBuilder<ScheduleLectureController>(
              init: ScheduleLectureController(),
              builder: (controller) {
              return Container(
                child: ListView.builder(
                  itemCount: controller.ScheduleData.length+2,
                  itemBuilder: (context, index) {
                  return
                  
                  index==0?Column(
                    children: [
                       Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text("أنا الطالب \\ة ${services.sharedPreferences.getString("name")}  اقر  و أوافق على سحب الفصل الدراسي (الفصل الأول 2024/2023)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text("مساقات الفصل الحالي",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
          ),
                    ],
                  ):index==controller.ScheduleData.length+1?
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: GetBuilder<DropTermController>(
                      builder: (controller) {
                        return 
                        controller.StatusRequest==statusRequest.loading?
                        Skeletonizer(child: 
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(20.0),
                      side: BorderSide(width: 2, color: Colors.transparent),
                        ),
                        primary: Color(0xffDF2554),
                        onPrimary: Colors.white,
                        shadowColor: Colors.black,
                        elevation: 4.0,
                     ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(" سحب ")),
                          onPressed: () {
                            
                          },
                        )
                        ):
                        ElevatedButton(
                     child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("  سحب  ",style: TextStyle(fontWeight: FontWeight.w800))),
                     onPressed: () {
                      print("drop");
                       
                       
                  QuickAlert.show(
                    
                    widget: TextFormField(
                    controller: c.textFieldController,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true, // This makes sure the background is filled with a color
                      fillColor: Colors.grey[200], // Set the desired background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                        borderSide: BorderSide.none, // No border side
                      ), // Remove the border
                      hintText: '', // Your hint text here
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    
                  )
                  ,
                      showCancelBtn: true,
                      onCancelBtnTap: () {
                        Navigator.pop(
                            context); // Navigate back using Navigator.pop
                      },
                      context: context,
                      type: QuickAlertType.info
                      ,
                      title: 'تــنــبــيــه',
                      text: 'سيتم تقديم طلب من اجل سحب الفصل الدراسي , هل أنت متأكد من ذلك ',
                      confirmBtnText: 'نعم',
                      cancelBtnText: 'لا',
                      headerBackgroundColor: Color.fromARGB(255, 121, 121, 121),
                      confirmBtnColor: Color.fromRGBO(51, 205, 187, 1),
                      onConfirmBtnTap: () async{
                        Navigator.pop(
                            context);
                       await  c.Dropterm();
                        QuickAlert.show(
                          context: context,
                          type: c.StatusRequest==statusRequest.loading?QuickAlertType.loading:
                      c.message==""?QuickAlertType.confirm:
                      QuickAlertType.error,
                          
                          title: c.StatusRequest==statusRequest.loading?'':
                      c.message==""?'تم تقديم طلب أسقاط الفصل بنجاح':
                      '${c.message}',
                          showConfirmBtn: false,
                          confirmBtnColor:
                              const Color.fromARGB(255, 93, 93, 93),
                        );
                      });
                     },

                     style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(20.0),
                      side: BorderSide(width: 2, color: Colors.transparent),
                        ),
                        primary: Color(0xffDF2554),
                        onPrimary: Colors.white,
                        shadowColor: Colors.black,
                        elevation: 4.0,
                     ),
                  );
                      },
                    )
                  )   
                 :WithDrawSub(Button: false, TeacherName: controller.ScheduleData[index-1]['teacherName'], SubjectName: controller.ScheduleData[index-1]['courseName'], crsNo: controller.ScheduleData[index-1]['crsNo'], classNo: controller.ScheduleData[index-1]['classNo'], roomNo: controller.ScheduleData[index-1]['roomNo'],crsTime: controller.ScheduleData[index-1]['crsNo'],rowId: "",);
                },
                ),
              );
            },),
          )
        
      ),
    
    backgroundColor: ColorsApp.backgroundColor,
    );
    },
    );
     
  }
}

