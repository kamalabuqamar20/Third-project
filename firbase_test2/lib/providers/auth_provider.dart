import 'package:firbase_test2/data/auth_helper.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/home_screan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../veiws/auth/screan/home/categories_screan.dart';

class AuthProvider extends ChangeNotifier{
  GlobalKey<FormState> loginKey = GlobalKey();
  /////////////////////////////////////////////////
  GlobalKey<FormState> signUpKey = GlobalKey();
  //////////////////////////////////////////////////
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController = TextEditingController();
  nullValistion(String? v){
    if(v==null||v.isEmpty){
      return 'هذا الحقل مطلوب';
    }
  }
   String? emailValidation(String? value){
    if(!isEmail(value??'')){
      return 'صيغة ايميل خاطئة';
    }
    return null;
    
  }
  String? passwordValidation(String? value){
    if(value!.length<6){
      return 'يجب ان تكون كلمة المرور مكونةمن 6 خانات عل الاقل';
    }
     return null;
  }
singnIn()async{
 // ;
 if(loginKey.currentState!.validate()){
  UserCredential? credentials = await AuthHelper.authHelper.singIn(emailController.text, passwordController.text);
  if(credentials!=null){
    AppRouter.NavigateWithReplacemtnToWidget(CategoriesScrean());
  }
 }
}
singnUp()async{
 // ;
 if(signUpKey.currentState!.validate()){
  UserCredential? credentials = await AuthHelper.authHelper.singUp(emailController.text, passwordController.text);
  if(credentials!=null){
    AppRouter.NavigateWithReplacemtnToWidget(CategoriesScrean());
  }
 }
}
checkUser(){
  AuthHelper.authHelper.checkUser();
}
signOut(){
  AuthHelper.authHelper.singOut();
}
forgetPassword(){
  AuthHelper.authHelper.forgetPassword('kamalaboqamar@gmail.com');
}
}