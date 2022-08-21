//import'package:firbase_test2/data/auth_helper.dart' ;
import 'package:firbase_test2/providers/auth_provider.dart';
//import 'package:firbase_test2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class SplachScrean extends StatefulWidget {
  @override
  State<SplachScrean> createState() => _SplachScreanState();
}

class _SplachScreanState extends State<SplachScrean> {
  navigateFun()async{
   await Future.delayed(Duration(seconds: 3));
   Provider.of<AuthProvider>(context,listen: false).checkUser();
   //AuthHelper.authHelper.checkUser();
  }

 // const SplachScrean({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    navigateFun();
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,backgroundColor:const Color.fromARGB(255, 240, 199, 60),
       /* title:const  Text('online store',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),*/),
     //backgroundColor: 
     /* body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logos/shoping2.jpg'),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.yellow.withOpacity(0.5),BlendMode.darken))),
           // child:const Center(child: Text('online store',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),) ,
        ),*/
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
               const SizedBox(height: 15,),
          const  Text('online store',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.black),),
         const SizedBox(height: 55,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset('assets/logos/online-shop.jpg',fit: BoxFit.cover,width: double.infinity,height: 350,))
            ],
          ),
        ),
     
    );
  }
}