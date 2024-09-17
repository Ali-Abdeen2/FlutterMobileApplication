//Tibyan Test Commite&Push
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/data/model/GridViewMenuModel.dart';
import 'package:hebron_university_app/data/model/studentModel.dart';
import 'package:hebron_university_app/data/model/studyPlanCardModel.dart';
import 'package:hebron_university_app/view/screen/MenuScreen.dart';
import 'package:hebron_university_app/view/screen/PersonalProfile.dart';
import 'package:hebron_university_app/view/screen/StudyPlan.dart';

import '../../../core/constatnt/ColorsApp.dart';
import '../../../view/screen/scheduleLecture.dart';
import '../../model/NewsModel.dart';
import '../../model/ReauestesFormsModel.dart';
import '../../model/RequestsModel.dart';
import '../../model/onBoardingmodel.dart';

List<onBoardingModel> onBoardingList = [
  onBoardingModel(
      image: ImageAsset.onBoardingImageOne,
      title: "مرحبًا بك في تطبيق بورتال جامعة الخليل :)",
      text:
          "نحن سعداء جدًا بانضمامك إلينا ونسعد بمساعدتك في استكشاف رحلتك الأكاديمية. هنا دليل سريع للبدء:"),
  onBoardingModel(
      image: ImageAsset.onBoardingImageTwo,
      title: "تسجيل المقررات",
      text:
          "استعرض واختر المقررات التي تود أخذها بسهولة. واجهتنا  تتيح لك البحث عن المقررات حسب القسم، أو المادة، أو الكلمات الرئيسية المحددة."),
  onBoardingModel(
    image: ImageAsset.onBoardingImageThree,
    title: "خطة الدراسة",
    text:
        "استعرض واختر المقررات التي تود أخذها بسهولة. واجهتنا  تتيح لك البحث عن المقررات حسب القسم، أو المادة، أو الكلمات الرئيسية المحددة. ",
  ),
  onBoardingModel(
      image: ImageAsset.onBoardingImageFour,
      title: "إشعارات وتذكيرات",
      text:
          "سيقوم تطبيقنا بإرسال إشعارات في الوقت المناسب بشأن تواريخ التسجيل، ومواعيد إضافة وحذف المقررات، والامتحانات، والأحداث الرئيسية الأخرى.")
];

