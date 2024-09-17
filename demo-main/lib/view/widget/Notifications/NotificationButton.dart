import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
      return  Badge(
                      
                      backgroundColor: Colors.transparent,
                      label: Container(
                        
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                        
                        ),
                      ),
                       
                        child: GetBuilder<NotificationController>(
                          builder: (controller) {
                          return Text(
                          "${controller.NumberOfMessages}"
                        ,
                        style: TextStyle(
                          fontSize: 8.6
                        ),
                        );
                        },),
                      ),
                      offset: Offset(10, 5),
                      largeSize: 30,
                      child: Icon(
                        size: 45,
                        color: Colors.black,
                        Icons.notifications),
                    );
    },);
  }
}