import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/category_widget.dart';
import 'package:firbase_test2/veiws/auth/screan/home/home_screan.dart';
import 'package:firbase_test2/veiws/product_screan/add_product_screan.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';
import '../../../product_screan/all_products_screan.dart';

class CategoriesScrean extends StatelessWidget {
  //const CategoriesScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
        /*leading:  IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
          }, icon:const Icon(Icons.logout,color: Colors.black,)),*/
           leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
        elevation: 0.0,
        centerTitle: true,
        title:const Text(' Categories Screan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),),
      body: Consumer<FirestoreProvider>(
      builder: (x,provider,y) {
        return 
        provider.categories == null?
       const Center(child: CircularProgressIndicator(),):
        ListView.builder(
          itemCount: provider.categories.length,///////////////////////////////////////////////////
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                  provider.getAllProducts(provider.categories[index].catId);
                AppRouter.NavigateToWidget(ProductsScreen(provider.categories[index].catId));
              
              },
              child: CategoryWidget(provider.categories[index]));//////////////////////////////////////
          });
      }
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: (){
      //  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScrean(),), );
       AppRouter.NavigateToWidget(HomeScrean());
      },
      backgroundColor: Colors.black,
    //  child:const Icon(Icons.add,color: Color.fromARGB(255, 240, 199, 60),),
      child: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_tf6wSv.json'),
      ),
    );
  }
}