List<NewsModel> NewsList = [
  NewsModel(
    images: ImageAsset.News1,
    title: " جامعة الخليل تستقبل وفد أكاديمية أماديوس للسياحة والسفر ",
    News:
        "استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، في مكتبة وفداً من أكاديمية أماديوس أياتا  استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي،  ",
  ),
  NewsModel(
      images: ImageAsset.News2,
      title: "جامعة الخليل تستقبل الأمين العام لاتحاد الجامعات العربية",
      News:
          "استقبلت جامعة الخليل معالي الأمين العام لاتحاد الجامعات العربية الاستاذ الدكتور عمرو عزت سلامة والوفد المرافق له حيث كان في استقبال الضيف القائم بأعمال رئيس الجامعة الدكتور نبيل حساسنة، والنائب الأكاديمي الأستاذ الدكتور رضوان بركات، والنائب الإداري الأستاذ محمد زياد الجعبري، وعميد الدراسات العليا والبحث العلمي الأستاذ الدكتور عايد سلامه، وعميد كلية الطب الأستاذ الدكتور سليم الحاج يحيى، وعميدة كلية التمريض الأستاذة نعمه مناصرة، وحضر الاجتماع كل من الدكتور عماد الزير رئيس جامعة فلسطين الأهلية والدكتور أمجد برهم رئيس جامعة بوليتكنيك فلسطين.رحب الدكتور حساسنة بضيف الجامعة والوفد الكريم المرافق ونقل لهم تحيات رئيس مجلس الأمناء الدكتور نبيل الجعبري ومن ثم قدم عرضاً مقتضباًعن نشأة الجامعة، ومراحل تطورها وبرامجها الأكاديمية، والعلاقات الأكاديمية."),
  NewsModel(
      images: ImageAsset.News3,
      title:
          'كلية الحقوق والعلوم السياسية تختتم دورة تدريبية بعنوان "جرائم العصر" بالتعاون مع الاغاثة الطبية الفلسطينية',
      News: 'اختتمت كلية الحقوق والعلوم السياسية بالتعاون مع الإغاثة الطبية الفلسطينية في محافظة الخليل، دورة تدريبية بعنوان " جرائم العصر" . وانقسمت الدورة التدريبية ليومين متتاليين، تناول اليوم الأول الجرائم الالكترونية والتكييف القانوني لها ومدى خطورتها على المجتمع وتهديدها للأمن والسلم الأهلي في محافظة الخليل، إذ شارك في اللقاء الشرطة الفلسطينية ممثلة بالعقيد/ سفيان زحلان مدير فرع إدارة حماية الأسرة والأحداث لمحافظة الخليل، ومركز محور متمثل بمديرته المستشارة القانونية باسمة جبارين، والخبير الدولي في مجال الجرائم الإلكترونية الأستاذ كمال أبو زاكية. وتناول اليوم الثاني الجرائم المالية مثل جريمة غسل الأموال كذلك الإطار الدولي لحماية حقوق الإنسان (الجرائم المالية مثلاً)، وشارك في اللقاء محاضرين من كلية الحقوق د علاء خلايلة، ودكتور تامر الصرصور، ودكتور سامر نجم الدين والهيئة المستقلة لحقوق الإنسان متمثلة بالأستاذ بلال الملاح، كما وشارك في اللقاء الدكتور عثمان أبو صبحة مدير الإغاثة الطبية في محافظة الخليل والمستشارة القانونية مرام نصار' +
          'اختتمت كلية الحقوق والعلوم السياسية بالتعاون مع الإغاثة الطبية الفلسطينية في محافظة الخليل، دورة تدريبية بعنوان " جرائم العصر" . وانقسمت الدورة التدريبية ليومين متتاليين، تناول اليوم الأول الجرائم الالكترونية والتكييف القانوني لها ومدى خطورتها على المجتمع وتهديدها للأمن والسلم الأهلي في محافظة الخليل، إذ شارك في اللقاء الشرطة الفلسطينية ممثلة بالعقيد/ سفيان زحلان مدير فرع إدارة حماية الأسرة والأحداث لمحافظة الخليل، ومركز محور متمثل بمديرته المستشارة القانونية باسمة جبارين، والخبير الدولي في مجال الجرائم الإلكترونية الأستاذ كمال أبو زاكية. وتناول اليوم الثاني الجرائم المالية مثل جريمة غسل الأموال كذلك الإطار الدولي لحماية حقوق الإنسان (الجرائم المالية مثلاً)، وشارك في اللقاء محاضرين من كلية الحقوق د علاء خلايلة، ودكتور تامر الصرصور، ودكتور سامر نجم الدين والهيئة المستقلة لحقوق الإنسان متمثلة بالأستاذ بلال الملاح، كما وشارك في اللقاء الدكتور عثمان أبو صبحة مدير الإغاثة الطبية في محافظة الخليل والمستشارة القانونية مرام نصار'),
  NewsModel(
      images: ImageAsset.News1,
      title: "...جامعة الخليل تستضيف الإعلامي محمد الجعبري     ",
      News:
          "..جامعة الخليل تستضيف الإعلامي محمد الجعبري  ..جامعة الخليل تستضيف الإعلامي محمد الجعبري  ..جامعة الخليل تستضيف الإعلامي محمد الجعبري  ..جامعة الخليل تستضيف الإعلامي محمد الجعبري  "),
  NewsModel(
      images: ImageAsset.News1,
      title: " جامعة الخليل تستقبل وفد أكاديمية أماديوس للسياحة والسفر ",
      News:
          "استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، في مكتبة وفداً من أكاديمية أماديوس أياتا  استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي،  "),
  NewsModel(
      images: ImageAsset.News1,
      title:
          "جامعة الخليل تستضيف الإعلامي محمد الجعبري في دورة متقدمة في الإعداد والتقديم الإذاعي والتلفزيوني",
      News:
          "استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، في مكتبة وفداً من أكاديمية أماديوس أياتا  استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي،"),
  NewsModel(
      images: ImageAsset.News1,
      title: " جامعة الخليل تستقبل وفد أكاديمية أماديوس للسياحة والسفر ",
      News:
          "استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، في مكتبة وفداً من أكاديمية أماديوس أياتا  استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي، استقبل الأستاذ الدكتور رضوان بركات، النائب الأكاديمي،"),
];

List<StudentModel> StudentList = [
  StudentModel(
      id: "22011628",
      name: "علي عابدين",
      specialization: "علم حاسوب",
      password: "1234"),
  StudentModel(
      id: "22011417",
      name: "تبيان حرباوي",
      specialization: "وسائط متعددة",
      password: "1234"),
  StudentModel(
      id: "22011839",
      name: "ايمان نصار",
      specialization: " فرعي ادارة اعمال-علم حاسوب ",
      password: "1234"),
];

