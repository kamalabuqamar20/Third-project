import 'package:firbase_test2/models/product.dart';
import 'package:firbase_test2/providers/auth_provider.dart';
import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';

class UpdateProduct extends StatelessWidget {
  Product product;
String catId;
UpdateProduct(this.product,this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 240, 199, 60),
        elevation: 0.0,
        centerTitle: true,
        title:const Text('Update Product',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
       /* actions: [
          IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
          }, icon:const Icon(Icons.logout))
        ],*/
        leading: IconButton(onPressed: (){
         AppRouter.popRoute();
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
               /* CircleAvatar(radius: 50,backgroundColor: Colors.green,):*/
                Container(
                        decoration: BoxDecoration(
                          border: Border.all(color:  Colors.black,),
                      borderRadius: BorderRadius.circular(30), 
                      color: Colors.grey[400],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                         height: 270,
                         width: MediaQuery.of(context).size.width,
                         
                         child: Image.network(product.image,fit: BoxFit.cover,) ,
                         ):
              /*  CircleAvatar(
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
             /* TextFormField(
                controller: provider.productNameController,
              ),*/
              Container(
                       decoration: BoxDecoration(
                         border: Border.all(color:  Colors.black,),
                         color: Colors.grey[400], 
                       ),
                                     
                        child: TextFormField(
                          controller: provider.productNameController,
                          decoration:const InputDecoration(
                            iconColor:  Colors.black,
                           hoverColor:  Colors.black,
                           focusColor: Colors.black,
                           hintText: 'Name The Product',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
            const  SizedBox(height: 20,),
              /* TextFormField(
                controller: provider.productDescController,
              ),*/
               Container(
                       decoration: BoxDecoration(
                         border: Border.all(color:  Colors.black,),
                         color: Colors.grey[400], 
                       ),
                                     
                        child: TextFormField(
                          controller: provider.productDescController,
                          decoration:const InputDecoration(
                            iconColor:  Colors.black,
                           hoverColor:  Colors.black,
                           focusColor: Colors.black,
                           hintText: 'Descrbtion The Product',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                 const   SizedBox(height: 20,),
              /* TextFormField(
                keyboardType: TextInputType.number,
                controller: provider.productPriceController,
              ),*/
               Container(
                       decoration: BoxDecoration(
                         border: Border.all(color:  Colors.black,),
                         color: Colors.grey[400], 
                       ),
                                     
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: provider.productPriceController,
                          decoration:const InputDecoration(
                            iconColor:  Colors.black,
                           hoverColor:  Colors.black,
                           focusColor: Colors.black,
                           hintText: 'Price The Product',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                 const   SizedBox(height: 20,),
            /*   TextFormField(
                 keyboardType: TextInputType.number,
                controller: provider.productQuantityController,
              ),*/
               Container(
                       decoration: BoxDecoration(
                         border: Border.all(color:  Colors.black,),
                         color: Colors.grey[400], 
                       ),
                                     
                        child: TextFormField(
                           keyboardType: TextInputType.number,
                          controller: provider.productQuantityController,
                          decoration:const InputDecoration(
                            iconColor:  Colors.black,
                           hoverColor:  Colors.black,
                           focusColor: Colors.black,
                           hintText: 'Name The Product',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
             
        
              SizedBox(height: 30,),
            /*  ElevatedButton(onPressed: (){
                provider.updateProduct(product,catId);
              }, child: Text('Update Producet'))*/
               ElevatedButton(onPressed: ()async{
                     // await  provider.addNewCategory();
                    await  provider.updateProduct(product,catId);
                      AppRouter.popRoute();
                     // Navigator.push(context, MaterialPageRoute(builder: ((context) => Navigator())));
                 //  AppRouter.NavigateToWidget(CategoriesScrean());
                      }, child: Text('Update Product',style: TextStyle(color: Color.fromARGB(255, 240, 199, 60),fontSize: 20,fontWeight: FontWeight.bold),),
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