import 'package:flutter/material.dart';
import 'package:hebron_university_app/view/screen/DetailsSubmittedRequest.dart';

class DetailsSubmittedRequestCard extends StatelessWidget {
  const DetailsSubmittedRequestCard({super.key,this.index,this.row1,this.row2,this.row3});

  final index;
  final row1;
  final row2;
  final row3;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 238, 238),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(155, 202, 202, 202).withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Row( 
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(child: 
                  Container(
                   
                    child: Text(
                      "${index}",
                      textAlign: TextAlign.right,
                      // textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Color.fromARGB(255, 164, 164, 164),
                        fontSize:textScaleFactor>=2?25:50
                      ),
                    ),
                  ),
                  flex: 2
                  ,
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: double.infinity,
                      
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "${row1}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 121, 121, 121),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            "${row2}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 121, 121, 121),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                          Container(
                            
                            
                            child: Text(
                              
                              
                              "${row3}",
                              style: TextStyle(
                                
                                color: Color.fromARGB(255, 121, 121, 121),
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
              )
            );
  }
}



