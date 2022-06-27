// ignore_for_file: prefer_typing_uninitialized_variables

class FoodModel {
  final name, type, price, description, id, image;

  FoodModel(
      {required this.name,
      required this.price,
      required this.description,
      required this.id,
      required this.type,
      required this.image});
}
