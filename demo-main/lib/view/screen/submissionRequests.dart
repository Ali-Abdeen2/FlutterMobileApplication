import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/view/widget/submissionRequest/submissionRequestCard.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../controller/RequestsController/RequestsController.dart';
import '../../data/datasource/static/static.dart';
import '../widget/Requests/ColorState.dart';

class submissionRequests extends StatelessWidget {
  const submissionRequests({super.key, this.state, this.color});
  final state;
  final color;
  @override
  Widget build(BuildContext context) {
    

    return OrientationBuilder(
      builder: (context, orientation) {
        return 
        GetBuilder<RequestsController>(
          init: RequestsController(),
          builder: 
        (controller) {
          return
          controller.response==null||controller.response2==null?
        Center(
          child: ListView(
            children: [
              Skeletonizer(
          enabled: true,
          child: submissionRequestCard(requestDate: "2022",Name: "  ",statusName: "   ",Data: {},)
              ),
              Skeletonizer(
          enabled: true,
          child: submissionRequestCard(requestDate: "2022",Name: "  ",statusName: "   ",Data: {},)
              ),
              Skeletonizer(
          enabled: true,
          child: submissionRequestCard(requestDate: "2022",Name: "  ",statusName: "   ",Data: {},)
              ),
              Skeletonizer(
          enabled: true,
          child: submissionRequestCard(requestDate: "2022",Name: "  ",statusName: "   ",Data: {},)
              ),
              Skeletonizer(
          enabled: true,
          child: submissionRequestCard(requestDate: "2022",Name: "  ",statusName: "   ",Data: {},)
              )
            ],
          ),
        ):
        controller.response=="error"||controller.response2=="error"?
        Center(
          child: Text("حدث خطأ"),
        ):
         Center(
          child: ListView.builder(
              itemCount: controller.response.length+controller.response2.length,
              itemBuilder: (context, i) {
                
                return i<controller.response.length? submissionRequestCard(
                  requestDate:controller.response[i]["data"]["requestDate"],
                  statusName: controller.response[i]["data"]["statusName"],
                  Name: controller.response[i]["name"],
                  Data:{
                    "notes":controller.response[i]["data"]["notes"],
                    "curSpecName":controller.response[i]["data"]["curSpecName"],
                    "curColgName":controller.response[i]["data"]["curColgName"],
                    "newSpecName":controller.response[i]["data"]["newSpecName"],
                    "newColgName": controller.response[i]["data"]["newColgName"]
                  }
                  ):
                  controller.response2[i-controller.response.length]['crsName']=="إسقاط الفصل"?
                  SizedBox(
                    height: 0,
                  ):
                  submissionRequestCard(
                    requestDate:controller.response2[i-controller.response.length]['requestTimeInserted'] ,
                     statusName: controller.response2[i-controller.response.length]['statusName'],
                      Name: "اسقاط مساق ${controller.response2[i-controller.response.length]['crsName']}", Data: {
                        "notes":controller.response2[i-controller.response.length]['notes'],
                    "curSpecName":null,
                    "curColgName":null,
                    "newSpecName":null,
                    "newColgName": null
                      })
                  ;
              }),
        );
        },
        );
       
      },
    );
  }
}
