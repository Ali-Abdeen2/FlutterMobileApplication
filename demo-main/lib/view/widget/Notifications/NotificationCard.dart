import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key,required this.id,required this.isRead,required this.date,required this.sender,required this.notifContent,required this.title});
  final notifContent;
  final title;
  final sender;
  final id;
  final date;
  final isRead;
  @override
  Widget build(BuildContext context) {
    NotificationController notificationController=Get.put(NotificationController());
    DateTime dateTime = DateTime.parse(date);
    return Container(
                      margin:  EdgeInsets.all(20),
                      child: IntrinsicHeight(
                        
                        child: Row(
                          children: [
                           Expanded(
                            flex: 84,
                            child: 
                            Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Expanded(
                            flex: 2,
                            child: 
                            Container(
                              alignment: Alignment.topLeft,
                              
                              child: IconButton(onPressed: () async{
                                notificationController.DeleteMessage(id);
                              }, icon: Icon(
                                size: 30,
                                Icons.delete_rounded)),
                            ),
                            
                           ),
                                  Expanded(
                            flex: 10,
                            child: 
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              alignment: Alignment.centerRight,
                              
                              child: Column(
                                children: [
                                  Text("${sender}",
                                   style: TextStyle(
                                          fontWeight:isRead==false? FontWeight.w700:FontWeight.w100,
                                        
                                      ),
                                  ),
                                  Text("${title}"
                                  ,
                                   style: TextStyle(
                                        fontWeight:isRead==false? FontWeight.w700:FontWeight.w100,
                                        
                                      ),
                                  ),
                                  Text(
                                    "${dateTime.year}-${dateTime.month}-${dateTime.day}"
                                  ,
                                   style: TextStyle(
                                          fontWeight:isRead==false? FontWeight.w700:FontWeight.w100,
                                        
                                      ),
                                  ),
                                  InkWell(
                                    onTap: () async{
                                      await notificationController.ReadNoti(id);
                                      showModalBottomSheet<void>(
                                        backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200, // Set the desired height
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0), // Adjust border radius as needed
                                              topRight: Radius.circular(20.0), // Adjust border radius as needed
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${notifContent}'),
                                          ),
                                        );
                                      },
                                    );

                                    },
                                    child: Text(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff78B976)
                                      ),
                                     
                                      "مشاهدة"),
                                  )
                                ],
                              ),
                            ),
                            
                           )
                                ],
                              ),
                            ),
                            
                           ),
                           Container(
                            width: 5,
                            height: double.infinity,
                            color: Colors.grey,
                           ),
                           Expanded(
                            flex: 16,
                            child: 
                            Container(
                              alignment: Alignment.center,
                              height: double.infinity,
                              color: Color(0xffC4EAC4),
                              child: SvgPicture.asset(
                               
                              '${ImageAsset.Messageicon}', 
                              
                              height:
                                  100
                            ),
                            ),
                            //ep-info
                           )
                          ],
                        ),
                      ),
                    );
  }
}