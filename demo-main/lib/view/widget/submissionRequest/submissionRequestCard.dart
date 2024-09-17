import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/data/datasource/static/static.dart';
import 'package:hebron_university_app/view/widget/Requests/ColorState.dart';

class submissionRequestCard extends StatelessWidget {
  const submissionRequestCard({super.key,required this.requestDate,required this.statusName,required this.Name,required this.Data});
  final String requestDate;
  final String statusName;
  final String Name;
  final dynamic Data;
  @override
  Widget build(BuildContext context) {
                    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: Slidable(
                      startActionPane:
                          ActionPane(motion: const StretchMotion(), children: [
                        GetBuilder<RequestsController>(
                          init: RequestsController(),
                          builder: (controller) {
                            return SlidableAction(
                              backgroundColor: Colors.yellow,
                              icon: Icons.interests_rounded,
                              label: "مهتم",
                              onPressed: (BuildContext context) {
                                print("ADD");
                                controller.addRequests(
                                    1,
                                    RequestData[1].type.toString(),
                                    RequestData[1].Icon.toString(),
                                    RequestData[1].Date.toString(),
                                    RequestData[1].State.toString(),
                                    RequestData[1].StateType.toString());
                              },
                            );
                          },
                        )
                      ]),
                      child: Container(
                        child: Center(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width - (Get.width * 0.2),
                                  height: textScaleFactor>=2?140:textScaleFactor>1.45?138:135,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        blurRadius: 24,
                                        offset: Offset(0, 12),
                                      ),
                                      BoxShadow(
                                        color: Color(0x4c000000),
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //Color State Reject
                                        Expanded(
                                            flex: 1,
                                            child: ColorState(
                                              image: ("images/waiting.png"),
                                              state:
                                                  ("images/waiting.png"),
                                            )),
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceAround,
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text(
                                                  '${Name}',
                                                  textAlign: TextAlign.right,
                                                  style:  TextStyle(
                                                    color: Colors.black,
                                                    fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?9:12,
                                                    fontWeight: FontWeight.w200,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text(
                                                  "${requestDate} التاريخ",
                                                  textAlign: TextAlign.right,
                                                  style:  TextStyle(
                                                    color: Colors.black,
                                                    fontSize: textScaleFactor>=2?8.5:textScaleFactor>1.45?9.5:14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    Text(
                                                      "الحالة:${statusName}",
                                                      textAlign:
                                                          TextAlign.right,
                                                      style:  TextStyle(
                                                        color: Colors.black,
                                                        fontSize: textScaleFactor>=2?8.5:textScaleFactor>1.45?9:10,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.toNamed(
                                                            "/detailsSubmittedRequest"
                                                            ,
                                                            arguments: Data
                                                            );
                                                      },
                                                      child: Text(
                                                        "تفاصيل",
                                                        textAlign:
                                                            TextAlign.right,
                                                        style:  TextStyle(
                                                          color: Colors.black,
                                                          fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?9:13,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ]),
                        ),
                      ),
                    ));
  }
}