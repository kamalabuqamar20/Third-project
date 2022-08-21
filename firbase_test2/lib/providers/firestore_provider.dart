//import 'dart:html';

//import 'package:firbase_test2/data/firestore_helper.dart';
import 'dart:io';

import 'package:firbase_test2/data/firestore_helper.dart';
import 'package:firbase_test2/data/storage_helper.dart';
import 'package:firbase_test2/models/category.dart';
import 'package:firbase_test2/models/product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/Advertisement.dart';

class FirestoreProvider extends ChangeNotifier{
  FirestoreProvider(){
    getAllCategories();
  }
 TextEditingController categoryNameController = TextEditingController();
 ///////////////////////////////////////////////////////////////////////
 TextEditingController productNameController = TextEditingController();
 TextEditingController productDescController = TextEditingController();
 TextEditingController productPriceController = TextEditingController();
 TextEditingController productQuantityController = TextEditingController();

 ////////////////////////////////////////////////////////////////////////////
 File? seletedImage;
 List<Category> categories = [] ;
 List<Product> products = [] ;
 ////////////////////////////////////////////////////////////////////////////////////////
 List<Photo> photos = [];
 ///////////////////////////////////////////////////////////////////////////////////////
 selectImagen()async{
 XFile? xfile =await ImagePicker().pickImage(source: ImageSource.gallery);
 seletedImage = File(xfile!.path);
 notifyListeners();
 }
 
  addNewCategory()async{
    if(seletedImage!=null){
  String imageUrl =await  StorageHelper.storageHelper.uploadImage(seletedImage!);
  Category category = Category(name: categoryNameController.text, imageUrl: imageUrl);
  Category newCategory =await FirestoreHelper.firestoreHelper.addNewCategory(category);
  seletedImage = null;
  categories.add(newCategory);
    }
  }
  getAllCategories()async{
categories = await FirestoreHelper.firestoreHelper.getAllCategories();
notifyListeners();
  }
//FirestoreHelper.firestoreHelper.inserDummyDataInFirestore();
updateCategory(Category category)async{
  String? imageUrl;
  if(seletedImage!=null){
      imageUrl =await  StorageHelper.storageHelper.uploadImage(seletedImage!);
  }
  Category newCategory =Category(name:  categoryNameController.text, imageUrl: imageUrl??category.imageUrl);
  newCategory.catId = category.catId;
 await FirestoreHelper.firestoreHelper.updateCategory(newCategory);
// getAllCategories();
int index= categories.indexOf(
  categories.where((element) => element.catId == category.catId).first ) ;
  categories[index]=newCategory;
 
notifyListeners();
}
deleteCategory(Category category)async{
  await FirestoreHelper.firestoreHelper.deleteCategory(category);
  categories.removeWhere((element) => element.catId == category.catId);
  notifyListeners();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
getAllProducts(String catId)async{
  products = await FirestoreHelper.firestoreHelper.getAllProduct(catId);
notifyListeners();
}
addNewProduct(String catId)async{
 if(seletedImage!=null){
  String imageUrl =await  StorageHelper.storageHelper.uploadImage(seletedImage!);
  Product product = Product(
    description: productDescController.text,
    name: productNameController.text,
    price:num.parse(productPriceController.text) ,
    quantity:int.parse(productQuantityController.text) ,
    image: imageUrl

  );
  Product newProduct =await FirestoreHelper.firestoreHelper.addNewProduct(product, catId);
  seletedImage = null;
  products.add(newProduct);
    }
}

updateProduct(Product product,String catId)async{
  String? imageUrl;
  if(seletedImage!=null){
      imageUrl =await  StorageHelper.storageHelper.uploadImage(seletedImage!);
  }
   Product newProduct = Product(
    description: productDescController.text,
    name: productNameController.text,
    price:num.parse(productPriceController.text) ,
    quantity:int.parse(productQuantityController.text) ,
    image: imageUrl??product.image
  );
  newProduct.id= product.id;
 await FirestoreHelper.firestoreHelper.updateProduct(newProduct,catId);
// getAllCategories();
getAllProducts(catId);
//notifyListeners();
}
deleteProduct(Product product,String catId)async{
await FirestoreHelper.firestoreHelper.deleteProduct(product, catId);
getAllProducts(catId);
}

//////////////////////////////////////////////////////////////////////////////////////////////
AddNewPhoto() async {
    // print("selected image: $selectedImage");
    if(seletedImage!=null){
  String imageUrl =await  StorageHelper.storageHelper.uploadImage(seletedImage!);
      Photo photo = Photo(imageUrl: imageUrl);
      Photo newPhoto = await FirestoreHelper.firestoreHelper.addNewphoto(photo);
      seletedImage = null;
      photos.add(newPhoto);
      notifyListeners();
    }
  }

  getAllPhotos() async {
    photos = await FirestoreHelper.firestoreHelper.getAllPhoto();
    notifyListeners();
  }

  updatePhoto(Photo photo) async {
    String? imageUrl;
   if(seletedImage!=null){
  String imageUrl =await  StorageHelper.storageHelper.uploadImage(seletedImage!);
    }
    Photo newphoto = Photo(imageUrl: imageUrl ?? photo.imageUrl);
    newphoto.id = photo.id;
    await FirestoreHelper.firestoreHelper.updatePhoto(newphoto);
    getAllPhotos();
  }

  deletePhoto(Photo photo) async {
    await FirestoreHelper.firestoreHelper.deletePhoto(photo);
    getAllPhotos();
  }
////////////////////////////////////////////////////////////////////////////////////////////////

}