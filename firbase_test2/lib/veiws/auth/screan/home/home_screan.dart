//import 'dart:developer';
//import 'dart:io';

//import 'package:firbase_test2/data/storage_helper.dart';
import 'package:firbase_test2/providers/auth_provider.dart';
import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/categories_screan.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';

class HomeScrean extends StatefulWidget {
  

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 240, 199, 60),
        elevation: 0.0,
        centerTitle: true,
        title:const Text('Add Category',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
       /* actions: [
          IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
          }, icon:const Icon(Icons.logout))
        ],*/
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),
      ),
    body: Consumer<FirestoreProvider>(
      builder: (context,provider,x) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              InkWell(
                onTap: (){
                   provider.selectImagen();
                },
                child: provider.seletedImage==null?
               // CircleAvatar(radius: 50,backgroundColor: Colors.green,):
               Container(
                decoration: BoxDecoration(
                  border: Border.all(color:  Colors.black,),
              borderRadius: BorderRadius.circular(30), 
              color: Colors.grey[400],
            ),
                 height: 270,
                 width: MediaQuery.of(context).size.width,
                 
                 child:const Icon(Icons.add,color: Colors.black,),
                 ):
                // CircleAvatar(
                //   radius: 50,
                //   backgroundImage: FileImage(provider.seletedImage!),),
                Container(
                   decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), 
               border: Border.all(color:  Colors.black,),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
                     height: 270,
                        width: MediaQuery.of(context).size.width,
                    child:Image(image: FileImage(provider.seletedImage!),fit: BoxFit.cover,) ),
              ),
             const SizedBox(height: 30,),
              Container(
               decoration: BoxDecoration(
                 border: Border.all(color:  Colors.black,),
                 color: Colors.grey[400], 
               ),
                             
                child: TextFormField(
                  controller: provider.categoryNameController,
                  decoration:const InputDecoration(
                    iconColor:  Colors.black,
                   hoverColor:  Colors.black,
                   focusColor: Colors.black,
                   hintText: 'Name The Category',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: ()async{
              await  provider.addNewCategory();
              await provider.getAllCategories();
              AppRouter.popRoute();
             // Navigator.push(context, MaterialPageRoute(builder: ((context) => Navigator())));
         //  AppRouter.NavigateToWidget(CategoriesScrean());
              }, child: Text('New Category',style: TextStyle(color: Color.fromARGB(255, 240, 199, 60),fontSize: 20,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
               padding:const EdgeInsets.symmetric(horizontal:90,vertical: 10 ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                
              ),
              )
        
            ],),
          ),
        );
      }
    ),
    );
  }
}
//Center(child: RaisedButton(
  //       onPressed: ()async{
  //      // Provider.of<FirestoreProvider>(context,listen: false).insertNewCategory();
  //    XFile? xfile = await  ImagePicker().pickImage(source: ImageSource.gallery);
  // String url = await StorageHelper.storageHelper.uploadImage(File(xfile!.path));
  // log(url);
  //     },child:const Text('succes login')),),






  //////////////////////////////////////////////////////////////////////////////////////
  /*
  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
          }, icon:const Icon(Icons.logout))
        ],
      ),
    body: Consumer<FirestoreProvider>(
      builder: (context,provider,x) {
        return Column(children: [
          InkWell(
            onTap: (){
               provider.selectImagen();
            },
            child: provider.seletedImage==null?
            CircleAvatar(radius: 50,backgroundColor: Colors.green,):
            CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(provider.seletedImage!),),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: provider.categoryNameController,
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            provider.addNewCategory();
          }, child: Text('New Category'))

        ],);
      }
    ),
    );
  */