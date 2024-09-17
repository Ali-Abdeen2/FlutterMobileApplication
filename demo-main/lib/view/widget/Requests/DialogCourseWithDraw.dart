import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/CrsDropController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../core/constatnt/ColorsApp.dart';
import '../../../core/constatnt/imageAsset.dart';
import '../../../data/datasource/static/static.dart';
import '../../../data/model/RequestsModel.dart';

class DialogWithDraw extends StatelessWidget {
  const DialogWithDraw({super.key, required this.SubjectName,required this.RowId});
  final SubjectName;
  final RowId;
  @override
  Widget build(BuildContext context) {
    CrsDropController crsDropController=Get.put(CrsDropController());
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
              "سيتم تقديم طلب من اجل اسقاط المساق (${SubjectName} ) ، هل أنت متأكد من ذلك ؟",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Color(0xff878787), fontWeight: FontWeight.w700),
            ),
            Text(
              "سبب اسقاط المساق",
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
              child: GetBuilder<CrsDropController>(
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
                onChanged: (value) {
                  print(controller.textFieldController.text);
                },
              );
              },),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          child: GetBuilder<CrsDropController>(
            builder: (controller) {
              return Row(
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
                    crsDropController.textFieldController.text="";
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  child: Text("  تراجع  ",
                      style: TextStyle(fontWeight: FontWeight.w800))),
              controller.dropStatusRequest==statusRequest.loading?CircularProgressIndicator():ElevatedButton(
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
                  
                  onPressed: () async{
                   
                    Map data={
                         "rowID": RowId.toString(),
                          "notes": crsDropController.textFieldController.text.toString()
                    };
                    
                    
                    await crsDropController.Drop(data);
                   
                    
                  

                      if(crsDropController.dropStatusRequest==statusRequest.success)
                    {
                      if(controller.dropMessage=="يجب كتابة السبب")
                      {
                          QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 3),
                          title: "يجب كتابة السبب",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.success,
                          //autoCloseDuration: Duration(seconds: 2),
                          title: "تم تقديم طلب اسقاط المساق بنجاح",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );

                        //  showDialog(context: context, builder: (context) {
                        //   return Dialog(
                        //     child: Text("aa"),
                        //   );
                        // },
                        // );
                      }
                     
                    }
                    else
                    {
                      
                       
                        QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 3),
                          title: "لقد قمت بتقديم الطلب",
                          showConfirmBtn: true,
                          confirmBtnColor:
                              const Color.fromARGB(255, 93, 93, 93),
                        );
                      
                    
                    }
                  },
                  child: Text(
                    "  اسقاط  ",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  )
                  )
            ],
          );
            },
          ),
        )
      ],
    );
  }
}



