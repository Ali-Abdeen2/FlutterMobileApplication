import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/bindings/initialbindings.dart';
import 'package:hebron_university_app/controller/MainControllers/MainController.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/core/class/crud.dart';
import 'package:hebron_university_app/core/constatnt/middleware/middleWareLoginPage.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/screen/ChangeCollege.dart';
import 'package:hebron_university_app/view/screen/ChangeMajor.dart';
import 'package:hebron_university_app/view/screen/ChangePassword.dart';
import 'package:hebron_university_app/view/screen/CourseMark.dart';
import 'package:hebron_university_app/view/screen/GradeFile.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:hebron_university_app/view/screen/News.dart';
import 'package:hebron_university_app/view/screen/Notifications.dart';
import 'package:hebron_university_app/view/screen/Semester.dart';
import 'package:hebron_university_app/view/screen/StudyPlan.dart';
import 'package:hebron_university_app/view/screen/StudyPlanSchedule.dart';
import 'package:hebron_university_app/view/screen/login.dart';
import 'package:hebron_university_app/view/screen/onboarding.dart';
import 'package:hebron_university_app/view/screen/register.dart';
import 'package:hebron_university_app/view/screen/scheduleLecture.dart';
import 'package:hebron_university_app/view/screen/semesterWithdrawal.dart';
import 'package:permission_handler/permission_handler.dart';
import 'core/constatnt/middleware/middleWareOnBoarding.dart';
import 'data/datasource/static/static.dart';
import 'data/model/NewsModel.dart';
import 'functions/ReConnecton.dart';
import 'view/screen/DetailsSubmittedRequest.dart';
import 'view/screen/NewsDetailes_.dart';
import 'view/screen/Requests.dart';
import 'view/screen/SemesterPostponement.dart';
import 'view/screen/WithdrawingCourse.dart';



Future<void> _requestNotificationPermission() async {
  try
  {
    print("11");
  final status = await Permission.notification.status;
  print(status);
  print("22");
  if (status.isDenied) {
    print("33");
    await Permission.notification.request();
    print("44");
  }
  print("55");
  }
  catch(e)
  {
    print(e.toString());
  }
}





void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  
  await initialServices();
  
  HttpOverrides.global = MyHttpOverrides();
  
  
  Timer.periodic(
      Duration(
        minutes: 14,
      ), (timer) {
    ReConnection();
  });

  
  
await _requestNotificationPermission();

await Firebase.initializeApp();

FirebaseMessaging.onMessage.listen((event) async{
    if(event.notification!=null)
    {
      NotificationController notificationController=Get.put(NotificationController());
      
      print("+++++++++++++++++++++");
      print(event.notification!.title);
      print(event.notification!.body);
      print("+++++++++++++++++++++");

      Get.snackbar(
                  '${event.notification!.title}',
                  '${event.notification!.body}',
                );
                Timer.periodic(
      Duration(
        seconds: 1,
      ), (timer1) async{
    await notificationController.GetNoti();
                        print("1");
                        timer1.cancel();
  });
        
    }
  },);
  
print("the token = ${await FirebaseMessaging.instance.getToken()}");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
       child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo'),
      getPages: [
        GetPage(
            name: "/",
            page: () => onBoarding(PageIndex: 0),
            middlewares: [MiddleWareOnBoarding()]),
        GetPage(
            name: "/login",
            page: () => LoginPage(),
            middlewares: [MiddleWareLoginPage()]),
        GetPage(name: '/home', page: () => HomePage(), middlewares: []),
        GetPage(name: '/news', page: () => News(), middlewares: []),
        GetPage(name: '/studyplan', page: () => StudyPlan(canBack: true), middlewares: []),
        GetPage(
            name: '/StudyPlanSchedule',
            page: () => StudyPlanSchedule(),
            middlewares: []),
        GetPage(name: '/gradeFile', page: () => GradeFile(), middlewares: []),
        GetPage(name: '/semester', page: () => Semester(), middlewares: []),
        GetPage(name: '/courseMark', page: () => CourseMark(), middlewares: []),
        GetPage(
            name: '/changePassword',
            page: () => changePassword(),
            middlewares: []),
        GetPage(
            name: '/scheduleLecture',
            page: () => ScheduleLecture(canBack: true),
            middlewares: []),
        GetPage(name: '/requestes', page: () => Requestes(index: 2), middlewares: []),
        GetPage(
            name: '/withdrawingCourse',
            page: () => WithdrawingCourse(
                  canBack: null,
                ),
            middlewares: []),
            GetPage(
            name: '/ChangeMajor',
            page: () => ChangeMajor(
                  
                ),
            middlewares: []),
        GetPage(
            name: '/Notification',
            page: () => StudentNotification(),
            middlewares: []),
        GetPage(
            name: '/detailsSubmittedRequest',
            page: () => DetailsSubmittedRequest(),
            middlewares: []),
            GetPage(
            name: '/semesterWithdrawal',
            page: () => semesterWithdrawal(),
            middlewares: []),
            GetPage(
            name: '/SemesterPostponement',
            page: () => SemesterPostponement(),
            middlewares: []),
            
        GetPage(
            name: '/newsDetailes',
            page: () => NewsDetaile(
                 
                  
                ),
            middlewares: []),
            GetPage(
            name: '/register',
            page: () => register(
                ),
            middlewares: []),
             GetPage(
            name: '/ChangeCollege',
            page: () => ChangeCollege(
                ),
            middlewares: [])
            
        // GetPage(
        //   name: '/newsDetailes',
        //   page: () {
        //     final args = Get.arguments as Map<String, dynamic>?;

        //     if (args == null || !args.containsKey('index')) {
        //       print('Invalid arguments or missing index');
        //       return Container(); // Handle invalid arguments or missing index
        //     }

        //     final int index = args['index'];

        //     if (index < 0 || index >= NewsList.length) {
        //       print('Invalid index: $index');
        //       return Container(); // Handle out-of-bounds index
        //     }

        //     print('Received arguments: $args, index: $index');

        //     return NewsDetaile(newsModel: NewsList[index], index: index);
        //   },
        //   middlewares: [],
        // ),
      ],
      initialBinding: Initialbindings(),
    )
    );
  }
}
