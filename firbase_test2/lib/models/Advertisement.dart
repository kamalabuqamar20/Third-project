//Advertisement
/*class Advertisement{
 late String id;
  late String name;
  late String description;
   late String image;
  late num price;
  late int quantity;
Advertisement({
  required this.name,
  required this.description,
  required this.image,
  required this.price,
  required this.quantity
  });
  Advertisement.fromMap(Map<String , dynamic> map){
    name = map['name'];
    description = map['description'];
    price = map['price'];
    image = map['image'];
    quantity = map['quantity'];
    
  }
  toMap(){
    return{
      'name':name,
      'description':description,
      'price':price,
      'image':image,
      'quantity':quantity,
    };
  }
}*/
class Photo {
  late String id;
  late String imageUrl;
  Photo({required this.imageUrl});
  Photo.fromMap(Map<String, dynamic> map) {
    imageUrl = map["imageUrl"];
  }
  toMap() {
    return {
      "imageUrl": imageUrl,
    };
  }
}