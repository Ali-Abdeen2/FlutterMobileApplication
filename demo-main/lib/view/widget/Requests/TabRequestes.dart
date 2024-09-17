import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabRequestes extends StatelessWidget {
  const TabRequestes({super.key, this.type, this.title});

  final type;
  final title;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      
      child: Column(
        children: [
          Container(
            height: 72,
            alignment: Alignment.center,
            child: Text("${title}",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
            fontSize: type=="selected"?textScaleFactor>1.45?11:13:textScaleFactor>1.45?10:12.5),)),
         Container(
          color: Colors.black,
          child: Text(""),
          
          height: type=="selected"?5:1,
          width: Get.width,
         )
        ],
      ),
    );
  }
}


/*Container(
        width: Get.width * 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        decoration: BoxDecoration(
          border: type == "selected"
              ? const Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 5.0,
                  ),
                )
              : const Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
        ),
        child: Text(
          "${title}",
          style: type == "selected"
              ? const TextStyle(
                  
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)
              : const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5),
          textAlign: TextAlign.center,
        )
        )*/