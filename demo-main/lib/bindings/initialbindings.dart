import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/crud.dart';

class Initialbindings extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Crud());
  }

}