

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TextFieldController extends GetxController
{
  String? validatorMsg;
  bool isObscureText=false;

  setData(bool isSecure)
  {
    isObscureText=isSecure;
  }
  
}