import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_project/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "A burger with a juicy beef patty, melted cheese, lettuce, tomato, pickles, and sauce.",
      imagePath: "lib/images/burgers/classic_burger.png",
      price: 50.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra cheese", price: 10.000),
        Addons(name: "Bacon", price: 15.000),
        Addons(name: "Avocado", price: 20.000),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "A flavorful burger with a juicy beef patty, smoky BBQ sauce, crispy bacon, melted cheese, fresh lettuce, and tangy pickles, all served in a soft, toasted bun.",
      imagePath: "lib/images/burgers/bbq_bacon_burger.png",
      price: 60.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Onion rings", price: 12.000),
        Addons(name: "Jalapenos", price: 8.000),
        Addons(name: "Mushrooms", price: 10.000),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A delicious burger made with a plant-based patty, fresh lettuce, tomato, pickles, onions, and vegan sauce.",
      imagePath: "lib/images/burgers/veggie_burger.png",
      price: 45.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra avocado", price: 12.000),
        Addons(name: "Vegan cheese", price: 10.000),
        Addons(name: "Grilled onions", price: 8.000),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      description:
          "A unique burger featuring a grilled beef patty, blue cheese, caramelized onions, fresh lettuce, and a rich, tangy blue cheese sauce, all in a soft toasted bun.",
      imagePath: "lib/images/burgers/blue_moon_burger.png",
      price: 65.000,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra blue cheese", price: 15.000),
        Addons(name: "Bacon", price: 15.000),
        Addons(name: "Fried egg", price: 10.000),
      ],
    ),

    //salads
    Food(
      name: "Caesar Salad",
      description:
          "A fresh and crisp salad with romaine lettuce, crunchy croutons, Parmesan cheese, and creamy Caesar dressing.",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 40.000,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Grilled chicken", price: 20.000),
        Addons(name: "Bacon bits", price: 10.000),
        Addons(name: "Extra dressing", price: 5.000),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "A refreshing salad with cucumbers, tomatoes, red onions, Kalamata olives, feta cheese, and a light olive oil dressing.",
      imagePath: "lib/images/salads/greek_salad.png",
      price: 45.000,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Grilled chicken", price: 20.000),
        Addons(name: "Extra feta cheese", price: 10.000),
        Addons(name: "Olives", price: 8.000),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description:
          "A healthy and nutritious salad with quinoa, mixed greens, cherry tomatoes, cucumbers, red peppers, and a lemon vinaigrette dressing.",
      imagePath: "lib/images/salads/quinoa_salad.png",
      price: 50.000,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Grilled chicken", price: 20.000),
        Addons(name: "Avocado", price: 12.000),
        Addons(name: "Toasted almonds", price: 8.000),
      ],
    ),
    Food(
      name: "Asian Sesame Salad",
      description:
          "A vibrant salad with mixed greens, crunchy carrots, cucumbers, red cabbage, and a savory sesame dressing, topped with toasted sesame seeds.",
      imagePath: "lib/images/salads/asian_sesame_salad.png",
      price: 48.000,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Grilled tofu", price: 15.000),
        Addons(name: "Edamame", price: 10.000),
        Addons(name: "Crispy wontons", price: 8.000),
      ],
    ),
    Food(
      name: "Southwest Chicken Salad",
      description:
          "A zesty salad with grilled chicken, black beans, corn, avocado, tomatoes, lettuce, and a creamy Southwest dressing.",
      imagePath: "lib/images/salads/southwest_chicken_salad.png",
      price: 55.000,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra avocado", price: 12.000),
        Addons(name: "Grilled shrimp", price: 20.000),
        Addons(name: "Jalapenos", price: 8.000),
      ],
    ),

    //sides
    Food(
      name: "Sweet Potato Fries",
      description:
          "Crispy and lightly salted sweet potato fries, served with a side of tangy dipping sauce.",
      imagePath: "lib/images/sides/sweet_potato_fries.png",
      price: 35.000,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Garlic aioli", price: 8.000),
        Addons(name: "Cheese sauce", price: 10.000),
        Addons(name: "Bacon bits", price: 12.000),
      ],
    ),
    Food(
      name: "Onion Rings",
      description:
          "Crispy, golden-fried onion rings, seasoned to perfection, served with a tangy dipping sauce.",
      imagePath: "lib/images/sides/onion_rings.png",
      price: 30.000,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "BBQ sauce", price: 8.000),
        Addons(name: "Ranch dressing", price: 8.000),
        Addons(name: "Cheese dip", price: 10.000),
      ],
    ),
    Food(
      name: "Garlic Bread",
      description:
          "Warm, crispy bread topped with rich garlic butter and fresh herbs, perfect as a side dish or appetizer.",
      imagePath: "lib/images/sides/garlic_bread.png",
      price: 25.000,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Cheese", price: 10.000),
        Addons(name: "Bacon bits", price: 12.000),
        Addons(name: "Herb butter", price: 5.000),
      ],
    ),
    Food(
      name: "Loaded Sweet Potato Fries",
      description:
          "Crispy sweet potato fries topped with melted cheese, bacon bits, green onions, and drizzled with a creamy ranch dressing.",
      imagePath: "lib/images/sides/loaded_sweet_potato_fries.png",
      price: 40.000,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Extra cheese", price: 10.000),
        Addons(name: "Guacamole", price: 12.000),
        Addons(name: "Sour cream", price: 8.000),
      ],
    ),

    //desserts
    Food(
      name: "Chocolate Brownie",
      description:
          "A rich and fudgy chocolate brownie, warm and gooey, topped with a dusting of powdered sugar and served with a scoop of vanilla ice cream.",
      imagePath: "lib/images/desserts/chocolate_brownie.png",
      price: 35.000,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Extra chocolate sauce", price: 8.000),
        Addons(name: "Whipped cream", price: 5.000),
        Addons(name: "Ice cream scoop", price: 10.000),
      ],
    ),
    Food(
      name: "Apple Pie",
      description:
          "A warm, flaky crust filled with sweet cinnamon-spiced apples, baked to perfection and served with a scoop of vanilla ice cream.",
      imagePath: "lib/images/desserts/apple_pie.png",
      price: 30.000,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Extra cinnamon", price: 5.000),
        Addons(name: "Whipped cream", price: 5.000),
        Addons(name: "Ice cream scoop", price: 10.000),
      ],
    ),
    Food(
      name: "Red Velvet Lava Cake",
      description:
          "A decadent red velvet cake with a molten chocolate center, served warm with a side of vanilla ice cream and a drizzle of chocolate sauce.",
      imagePath: "lib/images/desserts/red_velvet_lava_cake.png",
      price: 45.000,
      category: FoodCategory.desserts,
      availableAddons: [
        Addons(name: "Extra chocolate sauce", price: 8.000),
        Addons(name: "Whipped cream", price: 5.000),
        Addons(name: "Ice cream scoop", price: 10.000),
      ],
    ),
    //drinks
    Food(
      name: "Lemonade",
      description:
          "A refreshing and tangy lemonade made with freshly squeezed lemons, a hint of sweetness, and served chilled with ice.",
      imagePath: "lib/images/drinks/lemonade.png",
      price: 20.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Mint leaves", price: 3.000),
        Addons(name: "Lemon slice", price: 2.000),
        Addons(name: "Extra sugar", price: 2.000),
      ],
    ),
    Food(
      name: "Iced Tea",
      description:
          "A refreshing, chilled tea served with ice and a splash of lemon, perfect for a cool and revitalizing drink.",
      imagePath: "lib/images/drinks/iced_tea.png",
      price: 18.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Lemon slice", price: 2.000),
        Addons(name: "Mint leaves", price: 3.000),
        Addons(name: "Extra sweetener", price: 2.000),
      ],
    ),
    Food(
      name: "Smoothie",
      description:
          "A thick and creamy smoothie made with fresh fruits, blended with yogurt or juice, served chilled for a refreshing treat.",
      imagePath: "lib/images/drinks/smoothie.png",
      price: 35.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Protein powder", price: 10.000),
        Addons(name: "Chia seeds", price: 5.000),
        Addons(name: "Extra fruit", price: 8.000),
      ],
    ),
    Food(
      name: "Mojito",
      description:
          "A refreshing cocktail with fresh mint leaves, lime juice, rum, and a splash of soda, served with ice for a cool and tangy experience.",
      imagePath: "lib/images/drinks/mojito.png",
      price: 45.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra mint leaves", price: 3.000),
        Addons(name: "Lime wedge", price: 2.000),
        Addons(name: "Rum shot", price: 10.000),
      ],
    ),
    Food(
      name: "Caramel Macchiato",
      description:
          "A rich and creamy espresso-based drink, layered with steamed milk, vanilla syrup, and topped with a drizzle of caramel sauce.",
      imagePath: "lib/images/drinks/caramel_macchiato.png",
      price: 40.000,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra caramel", price: 5.000),
        Addons(name: "Whipped cream", price: 5.000),
        Addons(name: "Almond milk", price: 8.000),
      ],
    )
  ];

  //user cart

  final List<CartItem> _cart = [];

  //deliver address(which user can change/update)
  String _deliveryAddress = 'FPT University';

  /*

   G E T T E R S

   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

   O P E R A T I O N S


   //user cart


  */



  // add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    //if item already exist, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise,add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartItem != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addons addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();

  }
  /*

   H E L P E R S

  */
  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("=========");

    for (final cartItem in _cart ) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");

      }
      receipt.writeln();
    }
    receipt.writeln("========");
    receipt.writeln();
    receipt.writeln("Total Item: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }


  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
 String _formatAddons(List<Addons> addon) {
    return addon.map((addons) => "${addons.name} (${_formatPrice(addons.price)})").join(",");
 }
}
