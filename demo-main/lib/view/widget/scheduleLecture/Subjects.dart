import 'package:flutter/material.dart';
import 'package:get/get.dart';

class subjects extends StatelessWidget {
  const subjects(
      {super.key,
      required this.TeacherName,
      required this.SubjectName,
      required this.crsTime,
      required this.roomNo});
  final String TeacherName;
  final String SubjectName;
  final roomNo;
  final crsTime;

  @override
  Widget build(BuildContext context) {
    print(SubjectName);
    return
    OrientationBuilder(builder: (context, orientation) {
      return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      alignment: Alignment.topRight,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width:Get.width*0.5,
                    child: Text(
                    
                      "${SubjectName.toString().trim().split(RegExp(r'\s+')).join(" ")}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width:Get.width*0.5,
                    child: Text(
                      "${crsTime}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width:Get.width*0.5,
                    child: Text(
                      "${TeacherName}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width:Get.width*0.5,
                    child: Text(
                      "${roomNo}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: const Color(0xff363948),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${crsTime.toString().substring(7, 12)}\n|\n${crsTime.toString().substring(1, 6)}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xffd4dff8),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
    },
    );
  }
}
