import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/firestore_provider.dart';
import '../../../../router/router.dart';
import 'all_photo_screan.dart';

class AddNewPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* backgroundColor: Color(0xffEAF0F9),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Add New Photo"),
      ),*/
      backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 240, 199, 60),
        elevation: 0.0,
        centerTitle: true,
        title:const Text('Add an ad',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
       /* actions: [
          IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
          }, icon:const Icon(Icons.logout))
        ],*/
        leading: IconButton(onPressed: (){
         AppRouter.popRoute();
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),
      ),
      
      body: Consumer<FirestoreProvider>(builder: (context, provider, x) {
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            provider.seletedImage == null
                ? InkWell(
                    onTap: () {
                      provider.selectImagen();
                    },
                    child: Container(
                      margin:
                        const  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding:const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.grey,
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        
                      ),
                      height: 190,
                      width: double.infinity,
                      child:const Icon(Icons.add,color: Colors.black,size: 45,),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: EdgeInsets.all(10),
                   /* decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),*/
                    
                     decoration:  BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 240, 199, 60),
                        borderRadius:const BorderRadius.all(Radius.circular(10)),
                        
                      ),
                    
                    height: 190,
                    width: double.infinity,
                    child: Image.file(
                      provider.seletedImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  await provider.AddNewPhoto();
                  await provider.getAllPhotos();
                 // AppRouter.NavigateWithReplacemtnToWidget(AllPhotosScreen());
                 AppRouter.popRoute();
                 
                },
                //////////////////////////////////////////////////
                style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                       padding:const EdgeInsets.symmetric(horizontal:90,vertical: 10 ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        
                ),
                 ///////////////////////////////////////////////////
                child: Text("Add an ad"))
          ],
        );
      }),
    );
  }
}