import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_test2/models/category.dart';

import '../models/Advertisement.dart';
import '../models/product.dart';

class FirestoreHelper{
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
 CollectionReference<Map<String, dynamic>> categoriesCollectionRefrence = FirebaseFirestore.instance.collection('categories');
 /////////////////////////////////////////
 CollectionReference<Map<String, dynamic>>  photosCollectionRefrence = FirebaseFirestore.instance.collection("photos");
 ///////////////////////////////////////
  // final String categoeycollectionName = 'categories';
   Future<Category> addNewCategory(Category category)async{
  DocumentReference<Map<String, dynamic>> documentreference = await categoriesCollectionRefrence.add(category.toMap());
  category.catId = documentreference.id;
  return category;
  }
 Future<List<Category>> getAllCategories()async{
 QuerySnapshot<Map<String, dynamic>> querySnapshot = await categoriesCollectionRefrence.get();
 List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
 List<Category>categories=documents.map((e) {
 Category category =  Category.fromMap(e.data());
 category.catId=e.id;
 return category;
 
   }).toList();
  return categories;
  }
  ////////////////////////////////////////////////////
 
  //////////////////////////////////////////////////
  deleteCategory(Category category)async{
   await categoriesCollectionRefrence.doc(category.catId).delete();
  }
  updateCategory(Category category)async{
   await categoriesCollectionRefrence.doc(category.catId).update(category.toMap());
  }
  //////////////////////////////////////////////////////////////////////////////////////
Future<Product> addNewProduct(Product product,String catId)async{
DocumentReference<Map<String, dynamic>> documentReference =
 await FirebaseFirestore.instance.collection('categories').
 doc(catId).
 collection('products').
 add(product.toMap());
 product.id = documentReference.id;
 return product;
  }
 Future<List<Product>> getAllProduct(String catId)async{
 QuerySnapshot<Map<String, dynamic>> querySnapshot= await FirebaseFirestore.instance.collection('categories').doc(catId).collection('products').get();
 List<Product>products = querySnapshot.docs.map((e) {
  Product product = Product.fromMap(e.data());
  product.id =e.id;
  return product;
 }).toList();
 return products;
  }
  updateProduct(Product product,String catId)async{
await FirebaseFirestore.instance.collection('categories').doc(catId).collection('products').doc(product.id).update(product.toMap());
  }
  deleteProduct(Product product,String catId)async{
await FirebaseFirestore.instance.collection('categories').doc(catId).collection('products').doc(product.id).delete();
  }
  // inserDummyDataInFirestore()async{FirebaseFirestore firestoreInstance
  //   firebaseFirestore.collection(categoeycollectionName).add({
  //     "nameAr":"طعام",
  //     "nameEn":"Food",
  //     "imageUrl":"http://image.jpg"
  //   });
  // }
 /* addUserToFirestore(String )async{

  }*/

  //Advertisement
  /////////////////////////////////////////////////////////////////////////////////////
  addNewphoto(Photo photo) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await photosCollectionRefrence.add(photo.toMap());
    photo.id = documentReference.id;
    return photo;
  }

  Future<List<Photo>> getAllPhoto() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await photosCollectionRefrence.get();
    List<Photo> photos = querySnapshot.docs.map((e) {
      Photo photo = Photo.fromMap(e.data());
      photo.id = e.id;
      return photo;
    }).toList();
    return photos;
  }

  deletePhoto(Photo photo) async {
    await photosCollectionRefrence.doc(photo.id).delete();
  }

  updatePhoto(Photo photo) async {
    await photosCollectionRefrence.doc(photo.id).update(photo.toMap());
  }
  ////////////////////////////////////////////////////////////////////////////
}