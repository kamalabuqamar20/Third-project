import 'package:firbase_test2/models/product.dart';
import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/category_widget.dart';
import 'package:firbase_test2/veiws/auth/screan/home/home_screan.dart';
import 'package:firbase_test2/veiws/product_screan/add_product_screan.dart';
import 'package:firbase_test2/veiws/product_screan/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  
  String catId;
  ProductsScreen(this.catId);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  //const CategoriesScrean({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),
        elevation: 0.0,
        centerTitle: true,
        title:const Text(' Products Screan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),),
      body: Consumer<FirestoreProvider>(
      builder: (x,provider,y) {
        return 
        provider.products.isEmpty?
       const Center(child: CircularProgressIndicator(),):
       /////////////////////////////////////////////////////////////////////////////////////////
       
        ListView.builder(
          //scrollDirection: Axis.horizontal,
          itemCount: provider.products.length,///////////////////////////////////////////////////
        //  separatorBuilder: (context, index) => SizedBox(width: 20,),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
               // AppRouter.NavigateToWidget(NewProduct(provider.categories[index].catId));
              },
              child: ProductWidget(provider.products[index],widget.catId));//////////////////////////////////////
          });
        /////////////////////////////////////////////////////////////////////////////////////
      }
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: (){
      //  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScrean(),), );
      AppRouter.NavigateToWidget(NewProduct(widget.catId));
      },
     backgroundColor: Colors.black,
      //child:const Icon(Icons.add,color:  Color.fromARGB(255, 240, 199, 60),),
      child: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_tf6wSv.json'),
      ),
    );
  }
}
/*
ListView.builder(
          itemCount: provider.products.length,///////////////////////////////////////////////////
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
               // AppRouter.NavigateToWidget(NewProduct(provider.categories[index].catId));
              },
              child: ProductWidget(provider.products[index],catId));//////////////////////////////////////
          });
*/

/*
import 'package:firbase_test2/models/product.dart';
import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/category_widget.dart';
import 'package:firbase_test2/veiws/auth/screan/home/home_screan.dart';
import 'package:firbase_test2/veiws/product_screan/add_product_screan.dart';
import 'package:firbase_test2/veiws/product_screan/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  
  String catId;
  ProductsScreen(this.catId);
  //const CategoriesScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
         leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),
        elevation: 0.0,
        centerTitle: true,
        title:const Text(' Products Screan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),),
      body: Consumer<FirestoreProvider>(
      builder: (x,provider,y) {
        return 
        provider.products.isEmpty?
       const Center(child: CircularProgressIndicator(),):
       /////////////////////////////////////////////////////////////////////////////////////////
       
        ReorderableListView(
          children: [
            ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: provider.products.length,///////////////////////////////////////////////////
            //  separatorBuilder: (context, index) => SizedBox(width: 20,),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                   // AppRouter.NavigateToWidget(NewProduct(provider.categories[index].catId));
                  },
                  child: ProductWidget(provider.products[index],catId));//////////////////////////////////////
              }),
              
          ],
          onReorder: (oldIndex, newIndex) {
            
          },
        );
        /////////////////////////////////////////////////////////////////////////////////////
      }
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: (){
      //  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScrean(),), );
      AppRouter.NavigateToWidget(NewProduct(catId));
      },
      backgroundColor: Colors.black,
      child:const Icon(Icons.add,color:  Color.fromARGB(255, 240, 199, 60),),
      ),
    );
  }
}
*/