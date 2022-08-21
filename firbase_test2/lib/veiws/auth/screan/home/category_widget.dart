import 'package:firbase_test2/models/category.dart';
import 'package:firbase_test2/providers/firestore_provider.dart';
import 'package:firbase_test2/router/router.dart';
import 'package:firbase_test2/veiws/auth/screan/home/update_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  // const CategoryWidget({Key? key}) : super(key: key);
  Category category;
  CategoryWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
          color: const Color.fromARGB(255, 240, 199, 60),
          
        ),
          
        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                 height: 250,
                    width: MediaQuery.of(context).size.width,
                child: Image.network(category.imageUrl,fit: BoxFit.cover,)),
                Container(
                  color: Colors.yellow.withOpacity(0.5),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(category.name,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  )),
                  Positioned(
                    top: 10,
                    left: 265,
                    child: CircleAvatar(
                    radius: 20,
                    backgroundColor:Colors.yellow.withOpacity(0.5), 
                    child: IconButton(onPressed: (){
                   Provider.of<FirestoreProvider>(context,listen: false).categoryNameController.text=category.name;
                   // AppRouter.NavigateWithReplacemtnToWidget(UpdateCategory(category));
                   AppRouter.NavigateToWidget(UpdateCategory(category));
                    }, icon:const Icon(Icons.edit,color: Colors.black,)),
                  )),
                  Positioned(
                    top: 65,
                    left: 265,
                    child: CircleAvatar(
                    radius: 20,
                    backgroundColor:Colors.yellow.withOpacity(0.5), 
                    child: IconButton(onPressed: (){
                    Provider.of<FirestoreProvider>(context,listen: false).deleteCategory(category);
                    }, icon:const Icon(Icons.delete,color: Colors.black,)),
                  )),
            ],
          ),
        ) ,
          ),
    ) ;
   
  }
}
/*Column(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(category.imageUrl,fit: BoxFit.cover,)),
          Row(
            children: [
              Text(category.name),
              SizedBox(height: 20,),
              Expanded(
                child: ElevatedButton(onPressed: (){
                  Provider.of<FirestoreProvider>(context,listen: false).categoryNameController.text=category.name;
                  AppRouter.NavigateWithReplacemtnToWidget(UpdateCategory(category));
                },
                child: Text('Edit Category'),
                ),
              ),
              SizedBox(width: 10,),
               Expanded(
                child: ElevatedButton(onPressed: (){
                  Provider.of<FirestoreProvider>(context,listen: false).deleteCategory(category);
                },
                child: Text('Delete Category'),
                ),
              ),
            ],
          )
        ],
      ), */