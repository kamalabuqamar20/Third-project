import 'package:firbase_test2/providers/auth_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/categories_screan.dart';
import 'package:firbase_test2/veiws/auth/screan/photo_screan/all_photo_screan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: const Color.fromARGB(255, 240, 199, 60),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 199, 60),
        /* leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color: Colors.black,),*/
        leading:  IconButton(onPressed: (){
          Provider.of<AuthProvider>(context,listen: false).signOut();
          }, icon:const Icon(Icons.logout,color: Colors.black,)),
        elevation: 0.0,
        centerTitle: true,
        title:const Text(' Products Screan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    AppRouter.NavigateToWidget(CategoriesScrean());
                  },
                  child: Container(
                      decoration: BoxDecoration(
                              border: Border.all(color:  Colors.black,),
                          borderRadius: BorderRadius.circular(30), 
                          color: const Color.fromARGB(255, 240, 199, 60),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            alignment:Alignment.center ,
                            color: Colors.black,
                            height:200 ,
                            child:const Text('Add Category And Product',style: TextStyle(color:  Color.fromARGB(255, 240, 199, 60),fontSize: 20,fontWeight: FontWeight.bold),),
                            
                            ),
                        ),
                  ),
                ),
              const  SizedBox(height: 30,),
                 InkWell(
                  onTap: (){
                    AppRouter.NavigateToWidget(AllPhotosScreen());
                  },
                   child: Container(
                      decoration: BoxDecoration(
                              border: Border.all(color:  Colors.black,),
                          borderRadius: BorderRadius.circular(30), 
                          color: const Color.fromARGB(255, 240, 199, 60),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            alignment:Alignment.center ,
                            color: Colors.black,
                            height: 200,
                           child:const Text('Add An Add',style: TextStyle(color:  Color.fromARGB(255, 240, 199, 60),fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                        ),
                               ),
                 ),
              ],
            )
            ),
        ),
      ),
    );
  }
}