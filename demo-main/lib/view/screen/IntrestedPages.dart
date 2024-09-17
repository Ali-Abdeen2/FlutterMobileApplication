import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../controller/RequestsController/RequestsController.dart';
import '../../core/constatnt/ColorsApp.dart';
import '../../data/datasource/static/static.dart';
import '../widget/Requests/ColorState.dart';

/*
class IntrestedPage extends StatefulWidget {
  @override
  State createState() {
    return IntrestedPageState();
  }
}

class IntrestedPageState extends State {
  List<dynamic> intrested = Requests().getList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.onBoardingBackgroundColor,
      body: (intrested.length > 0)
          ? ListView.builder(
              itemCount: intrested.length,
              itemBuilder: (context, i) {
                final item = intrested[i];
                return Slidable(
                  startActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                      backgroundColor: Color.fromARGB(255, 253, 197, 148),
                      icon: Icons.delete,
                      label: "حذف",
                      onPressed: (BuildContext context) {
                        setState(() {
                          Requests().removeItem(i);
                          intrested =
                              Requests().getList(); // Update the intrested list
                        });
                      },
                    )
                  ]),
                  child: Container(
                    width: 390,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 22),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 313.50,
                          height: 99,
                          child: Container(
                            width: 313.50,
                            height: 99,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ColorState(
                                    image: ("${item['Icon']}"),
                                    state: ("${item['StateType']}"),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        '${item['type']}',
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      Text(
                                        "${item['Date']} التاريخ",
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "الحالة: ${item['State']}",
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "فارغ",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
    );
  }
}
*/

class IntrestedPage extends StatelessWidget {
  const IntrestedPage({super.key});

  @override
  Widget build(BuildContext context) {
    RequestsController requestsController = Get.put(RequestsController());
    return OrientationBuilder(
      builder: (context, orientation) {
        return GetBuilder<RequestsController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: ColorsApp.onBoardingBackgroundColor,
              body: Center(
                      child: Text(
                        "فارغ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
