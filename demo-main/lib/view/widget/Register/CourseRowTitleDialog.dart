import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CourseRowTitleDialog extends StatelessWidget {
  const CourseRowTitleDialog({super.key});

  @override
  Widget build(BuildContext context) {
            final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        //color: ColorsApp.SemesterRowTitleBackgroundColor,
      ),
      width: Get.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
         
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "الحالة",
                  style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
           Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "من | إلى | الأيام",
                  style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "مدرس المساق",
                  style: TextStyle(
                     fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                              color: Color(0xffB6B6B6),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                child: Text("رقم الغرفة",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                          ? 6
                          : textScaleFactor > 1.45
                              ? 7
                              : 10,
                                color: Color(0xffB6B6B6),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center)),
          ),
          Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.center,
                child: Text("",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 17,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center)),
          ),
        ],
      ),
    );
  }
}