List<GridViewMenuModel> MenuList = [
  GridViewMenuModel(
      icon: "images/1News 1.png",
       title: "الأخبار", link: "/news"),
  GridViewMenuModel(
      icon: "images/2studeyPlan 1.png",
      title: "الخطة الدراسية",
      link: "/studyplan"),
  GridViewMenuModel(
      icon: "images/3requestsDocumentation 1.png",
      title: "طلبات",
      link: "/requestes"),
  GridViewMenuModel(
      icon: "images/studentGrade 1.png",
      title: "ملف العلامات",
      link: "/gradeFile"),
  GridViewMenuModel(
      icon: "images/changePassword5 1.png",
      title: "تغيير كلمة المرور",
      link: "/changePassword"),
  GridViewMenuModel(
      icon: "images/sch.png",
      title: "برنامج المحاضرات",
      link: "/scheduleLecture"),
      GridViewMenuModel(
      icon: "images/Frame 2133.png",
      title: "السحب والاضافة",
      link: "/register"),
      GridViewMenuModel(
      icon: "images/1News 1.png", title: "تسجيل الخروج", link: "/news"),
  // GridViewMenuModel(
  //     icon: "images/changePassword5 1.png",
  //     title: "بصمة الاصبع",
  //     link: "/fingerPoint"),
];

//main screens in home page

List navbarWidgets = [ 
  PersonalProfile(),
  StudyPlan(canBack:false),
   ScheduleLecture(canBack: false),
    MenuScreen(),
   
];


List<StudyPlanCardModel> studyplanList = [
  StudyPlanCardModel(
      title: "متطلب جامعة اجباري",
      hours: 15,
      hoursTaken: 12,
      remainingHours: 3,
      link: null,
      LinkIcon: "images/CompulsoryUniversityCourses.png"),
  StudyPlanCardModel(
      title: "متطلب جامعة اختياري",
      hours: 6,
      hoursTaken: 3,
      remainingHours: 3,
      link: null,
      LinkIcon: "images/ElectiveUniversityCourses.png"),
  StudyPlanCardModel(
      title: "متطلب كلية اجباري",
      hours: 6,
      hoursTaken: 3,
      remainingHours: 3,
      link: null,
      LinkIcon: "images/CompulsoryCollegeCourses.png"),
  StudyPlanCardModel(
      title: "متطلب تخصص اختياري",
      hours: 6,
      hoursTaken: 3,
      remainingHours: 3,
      link: null,
      LinkIcon: "images/ElectiveSpecializedCourses.png"),
  StudyPlanCardModel(
      title: "متطلب تخصص اجباري",
      hours: 6,
      hoursTaken: 3,
      remainingHours: 3,
      link: null,
      LinkIcon: "images/CompulsorySpecializedCourses.png"),
  StudyPlanCardModel(
      title: "مساقات حرة",
      hours: 3,
      hoursTaken: 0,
      remainingHours: 0,
      link: null,
      LinkIcon: "images/RandomCource.png"),
  StudyPlanCardModel(
      title: "مساقات استدراكية",
      hours: 3,
      hoursTaken: 0,
      remainingHours: 0,
      link: null,
      LinkIcon: "images/CompulsorySpecializedCourses.png"),
];

List<Requests> RequestData = [
  Requests(
      type: "سحب فصل دراسي",
      Icon: "images/reject.png",
      Date: "09/10/2020 ",
      State: "تم الرفض",
      StateType: "Rejection"),
  Requests(
      type: "سحب مساق",
      Icon: "images/done.png",
      Date: "11/09/2021 ",
      State: "تم القبول",
      StateType: "Done"),
  Requests(
      type: "تأجيل فصل",
      Icon: "images/waiting.png",
      Date: "6/12/2023 ",
      State: "قيد المراجعة",
      StateType: "Waiting"),
];

List<ReauestesForm> RequestesMen = [
  ReauestesForm(link: "/semesterWithdrawal", title: "نموذج سحب فصل دراسي"),
  ReauestesForm(
    link: "/withdrawingCourse",
    title: "نموذج سحب مساق ",
  ),
  ReauestesForm(
    link: "/ChangeCollege",
    title: "نموذج تحويل كلية",
  ),
  ReauestesForm(
    link: "/SemesterPostponement",
    title: "نموذج تأجيل فصل",
  ),
  
  ReauestesForm(
    link: "/ChangeMajor",
    title: "نموذج تحويل تخصص",
  ),
  
];
