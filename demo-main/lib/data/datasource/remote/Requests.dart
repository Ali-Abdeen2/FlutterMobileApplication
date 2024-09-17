import 'dart:developer';

import 'package:get/get.dart';
import 'package:hebron_university_app/LinkApi.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/core/class/crud.dart';

class Requests {
  Crud crud;

  Requests(this.crud);

  get_Data_Login_Post(Map data) async {
    var response = await crud.postDataLogin(AppLink.login, data);

    return response.fold((l) => l, (r) => r);
  }
  Semester_Postponement_Post(Map data) async
  {
    var response = await crud.postData(AppLink.addPostpone, data);

    return response.fold((l) => l, (r) => r);
  }
  Drop_Term_Post(Map data) async
  {
     var response = await crud.postData(AppLink.addTermDrop, data);

    return response.fold((l) => l, (r) => r);
  }
  Add_Spec_change(Map data) async
  {
    var response = await crud.postData(AppLink.AddSpecsChange, data);

    return response.fold((l) => l, (r) => r);
  }
  Post_Drop_Crs(Map data) async
  {
     var response = await crud.postData(AppLink.addCrsDrop, data);

    return response.fold((l) => l, (r) => r);
  }
  Register_Token(Map data) async
  {
     var response = await crud.postData(AppLink.RegisterToken, data);

    return response.fold((l) => l, (r) => r);
  }
  Set_Read(Map data) async
  {
     var response = await crud.postData(AppLink.SetRead, data);

    return response.fold((l) => l, (r) => r);
  }
  Delete_Notifaction(Map data)async
  {
    var response = await crud.postData(AppLink.DeleteNotifaction, data);

    return response.fold((l) => l, (r) => r);
  }
  Change_Password(Map data)async
  {
    var response = await crud.postData(AppLink.ChangePassword, data);

    return response.fold((l) => l, (r) => r);
  }
  Add_College_change(Map data) async
  {
     var response = await crud.postData(AppLink.AddCollegeChange, data);

    return response.fold((l) => l, (r) => r);
  }
  get_Free_Courses_(String Search) async
  {
    
    var response = await crud.getData("${AppLink.searchFreeCourse}${Search}");

    return response.fold((l) => l, (r) => r);
  }
  Delete_Course_Post(Map data)async
  {
    var response = await crud.postData(AppLink.DeleteCourse, data);

    return response.fold((l) => l, (r) => r);
  }
  get_available_classes_Post(Map data)async
  {
    var response = await crud.postData(AppLink.GetAvilableClasses, data);

    return response.fold((l) => l, (r) => r);
  }
  Add_Courses_Post(Map data)async
  {
    var response = await crud.postData(AppLink.AddCourse, data);

    return response.fold((l) => l, (r) => r);
  }
  Save_Reg()async
  {
    var response = await crud.postData(AppLink.SaveReg, {});

    return response.fold((l) => l, (r) => r);
  }
  get_Data_Profile_GET() async {
    var response = await crud.getData(AppLink.profile);

    return response.fold((l) => l, (r) => r);
  }
  get_Colleges_Get() async{
    var response = await crud.getData(AppLink.GetColleges);

    return response.fold((l) => l, (r) => r);
  }

  get_Data_LectureCard_GET() async {
    var response = await crud.getData(AppLink.StudyCard);

    return response.fold((l) => l, (r) => r);
  }
  get_Specs_Get(id)async {
    String link =AppLink.GetAllowedSpecs;
    link = link.replaceAll("Change", id.toString());
    var response = await crud.getData(link);

    return response.fold((l) => l, (r) => r);
  }
  get_Data_Study_Plan_GET() async {
    var response = await crud.getData(AppLink.studyPlan);
    return response.fold((l) => l, (r) => r);
  }

  get_Data_Marks_GET() async {
    var response = await crud.getData(AppLink.marks);
    return response.fold((l) => l, (r) => r);
  }

  get_Data_MarksTerm_GET(URL) async {
    String str="${AppLink.marks}/${URL.toString()}";
     var response = await crud.getData(str);
     return response.fold((l) => l, (r) => r);
  }

  get_Data_CourseFile_GET(URL) async{
    String str="${AppLink.marks}/${URL.toString()}";
    var response = await crud.getData(str);
     return response.fold((l) => l, (r) => r);
  }

    get_News_GET() async {
    var response = await crud.getData(AppLink.News);
    return response.fold((l) => l, (r) => r);
  }

  get_News_by_id_GET(id) async {
    var response = await crud.getData("${AppLink.News}/${id}");
    return response.fold((l) => l, (r) => r);
  }
  get_Requests_Status() async {
    var response1 = await crud.getData("${AppLink.GetcolgChange}");
    var response2 = await crud.getData("${AppLink.GetspecChange}");
    var response3 = await crud.getData("${AppLink.GettermPostpone}");
    var response4 = await crud.getData("${AppLink.GettermDrop}");
    List requests_info=[
      response1.fold((l) => l, (r) => r),
      response2.fold((l) => l, (r) => r),
      response3.fold((l) => l, (r) => r),
      response4.fold((l) => l, (r) => r)
    ];
    return requests_info;
  }
  get_Data_Reg_List_GET()async
  {
    var response = await crud.getData("${AppLink.Getreglist}");
    return response.fold((l) => l, (r) => r);
  }
  get_available_courses_GET()async
  {
    var response = await crud.getData("${AppLink.Getcourses}");
    return response.fold((l) => l, (r) => r);
  }
  get_Message_Get()async
  {
    var response = await crud.getData("${AppLink.GetMessages}");
    return response.fold((l) => l, (r) => r);
  }
  get_crs_Drop_Requests_List()async
  {
    var response = await crud.getData("${AppLink.crsDropRequestsList}");
    return response.fold((l) => l, (r) => r);
  }
  get_Crs_Drop_List()async
  {
    var response = await crud.getData("${AppLink.CrsDropList}");
    return response.fold((l) => l, (r) => r);
  }
}
