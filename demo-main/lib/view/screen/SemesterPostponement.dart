import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/SemesterPostponementController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:quickalert/quickalert.dart';
import 'package:skeletonizer/skeletonizer.dart';

//SemesterPostponementPage
class SemesterPostponement extends StatelessWidget {
  const SemesterPostponement({super.key});
  @override
  Widget build(BuildContext context) {
    SemesterPostponementController c=Get.put(SemesterPostponementController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "نموذج تأجيل فصل دراسي",
          style: TextStyle(
              color: ColorsApp.titleColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "عزيزي الطالب قبل تقديم طلب تأجيل فصل دراسي عليك الانتباه الى بعض النقاط المهمة",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "1- مراجعة السياسات: يرجى مراجعة بعناية سياسات الجامعة المتعلقة بتأجيل الدراسة والآثار المحتملة على التقدم الأكاديمي والرسوم الدراسية.",
                textAlign: TextAlign.right,
                // TextDirection: TextDirection.rtl,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "2- التأثير على الجدول الزمني: يرجى أن تكون على علم بأن تأجيل الفصل قد يؤثر على الجدول الزمني لاستكمال المساقات اللاحقة والتخرج. يفضل  مراجعة المرشد الأكاديمي للحصول على إرشادات إضافية.",
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "سبب تأجيل الفصل الدراسي :",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                    color: ColorsApp.TextFromFieldRequestPage,
                    borderRadius: BorderRadius.circular(36)),
                child: GetBuilder<SemesterPostponementController>(
                  init: SemesterPostponementController(),
                  builder: (controller)
                   {
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
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<SemesterPostponementController>(
                
                builder: (controller) {
                return 
                controller.StatusRequest==statusRequest.loading?
                Skeletonizer(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 4, 85, 76),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minimumSize: Size(120, 50),
                ),
                    onPressed: () {
                  
                }, child: Text("ـاجيل الفصل"))):
                ElevatedButton(
                child: Text('تأجيل الفصل'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 4, 85, 76),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minimumSize: Size(120, 50),
                ),
                
                onPressed: () {
                  
                  QuickAlert.show(
                      showCancelBtn: true,
                      onCancelBtnTap: () {
                        Navigator.pop(
                            context); // Navigate back using Navigator.pop
                      },
                      context: context,
                      type: QuickAlertType.info
                      ,
                      title: 'تــنــبــيــه',
                      text: 'هل أنت متأكد من تأجيل الفصل الدراسي ؟',
                      confirmBtnText: 'نعم',
                      cancelBtnText: 'لا',
                      headerBackgroundColor: Color.fromARGB(255, 121, 121, 121),
                      confirmBtnColor: Color(0xff33cdbb),
                      onConfirmBtnTap: () async{
                        Navigator.pop(
                            context);
                       await  c.SemesterPostponement();
                        if( c.message=="")
                        {
                          QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success
                    ,
                          title: 'تم تقديم طلب تأجيل الفصل بنجاح'
                      ,
                          showConfirmBtn: true,
                          confirmBtnColor:
                              const Color.fromARGB(255, 93, 93, 93),
                        );
                        }
                        else
                        {
                          QuickAlert.show(context: context, type: QuickAlertType.error
                          ,
                          title: '${c.message}',
                          showConfirmBtn: true,
                          confirmBtnColor:
                              const Color.fromARGB(255, 93, 93, 93),
                          );
                        }
                      });
                },
              );
              },)
            ],
          )),
      backgroundColor: ColorsApp.onBoardingBackgroundColor,
    );
  }
}


//  AwesomeDialog(
//                           alignment: Alignment.center,
//                           context: context,
//                           animType: AnimType.scale,
//                           dialogType: DialogType.success,
//                           body: Center(
//                             child: Text(
//                               'تم تقديم طلب لتأجيل الفصل بنجاح',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         )..show();















// SingleChildScrollView(
//           padding: EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "عزيزي الطالب قبل تقديم طلب تأجيل فصل دراسي عليك الانتباه الى بعض النقاط المهمة",
//                 textAlign: TextAlign.right,
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "1- مراجعة السياسات: يرجى مراجعة بعناية سياسات الجامعة المتعلقة بتأجيل الدراسة والآثار المحتملة على التقدم الأكاديمي والرسوم الدراسية.",
//                 textAlign: TextAlign.right,
//                 // TextDirection: TextDirection.rtl,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   fontSize: 17,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "2- التأثير على الجدول الزمني: يرجى أن تكون على علم بأن تأجيل الفصل قد يؤثر على الجدول الزمني لاستكمال المساقات اللاحقة والتخرج. يفضل  مراجعة المرشد الأكاديمي للحصول على إرشادات إضافية.",
//                 textAlign: TextAlign.right,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "سبب تأجيل الفصل الدراسي :",
//                 textDirection: TextDirection.rtl,
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 0, 0, 0),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 20,
//                 ),
//                 decoration: BoxDecoration(
//                     color: ColorsApp.TextFromFieldRequestPage,
//                     borderRadius: BorderRadius.circular(36)),
//                 child: TextFormField(
//                   maxLines: 4,
//                   textAlign: TextAlign.right,
//                   cursorColor: Colors.black,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                   decoration: InputDecoration.collapsed(
//                     hintStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                     hintText: '',
//                   ),
//                 ),
//               ),
//               // ElevatedButton(
//               //     onPressed: () {
//               //       showDialog(
//               //         context: context,
//               //         builder: (ctx) => AlertDialog(
//               //           title: const Text("Alert Dialog Box"),
//               //           content:
//               //               const Text("You have raised a Alert Dialog Box"),
//               //           actions: <Widget>[
//               //             TextButton(
//               //               onPressed: () {
//               //                 Navigator.of(ctx).pop();
//               //               },
//               //               child: Container(
//               //                 color: Colors.green,
//               //                 padding: const EdgeInsets.all(14),
//               //                 child: const Text("okay"),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       );
//               //     },
//               //     child: Text("تأجيل الفصل"))
//               SizedBox(
//                 height: 20,
//               ),

//               ElevatedButton(
//                 child: Text('تأجيل الفصل'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   textStyle: TextStyle(
//                     fontSize: 18,
//                   ),
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0)),
//                   minimumSize: Size(120, 50),
//                 ),
//                 onPressed: () {
//                   AwesomeDialog(
//                     alignment: Alignment.center,
//                     context: context,
//                     animType: AnimType.SCALE,
                    
//                     dialogType: DialogType.INFO,
//                     body: Center(
//                       child: Text(
//                         'هل أنت متأكد من  تأجيل الفصل الدراسي ؟',
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                     ),
//                     btnOk: TextButton(
//                       onPressed: () {
//                         AwesomeDialog(
//                           context: context,
                          
//                           animType: AnimType.scale,
//                           dialogType: DialogType.success,
//                           body: Center(
//                             child: Text(
//                               'تم تقديم طلب لتأجيل الفصل بنجاح',
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 0, 0, 0)),
//                             ),
//                           ),
//                         )..show();
//                       },
//                       child: Text(
//                         "نعم",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ),
//                     btnCancel: TextButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: Text(
//                           "تراجع",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.green),
//                         )),
//                   )..show();
//                 },
//               ),
//             ],
//           ))