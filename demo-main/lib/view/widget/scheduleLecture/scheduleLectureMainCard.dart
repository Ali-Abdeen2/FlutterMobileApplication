import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constatnt/imageAsset.dart';

class scheduleLectureMainCard extends StatelessWidget {
  const scheduleLectureMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return 
 Container(
                        // width: Get.width * 0.850,
                        // height: Get.height * 0.20,
                        margin: EdgeInsets.only(
                            top: (Get.height * 0.02), left: 30, right: 30),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(1, 0, 59, 0.25),
                                offset: Offset(0, 34),
                                blurRadius: 50)
                          ],
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(97, 170, 97, 1),
                            Color.fromRGBO(161, 192, 152, 1)
                          ]),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: Get.height * 0.04),
                            // Row(
                            //   // textDirection: TextDirection.rtl,
                            //   children: [
                            //     Expanded(child: Text("")),
                            //     Container(
                            //       child: const Text(
                            //         "برنامج المحاضرات",
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 20,
                            //             fontWeight: FontWeight.bold,
                            //             height: 1),
                            //       ),
                            //     ),
                            //     Expanded(child: Text("")),
                            //   ],
                            // ),
                            Row(
                              children: [
                                const Expanded(child: Text("")),
                                Container(
                                  width:textScaleFactor>1.5?50:100,
                                  height: textScaleFactor>1.5?50:100,
                                  alignment: Alignment.topLeft,
                                  child: Image.asset("${ImageAsset.schedLast}"),
                                ),
                                const Expanded(child: Text("")),
                                 Column(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(
                                      // '                                 ',
                                      'جامعــــــة الخليــــــــــــــل \n\n\nجــدول الطــــالب\n',

                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: textScaleFactor>1.45?9:12,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                  ],
                                ),
                                const Expanded(child: Text("")),
                              ],
                            )
                          ],
                        ),
                      );
  }
}

