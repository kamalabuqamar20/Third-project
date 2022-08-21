import 'package:firbase_test2/models/category.dart';
import 'package:firbase_test2/providers/auth_provider.dart';
import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';
import '../../../../router/router.dart';

class UpdateCategory extends StatelessWidget {
  Category category;
  UpdateCategory(this.category);

//   @override
//   State<UpdateCategory> createState() => _UpdateCategoryState();
// }

// class _UpdateCategoryState extends State<UpdateCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 240, 199, 60),
        elevation: 0.0,
        centerTitle: true,
        title:const Text('Update Category',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
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
               /* CircleAvatar(
                  radius: 50,backgroundColor: Colors.green,
                  backgroundImage:NetworkImage(category.imageUrl) ,
                  ):*/
                     Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:  Colors.black,),
                  borderRadius: BorderRadius.circular(30), 
                  color: Colors.grey[400],
                ),
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                     height: 270,
                     width: MediaQuery.of(context).size.width,
                     
                     child: Image.network(category.imageUrl,fit: BoxFit.cover,) ,
                     ):
               /* CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(provider.seletedImage!),),*/
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
                const    SizedBox(height: 20,),
            /*  TextFormField(
                controller: provider.categoryNameController,
              ),*/
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
            /*  ElevatedButton(onPressed: (){
                provider.updateCategory(category);
              }, child: Text('Update Category'))*/
               ElevatedButton(onPressed: ()async{
                 // await  provider.addNewCategory();
                await provider.updateCategory(category);
                  AppRouter.popRoute();
                 // Navigator.push(context, MaterialPageRoute(builder: ((context) => Navigator())));
             //  AppRouter.NavigateToWidget(CategoriesScrean());
                  }, child: Text('Update Category',style: TextStyle(color: Color.fromARGB(255, 240, 199, 60),fontSize: 20,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                   padding:const EdgeInsets.symmetric(horizontal:60,vertical: 10 ),
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
            CircleAvatar(
              radius: 50,backgroundColor: Colors.green,
              backgroundImage:NetworkImage(category.imageUrl) ,
              ):
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
            provider.updateCategory(category);
          }, child: Text('Update Category'))

        ],);
      }
    ),
    );
*/