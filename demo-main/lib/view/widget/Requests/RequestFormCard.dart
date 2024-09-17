import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/CrsDropController.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestFormController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'WithdrawalCourse.dart';

class RequestFormCard extends StatelessWidget {
  const RequestFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CrsDropController>(
      init: CrsDropController(),
      builder: (controller) {
        return 
            controller.StatusRequest==statusRequest.loading?Container(
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):
            controller.StatusRequest==statusRequest.error?
            Center(
              child: Text("حدث خطأ")
            ):
            controller.StatusRequest==statusRequest.noContent?
             Center(
              child: Text("لا يوجد محتوى")
            ):
            controller.response['errorCode']=="ERR_AlreadyHasTermDropRequest"?
            Center(
              child: Text("لقد تم تقديم طلب بالفعل"),
            ):
             ListView.builder(
                    itemCount: controller.response['data'].length+1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                              ]),
                        );
                      } else
                        return WithDrawSub(
                          Button: true,
                          classNo: controller.response['data'][index - 1]
                              ['classNo'],
                              crsNo: controller.response['data'][index - 1]
                              ['crsNo'],
                          TeacherName: controller.response['data'][index - 1]
                              ['tchrAName'],
                          SubjectName: controller.response['data'][index - 1]
                              ['crsANameConfig'],
                          crsTime: controller.response['data'][index - 1]
                              ['timeRoomTeacher'],
                          roomNo: controller.response['data'][index - 1]['roomNo'],
                          rowId:controller.response['data'][index-1]['rowId']
                        );
                    },
                  );
                
      },
    );
  }
}
