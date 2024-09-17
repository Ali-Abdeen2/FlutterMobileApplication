import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';

handlingData(response)
{
  if(response is statusRequest)
  {
    return response;
  }
  else
  {
    return statusRequest.success;
  }
}