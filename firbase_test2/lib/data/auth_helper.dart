

//import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/main_home.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/categories_screan.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';

import '../custom_dialoug.dart';
//import '../veiws/auth/screan/home/home_screan.dart';
import '../veiws/auth/screan/login.dart';
import '../veiws/auth/screan/photo_screan/all_photo_screan.dart';

class AuthHelper{
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  Future<UserCredential?> singIn(String email , String password)async{
   try {
  final credential = await firebaseAuth.signInWithEmailAndPassword(// FirebaseAuth.instance
    email: email,
    password: password
  );
  return credential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    CustomDialoug.showDialogFunction('No user found for that email.');
    // showDialog(context: AppRouter.navKey.currentContext!, 
    // builder: (context)=>AlertDialog(
    //   content: Text('No user found for that email.'),
    //   actions: [TextButton(onPressed: (){
    //     AppRouter.popRoute();
    //   }, child: Text('ok'))],
    //   ));
    //print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }
 Future<UserCredential?> singUp(String email , String password)async{
     try {
  final credential = await firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return credential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
  checkUser()async{
   User? user= firebaseAuth.currentUser;
   if(user ==null){
    AppRouter.NavigateWithReplacemtnToWidget(MyStatefulWidget());//MyStatefulWidget()
   }else{
    //HomeScrean
    AppRouter.NavigateWithReplacemtnToWidget(MainHome());//()HomeScrean AllPhotosScreen CategoriesScrean
   }
  }
  singOut()async{
    await firebaseAuth.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(MyStatefulWidget());
  }
  forgetPassword(String email)async{
try {
  await firebaseAuth.sendPasswordResetEmail(email: email);
  CustomDialoug.showDialogFunction('الرجاء متابعة الايميل الخاص بك لتغير كلمة المرور');
} on Exception catch (e) {
  // TODO
  
}
  }
}