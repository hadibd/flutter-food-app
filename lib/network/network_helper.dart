import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/network/food_model.dart';

class Network {
  var db = FirebaseFirestore.instance;

  Future<List> getDataByQuery() async {
    var data = [];
    await db.collection('food').get().then((value) {
      for (var element in value.docs) {
        data.add(FoodModel(
            name: element['name'],
            price: element['price'],
            description: element['description'],
            image: element['image'],
            type: element['type'],
            id: element.id));
      }
    });
    return data;
  }

  addToFavorite(docId) {
    db.collection('food_users').doc('email').update({
      'favorite_foods': FieldValue.arrayUnion([docId])
    });
  }

  addToCart(emailId, docId, quantity) {
    db.collection('food_users').doc(emailId).update({
      'user_cart': FieldValue.arrayUnion([
        {'id': docId, 'quantity': quantity},
      ])
    });
  }

  getFavoriteFood(emailId) async {
    // ignore: prefer_typing_uninitialized_variables
    List favoriteFoodID = [], favoriteFood = [];

    await db.collection('food_users').doc(emailId).get().then((value) {
      favoriteFoodID = value['favorite_foods'];
    });

    for (var i = 0; i < favoriteFoodID.length; i++) {
      await db.collection('food').doc(favoriteFoodID[i]).get().then((value) {
        var foodmodel = FoodModel(
            name: value['name'],
            price: value['price'],
            type: value['type'],
            description: value['description'],
            id: favoriteFoodID[i],
            image: value['image']);

        favoriteFood.add(foodmodel);
      });
    }
    return favoriteFood;
  }

  getCartFood(emailId) async {
    List cartFoodId = [], cartFood = [];

    await db.collection('food_users').doc(emailId).get().then((value) {
      cartFoodId = value['user_cart'];
    });

    for (var i = 0; i < cartFoodId.length; i++) {
      await db.collection('food').doc(cartFoodId[i]['id']).get().then((value) {
        // print(cartFood);

        FoodModel foodModel = FoodModel(
            id: value.id,
            name: value['name'],
            type: value['type'],
            price: value['price'],
            description: value['description'],
            image: value['image']);
        cartFood.add(foodModel);
      });
    }
    // print(cartFood);
    return cartFood;
  }

  removeItmeFromFav(emailId, id) {
    db.collection('food_users').doc(emailId).update({
      'favorite_foods': FieldValue.arrayRemove([id])
    });
    print(id);
  }
}
