//food items
class Food {
  final String name;               //cheese burger
  final String description;        //a burger full of chesse
  final String imagePath;          //lib/imgage/chesse_burger.png
  final double price;              //60.000
  final FoodCategory category;    // burger
  List <Addons> availableAddons;  // [extra cheese, sauce, extra patty]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}


//food categories

enum FoodCategory{
  burgers,
  salads,
  sides,
  desserts,
  drinks,

}

//food addons

class Addons {
  String name;
  double price;

  Addons({
    required this.name,
    required this.price,
  });
}