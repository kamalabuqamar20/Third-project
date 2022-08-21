import 'package:firbase_test2/router/router.dart';
import 'package:flutter/material.dart';

class CustomDialoug{
 static showDialogFunction(String contect){
showDialog(context: AppRouter.navKey.currentContext!, 
    builder: (context)=>AlertDialog(
      content: Text(contect),
      actions: [TextButton(onPressed: (){
        AppRouter.popRoute();
      }, child: Text('ok'))],
      ));
  }
}