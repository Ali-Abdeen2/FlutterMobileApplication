import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/widget/Requests/DetailsSubmittedRequestCard.dart';

import '../../core/constatnt/ColorsApp.dart';
import '../../core/constatnt/imageAsset.dart';

class DetailsSubmittedRequest extends StatelessWidget {
  const DetailsSubmittedRequest({Key? key, this.canBack, this.SubjectName})
      : super(key: key);
  final canBack;
  final SubjectName;

  @override
  Widget build(BuildContext context) {
      MyServices services=Get.find();
      dynamic data = Get.arguments;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

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
              onPressed: () {}, icon: Image.asset("${ImageAsset.bellIcon}"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //111111111111111111111111111
      // services.sharedPreferences.setString("name", profileData['name']);
      // services.sharedPreferences.setString("specName", profileData['specName']);
      // services.sharedPreferences.setString("certName", profileData['certName']);
      // services.sharedPreferences.setString("colgName", profileData['colgName']);
      //services.sharedPreferences.setString("academicSupervisorName", profileData['academicSupervisorName']);

            //DetailsSubmittedRequestCard(index: "01",row1: "رقم واسم المساق",row2: "10100/15",row3: "13 - شعبة 1",),
            //2222222222222222
            DetailsSubmittedRequestCard(index: "01",row1: "رقم واسم الطالب",row2: "${services.sharedPreferences.getString("AuthUsername")}",row3: "${services.sharedPreferences.getString("name")}",),

            //333333333
            DetailsSubmittedRequestCard(index: "02",row1: "ملاحظات الطالب",row3: "",row2: "${data['notes']}",),

            DetailsSubmittedRequestCard(index: "03",row3: "",row1: "المشرف",row2: "${services.sharedPreferences.getString("academicSupervisorName")}",),

            //44444444444444444444444444444
            data['curColgName']!=null?
            Column(
              children: [
            data['curSpecName']!=null?
            DetailsSubmittedRequestCard(index: "04",row3: data['curSpecName'],row2: data['curColgName'],row1: "التخصص الحالي",)
            :
            Text(""),
            data['newSpecName']!=null?
            DetailsSubmittedRequestCard(index: "05",row3: data['newSpecName'],row2: data['newColgName'],row1: "التخصص المراد الانتقال اليه",)
            :Text("")
              ],
            ):
            data['curSpecName']!=null?
            Column(
              children: [
            data['curSpecName']!=null?
            DetailsSubmittedRequestCard(index: "04",row3: data['curSpecName'],row2: "",row1: "التخصص الحالي",)
            :
            Text(""),
            data['newSpecName']!=null?
            DetailsSubmittedRequestCard(index: "05",row3: data['newSpecName'],row2: "",row1: "التخصص المراد الانتقال اليه",)
            :Text("")
              ],
            ):
            Text("")
            
                  //             Data:{
                  //   "notes":controller.response[i]["data"]["notes"],
                  //   "curSpecName":controller.response[i]["data"]["curSpecName"],
                  //   "curColgName":controller.response[i]["data"]["curColgName"],
                  //   "newSpecName":controller.response[i]["data"]["newSpecName"],
                  //   "newColgName": controller.response[i]["data"]["newColgName"]
                  // }

            //555555555555555555555555555555555555555555
            //DetailsSubmittedRequestCard(index: "04",row1:"قرار رئيس القسم " ,row2: "موافق",row3: "",),
            
            //66666666666666666666666666666666666666666666666666666666666666
            //DetailsSubmittedRequestCard(index: "06",row1:"ملاحظات رئيس القسم " ,row2: "تمت الموافقة على اسقاط المساق",row3: "",),

            
            //77777777777777777777777777777777777777777777777777777777777777777777
            //DetailsSubmittedRequestCard(index: "07",row1:"العميد" ,row2: "بلال عمرو",row3: "",),

           
            //88888888888888888888888888888888888888888888888888888888888888888888
            //DetailsSubmittedRequestCard(index: "08",row1:"قرار العميد  " ,row2: "موافق",row3: "",),

            
            //99999999999999999999999999999999999999999999
            //DetailsSubmittedRequestCard(index: "09",row1:"ملاحطات العميد" ,row2: "لا مانع",row3: "",),

            
          ],
        ),
      ),
    );
  }
}
