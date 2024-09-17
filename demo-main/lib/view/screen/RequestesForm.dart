import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../data/datasource/static/static.dart';

class RequestesForm extends StatefulWidget {
  const RequestesForm({Key? key}) : super(key: key);

  @override
  _RequestesFormState createState() => _RequestesFormState();
}

class _RequestesFormState extends State<RequestesForm> {
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    RequestsController requestsController=Get.put(RequestsController());
    return Center(
        child: Animate(
      child: GetBuilder<RequestsController>(
        builder: (controller) {
        return
        controller.response==null||controller.response2==null?
        Center(
          child: CircularProgressIndicator(),
        ):
        controller.response=="error"||controller.response2=="error"?
        Center(
          child: Text("حدث خطأ"),
        ):
         GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: RequestesMen.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.349),
                      offset: Offset(0, 10),
                      blurRadius: 10)
                ],
                gradient: LinearGradient(
                    end: Alignment(0, 0.981039786338806),
                    begin: Alignment(1, -0.981039786338806),
                    colors: [
                      Color.fromRGBO(248, 239, 210, 1),
                      Color.fromRGBO(243, 235, 209, 0.392)
                    ]),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextButton(
                
                  onPressed: () {
                   
                    // response[0]["name"]="تغير كلية";
                    // response[1]["name"]="تغير تخصص";
                    // response[2]["name"]="تأجيل فصل";
                    // response[3]["name"]="إسقاط الفصل";
                    print(controller.response);
                   if(RequestesMen[index].title=="نموذج سحب فصل دراسي"||RequestesMen[index].title=="نموذج سحب مساق ")
                    {

                      if(controller.response.where((element) => element['name']=="إسقاط الفصل").length==1)
                      {
                           QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "لقد قمت بالفعل بتقديم طلب اسقاط للفصل",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                      
                        Get.toNamed("${RequestesMen[index].link}");
                      }
                    }
                    else if(RequestesMen[index].title=="نموذج تأجيل فصل")
                    {

                      if(controller.response.where((element) => element['name']=="تغير تخصص").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 3),
                          title: "لديك طلب تغير تخصص",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else if(controller.response.where((element) => element['name']=="تغير كلية").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "لقد قمت بالفعل بتقديم طلب لتغير الكلية",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                        if(controller.response.where((element) => element['name']=="إسقاط الفصل").length==1)
                      {
                           QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "لقد قمت بالفعل بتقديم طلب اسقاط للفصل",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                      if(controller.response.where((element) => element['name']=="تأجيل فصل").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "لقد قمت بالفعل بتقديم طلب لتأجيل الفصل",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                         Get.toNamed("${RequestesMen[index].link}");
                       
                      }
                      }
                      }
                      
                      
                    }
                    else if(RequestesMen[index].title=="نموذج تحويل كلية")
                    {
                      if(controller.response.where((element) => element['name']=="تغير تخصص").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 3),
                          title: "لقد قمت بالفعل بتقديم طلب لتغير التخصص",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else if(controller.response.where((element) => element['name']=="تأجيل فصل").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 3),
                          title: "لقد قمت بالفعل بتقديم طلب لتغير التخصص",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                         if(controller.response.where((element) => element['name']=="تغير كلية").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "لقد قمت بالفعل بتقديم طلب لتغير الكلية",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                         Get.toNamed("${RequestesMen[index].link}");
                       
                      }
                      }
                    
                    }
                    else if(RequestesMen[index].title=="نموذج تحويل تخصص")
                    {
                        if(controller.response.where((element) => element['name']=="تغير كلية").length==1)
                        {
                          QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "لقد قمت بالفعل بتقديم طلب لتغير الكلية",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                        }
                        else if(controller.response.where((element) => element['name']=="تأجيل فصل").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 3),
                          title: "لقد قمت بالفعل بتقديم طلب لتغير التخصص",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                        else
                        {
                          if(controller.response.where((element) => element['name']=="تغير تخصص").length==1)
                      {
                         QuickAlert.show(
                          context: context,
                          type:QuickAlertType.warning,
                          autoCloseDuration: Duration(seconds: 2),
                          title: "لقد قمت بالفعل بتقديم طلب لتغير التخصص",
                          showConfirmBtn: true,
                          confirmBtnColor:
                               Color.fromARGB(255, 93, 93, 93),
                        );
                      }
                      else
                      {
                         Get.toNamed("${RequestesMen[index].link}");
                       
                      }
                        }
                    }
                   
                   
                  },
                  child: Text(
                    "${RequestesMen[index].title}",
                    style:  TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: textScaleFactor>=2?9:textScaleFactor>1.45?12:17,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  )));
        },
      );
      },),
    ).animate().fadeIn().shimmer(
              color: Color.fromARGB(255, 158, 137, 101),
              duration: const Duration(seconds: 2),
            ));
  }
}
