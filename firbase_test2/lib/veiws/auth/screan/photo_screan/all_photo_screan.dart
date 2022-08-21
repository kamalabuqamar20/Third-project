import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../providers/firestore_provider.dart';
import '../../../../router/router.dart';
import 'add_photo_screan.dart';
import 'widget_photo_screan.dart';

class AllPhotosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),
        elevation: 0.0,
        centerTitle: true,
        title:const Text(' Ad display screen',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),),
     /* backgroundColor: Color(0xffEAF0F9),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("photos"),
      ),*/
      body: Consumer<FirestoreProvider>(builder: (y, provider, x) {
        
        provider.getAllPhotos();
        return provider.photos == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.photos.length,
                itemBuilder: (context, index) {
                  return PhotosWidget(provider.photos[index]);
                });
      }),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          AppRouter.NavigateToWidget(AddNewPhoto());
        },
        child: Icon(Icons.add),
      ),*/
       floatingActionButton: FloatingActionButton(
      onPressed: (){
      //  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScrean(),), );
     // AppRouter.NavigateToWidget(NewProduct(widget.catId));
      AppRouter.NavigateToWidget(AddNewPhoto());
      },
     backgroundColor: Colors.black,
      //child:const Icon(Icons.add,color:  Color.fromARGB(255, 240, 199, 60),),
      child: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_tf6wSv.json'),
      ),
    );
  }
}